### Graficos
#Pacotes que vamos precisar
install.packages(c("phangorn","png"), dependencies = T)
# Ver ajudar ?par
?par
#Ver cores
demo(colors)

#dados
aves
ambiente=t(ambiente)
names(ambiente)

#grafico correlacao
plot(ambiente)

##Graficos de dispersão
#Riqueza de aves por Cob. vegetal
plot(ambiente[,2],rowSums(aves))
plot(rowSums(aves)~ambiente[,2])

#Inserindo eixos
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal")
#Inserindo Titulo Geral
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Efeito da Cobertura Vegetal")
##Inserindo Titulo Geral, alterando tamanho da fonte do titulo
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9)
#alterando simbolos de dispersão pch
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=17)
#Alterando as cores do simbolo
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=17,col="red")
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey")
#alterando tamanho do simbolo
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey",cex=0.8)
#alterando tamnho da fonte do eixo  cex.lab=1.2
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey",cex=0.8,cex.lab=1.2)
#alterando tamanho dos valores do eixo cex.axis=0.7
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey",cex=0.8,cex.lab=1.1,cex.axis=0.7)
#alterando orientação do eixo vertical
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey",cex=0.8,cex.lab=1.1,cex.axis=0.7,las=1)
#alterando os limites dos eixos
plot(rowSums(aves)~ambiente[,2],ylab="Abundancia de aves",xlab="Cobertura vegetal",main="Grafico",cex.main=0.9,pch=21,col="black",bg="grey",cex=0.8,cex.lab=1.1,cex.axis=0.7,las=1,ylim=c(0,60),xlim=c(0,70))

#Graficos de linha
plot(dados$Temperatura,type="l", xlab="Sitio", ylab="Riqueza")
#Grossura da linha
plot(dados$Temperatura,type="l", xlab="Sitio", ylab="Riqueza",lwd=10)
#cor linha
plot(dados$Temperatura,type="l", xlab="Sitio", ylab="Riqueza",lwd=3, col="red")
#Multiplas linhas
plot(aves$Vanellus_chilensis, type="l", xlab="Sítio",lwd=3, col="red")
lines(aves$Plegadis_chihi, lwd=3, col="blue")
lines(aves$Anthus_lutescens, lwd=3, col="darkgreen")

#Adicinar legenda
legend("topright",pch=15,c("Vanellus","Pelgadis","Anthus"),col=c("red","blue","darkgreen"))
legend("bottomright",pch=15,c("Vanellus","Pelgadis","Anthus"),col=c("red","blue","darkgreen"))


#Grafico de dispersão 3d
require(scatterplot3d)
scatterplot3d(ambiente$S,ambiente$Cob.veg,rowSums(aves))

#graficos de densidade
D<-rnorm(1000)
D
density(D)
plot(density(D),main="Grafico densidade",xlab="",ylab="Densidade")
abline(v=mean(D))
abline(h=0)

#Histogramas
hist(D,main="Histograma",ylim=c(0,250),xlim=c(-4,4),xlab="Valores",ylab="Frequencia")
#inserindo a média
points(mean(D),0,col="red",pch=19)
#inserindo quantis
points(quantile(D,c(0.05,0.95)),c(0,0),col="blue",pch=17)
#inserindo legendas
legend("topright",pch=c(19,17),c("media","quantilis"),col=c("red","blue"))
#inserindo segmento na média
segments(mean(D),0,mean(D),250,col="red")
#inserindo os 3 quantis
segments(quantile(D,c(0.05,0.95)),c(0,0),quantile(D,c(0.05,0.95)),c(250,250),col="blue")
box()


#Graficos de barras
#criar uma tabela com a contagem da riqueza por tipo florestal
contagem=tapply(dados$Riqueza,INDEX=dados$Tipo,FUN=mean)
contagem
barplot(count, main="", horiz=T,
        xlab="Riqueza média", beside=T, las=2)

##Boxplot

boxplot(dados$Riqueza~dados$Tipo)

boxplot(dados$Riqueza~dados$Tipo,data=dados,
        ylab = "", xlab = "", main = "",
        las = 1,
        col = "blue",#cor da caixa
        border = "red",#cor da borda
        whiskcol = "black",#cor da suiça
        staplecol = "green",#cor da linha suiça
        outcol = "red",#cor do autliers
        medcol = "black",#cor da mediana

names = c("Denso","Temperado", "Tropical"))

#Criando painel com multiplos gráficos
#determinar o numero de gráficos
par(mfrow=c(2,2))
plot(density(dados$Riqueza))
hist(dados$Riqueza)
plot(dados$Riqueza~dados$Precipitacao)
plot(dados$Riqueza~dados$Temperatura)
par(mfrow=c(1,1))
#dev.off()

### Escrever textos e funções
#Criar um grafico vazio
plot(0,0,axes=F,cex=0,xlab="",ylab="",xlim=c(0,1),ylim=c(0,1))
#escrever texto
text(0.5,1,"Escrevendo texto")
text(0.5,0.8,paste("A","B","C","D",sep=":"))
#inserir uma expressão matemática
text(0.5,0.5,expression(paste( f(x) == frac(1,sqrt(2*pi)*sigma)~ plain(e)^frac(-(x-mu)^2,2*sigma^2))))



####Outras possibilidades

# Figuras em graficos

require(png)

#### outros gráficos
#arregar imagem
ima <- readPNG("imagem.png")
#Definir área do plot
plot(1:17, type='n', main="", xlab="Horário", ylab="Número de Visitações")

#G#recuperar informação do gráfico
lim <- par()
rasterImage(ima, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
grid()
lines(c(7, 9,11, 13,15,17), c(3, 9,12, 10,14,7), type="b", lwd=5, col="darkblue")

### Exportar graficos

pdf("Graficos_1.pdf", width=6,height=6)
plot(density(rnorm(100)))
dev.off()

pdf("Graficos_2.pdf", width=6,height=6)
plot(density(rnorm(100,sd=2)))
plot(density(rnorm(100,sd=3)))
plot(density(rnorm(100,sd=4)))
dev.off()




