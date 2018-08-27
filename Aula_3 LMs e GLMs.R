### Modelos Lineares
rm(list=ls()) # Remove todos objetos

### Dados ficticios
Diversidade=c(60, 55, 53, 44, 32, 30, 25, 41, 22, 18, 11, 12)
Precipitacao=c(600, 542,  343,  324,  225,  416,  227,  178,  119, 10, 11, 12)
a=as.factor(c(1, 1, 1,1, 1, 1, 2, 2, 2, 2, 2, 2))

setwd("/Users/yourfile") 

arvores=read.table("dados.botanica.txt",header=T,row.names=1)
arvores
aves1=read.table("aves.txt",header=T,row.names=1)
#separando dados de aves e ambiente
names(aves1)
ambiente=aves1[,1:5];ambiente
dim(aves1)
aves=aves1[,6:35];aves



#Correlaçoes
#entre duas variaveis
cor(ambiente$Cob.veg,ambiente$Prof.agua)

#matriz de correlação
cormat=cor(ambiente)  
cormat


#p-valores  de correlação
#par a par
cor.test(ambiente$Prof.agua,ambiente$Cob.veg)

#Para matrizes de correlação
install.packages("Hmisc",dependencies = T)
require(Hmisc)
correlacao =rcorr(as.matrix(ambiente), type="pearson");correlacao
plot(ambiente)

#rede de correlação
install.packages("qgraph")
require(qgraph)
qgraph(cormat, shape="circle", posCol="darkgreen", negCol="darkred", layout="groups", vsize=10)

###Regressões
#simples
modelo=(lm(Diversidade~Precipitacao))
plot(Precipitacao,Diversidade, xlab="Precipitacao",ylab="Diversidade")
abline(modelo)
summary(modelo)


#prediçoes
predict(modelo,list(Precipitacao=c(670,800,900)),interval = "confidence")
#Linhas de IC95% no grafico
#Como há poucos pontos geramos valores
novos.valores= seq(min(Precipitacao), max(Precipitacao), 0.1)

IC95=predict(modelo, newdata=data.frame(Precipitacao=newx), interval="confidence") 
lines(novos.valores,IC95[,2], lty=3,col="red")
lines(novos.valores,IC95[,3], lty=3, col="red") 

#extraindo resíduos
names(modelo)
residuos=modelo$residuals;residuos
ajustado=modelo$fitted.values

#slopes Padronizados
#usando scale
modelo2=lm(scale(arvores$Riqueza)~scale(arvores$Temperatura)+scale(arvores$Precipitacao))
#ou
#utilizando pacote lm.beta
install.packages("lm.beta")
library(lm.beta)
modelo2=lm(arvores$Riqueza~arvores$Temperatura+arvores$Precipitacao)
lm.beta(modelo2)



#multiplas
require(vegan)
aves1=(decostand(aves,"pa"))
riqueza=rowSums(aves1)
modelo.multi=(lm(riqueza~Prof.agua*Cob.veg,data=ambiente))
summary(modelo.multi)       
       
# Anova fatorial (randomizado)
modelo1 = aov(arvores$Riqueza ~ arvores$Tipo)
summary(modelo1)
summary.lm(modelo1)
anova(modelo1)
#anova usando lm
modelo1 = lm(arvores$Riqueza ~ arvores$Tipo)
#observe os valores estimados e as médias
tapply(arvores$Riqueza,arvores$Tipo,mean)
boxplot(arvores$Riqueza ~ arvores$Tipo)


#Exemplo 2
Diversidade=c(32,21,30,20,10,31,22,9,32,12,21,8,34,24,11,36,24,10,35,27,8,36,20,9,29,22,12,35,21,9)
fator=as.factor(rep(1:3,10))
modelo2 = aov(Diversidade ~ fator)
summary(modelo2)
summary.lm(modelo2)
boxplot(Diversidade ~ fator, names=c("Nivel 1","Nivel 2","Nivel 3"))
posthoc =TukeyHSD(modelo2,ordered = TRUE);posthoc
plot(posthoc)

#Magnitude do efeito
#mostra o efeito em relação a media global
plot.design(Diversidade ~ fator)
model.tables(modelo2,se=T)

# ANOVA Bi-fatorial

 
y=c(60, 55, 53, 44, 32, 30, 25, 41, 22, 18, 11, 12)
a=as.factor(c(1, 1, 1,1, 1, 1, 2, 2, 2, 2, 2, 2))
b=as.factor(c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2))
modelo3 = aov(y ~ a*b)
summary.lm(modelo3)
posthoc =TukeyHSD(modelo3,ordered = TRUE);posthoc

# interação plot
interaction.plot(a,b, y, type="b",col=c(1:3),leg.bty="o", leg.bg="beige", lwd=2, pch=c(18,24,22),  xlab="fator",  ylab="resposta", main="Plot de Interacao")



# Bloco aleatório(B =bloco) 

modelo2a = aov(y ~ a + Error(b))
summary(modelo2a)




# ANCOVA
modelo4 = aov(arvores$Riqueza~ arvores$Tipo + arvores$Precipitacao)
summary(modelo4)
summary.lm(modelo4)





###Regressões Logistica###
sobrevivencia=c(1,1,1,0,0,0,1,1,1,0,0,1)
tamanho=c(11,13,9,8,9,12,10,15,14,8,9.5,11)
dat=as.data.frame(cbind(tamanho,sobrevivencia))
modeloglm=(glm(sobrevivencia~tamanho,family="binomial",dat))
summary (modeloglm)
plot(tamanho,sobrevivencia, xlab="Tamanho corporal ",ylab="Probabilidade de sobrevivencia")
dat=as.data.frame(cbind(tamanho,sobrevivencia))
curve(predict(modeloglm,data.frame(tamanho=x),type="resp"),add=TRUE)
points(tamanho,fitted(modeloglm),pch=20)

###modelo misto
campo=as.factor(rep(1:4,each=12));campo
bloco=as.factor(rep(rep(1:6,each=2),4));bloco
diversidade=abs(rnorm(48))
gado=rpois(48,7)
dados.misto=as.data.frame(cbind(diversidade,bloco,campo,gado))
dados.misto

require(nlme)
mod.lme=lme (diversidade~gado, random=~1|campo/bloco, method= "ML")
mod.lme
#extrair coeficientes
coef(mod.lme)


#grafico
with (dados.misto, plot(gado,diversidade))
mapply(abline,a=coef(mod.lme)[,1],b=coef(mod.lme)[,2], col=1:10)


