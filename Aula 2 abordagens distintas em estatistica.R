##Abordagens distintas em estatitsica
# Exemplo Análise de Variância usando abordagem Frequentista, Seleção de modelos (e inferência multi-modelos) e abordagem Bayesiana

#gerar dados
#Numero de furtos produzidos em dois tipos diferentes de sitios
frutos.produzidos=c(12,10,9,9,11,12,8,9,23,21,14,23,26,21)
#fator sitio com dois niveis (e.g., campo e floresta)
fator=as.factor(c(1,1,1,1,1,1,1,2,2,2,2,2,2,2))


#Frequentista
modelo.anova=aov(y~x)
summary(modelo.anova)

#boxplot
boxplot(teste~fator, names = c("Nivel 1","Nivel 2", "Nivel 3"),ylab="Produção de frutos")
  

#Seleção de modelos
install.packages("bbmle")
require(bbmle)
H1=lm (frutos.produzidos~fator)
H0=lm (frutos.produzidos~1)
AICctab(H1,H0, nobs=14,base=T,weights=T)


##Bayesiana
require(MASS)
y=frutos.produzidos
x=fator
ymg = tapply(y,x,mean);ymg
# variância
variancia =tapply(y,x,var);variancia



# número de observações em cada sitio (np)
#número total de observações (n) 
#número de níveis do fator “sitio” (niveis):
np = tapply(y,x,length)
n = sum(np)
niveis = length(np)
#cálculo da variância (Se2) 
#matriz diagonal (Vμ), 
s2hat <- sum((np-1)*variancia)/(n-niveis)
Vmu <- diag(1/np)
#Para a simular da distribuição posterior, definimos quantidade de amostras desejada
m = 5000
# amostra da precisão
tau <- rgamma(m,(n-niveis)/2,s2hat*(n-niveis)/2)
# amostra do desvio padrão (σ)
sigma <- sqrt(1/tau)
med.post <- numeric()
# calculo da média posterior
for(i in 1:m) med.post <- rbind(med.post,mvrnorm(1,as.numeric(ymg),Vmu/tau[i]))
#Um exemplo de sumário estatístico para a amostra da posterior do desvio padrão (σ) seria:
c(quantile(sigma,prob=c(0.025,0.5,0.975)),media=mean(sigma),dp=sd(sigma))
#intervalo de credibilidade (ICr95%) compreende então valores entre 1.46 e 3.18. 
#Sumários estatísticos para os efeitos dos quatro níveis do fator “sitio”
for(i in 1:ncol(med.post)) {print(c(quantile(med.post[,i],prob=c(0.025,0.5,0.975)),  media=mean(med.post[,i]),dp=sd(med.post[,i]))) }
# Distribuição posterior.
plot(density(med.post[,1]),xlim=c(0.65,0.85),lwd=3,ylim=c(0,300),xlab="frutos produzidos",ylab= "Density", main="")
lines(density(med.post[,2]),lwd=3,col="red")
lines(density(med.post[,3]),lwd=3,col="darkgreen")
#A probabilidade de que μ2 seja maior que μ1 equivale a:
sum(med.post[,2]>med.post[,1])/m
legend("topright",pch=15,c("Nivel 1","Nivel 2"),col=c("black","red"))

