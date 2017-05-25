###Análise multivariada

rm(list=ls())#limpar


setwd("/Users/bastazini/Dropbox/Estatistica Botanica/Dados") 

arvores=read.table("dados.botanica.txt",header=T,row.names=1)
arvores
aves1=read.table("aves.txt",header=T,row.names=1)
#separando dados de aves e ambiente
names(aves1)
ambiente=aves1[,1:5];ambiente
dim(aves1)
aves=aves1[,6:35];aves
atributos=read.table("atributos.txt",header=T,row.names=1)

#Calculando distancias e similaridades
distancias=dist(atributos)
aves2=decostand(aves,"pa")
similaridade=vegdist(aves2,"jac",d=T)
?dist
?vegdist

#Extraindo distancias de uma arvore
#distancai cofnética->Dissimilaridade intergrupo em que as duas observações são primeiramente combinadas em um único cluster

install.packages("ape")
require(ape)
filogenia=rcoal(10)
write.tree(filogenia)
plot(filogenia)
cophenetic(filogenia)


#Cluster
require(vegan)
dis = dist(aves, "euclidean")
tree = hclust(dis, "average")
plot(as.dendrogram(tree))
plot(as.dendrogram(tree), type="triangle")
#definir grupos arbitrários 
groups = cutree(tree, k=) 
# exibir grupos arbitrarios
rect.hclust(tree, k=2, border="red") 

#plotando filogenias
plot(filogenia,type="cladogram")
plot(filogenia,type="fan")
plot(filogenia,type="unrooted")
plot(filogenia,type="radial")

#Tutoriais que ajudam a editar os graficos cluster
#https://rpubs.com/gaston/dendrograms




##########Tutoriais que ajudam a editar os graficos de ordenação
#http://www.fromthebottomoftheheap.net/2012/04/11/customising-vegans-ordination-plots/
#https://joey711.github.io/phyloseq/plot_ordination-examples.html
#http://www.fromthebottomoftheheap.net/2013/01/12/decluttering-ordination-plots-in-vegan-part-1-ordilabel/
#######

#NMDS
require(vegan)
#2 eixos, 100 iteraçoes 
NMDS=metaMDS(aves,k=2,trymax=100)
#plot Stress
stressplot(NMDS)

#grafico
ordiplot(NMDS,type="n")
ordihull(NMDS,groups=tratamento,draw="polygon",col="grey90",
         label=T)
orditorp(NMDS,display="species",col="blue",air=0.01)
orditorp(NMDS,display="sites",cex=1.25,air=0.01)
tratamento=(c("Campo","Campo","Campo","Campo","Duna","Duna","Duna","Duna"))
ordihull(NMDS,groups=tratamento,draw="polygon",col="grey90",
         label=T)
##Plotando variaveis ambientais
names(ambiente)
attach(ambiente)
ajuste=envfit(NMDS~Alt.veg+Cob.veg+Cob.agua)
plot(ajuste,col="darkred")
ajuste
names(NMDS)
meus.pontos=NMDS$points


#PCA
#scale padroniza os valores da variavel->correlação
pca.ambiente <- rda(ambiente, scale = TRUE)
biplot(pca.ambiente, scaling = 3)
summary(pca.ambiente)
#extrair scores
PCA=scores(pca.ambiente)
#extrair só os valores dos sitios
PCAsitio=PCA$sites
#extrair só a PCA 1
PCA1=PCAsitio[,1]

#utilizando numa anova
fator=c("C","C","C","C","D","D","D","D")
mod=aov(PCA1~fator)
summary.lm(mod)

#CA
ca=(cca((aves)))
plot(ca)
summary(cca(aves))
ordiplot(ca,type="n")
ordihull(ca,groups=tratamento,draw="polygon",col="grey90",
         label=T)
orditorp(ca,display="species",col="darkblue",air=0.01)
orditorp(ca,display="sites",cex=1.25,air=0.01)
tratamento=(c("Campo","Campo","Campo","Campo","Duna","Duna","Duna","Duna"))
ajuste=envfit(ca~Alt.veg+Cob.veg+Cob.agua)
plot(ajuste)


#CCA
cca.aves <- cca(aves, ambiente)
plot(cca.aves)
summary(cca.aves)
anova.cca(cca.aves)

ordihull(ccca.aves,groups=tratamento,draw="polygon",col="grey90",
         label=T)
orditorp(cca.aves,display="species",col="darkblue",air=0.01)






##teste de procrustes

library(MASS)
aves.dist = vegdist(decostand(aves,"hell"))
amb.dist = vegdist(decostand(ambiente,"standardize"),"euclidian")
pcoa.aves = cmdscale(aves.dist)
pcoa.amb = cmdscale(amb.dist)
aves.proc = procrustes(pcoa.amb, pcoa.aves)
aves.proc
summary(aves.proc)
protest(amb.dist, aves.dist, permutations = 999)
par(mfrow=c(1,3))
plot(pcoa.aves)
plot(pcoa.amb)
plot(aves.proc,main="")
plot(aves.proc, kind=2,main="")
residuals(aves.proc)

##teste de mantel
aves.dist = vegdist(aves)
amb.dist = vegdist(decostand(ambiente,"standardize"),"euclidian")

teste.mantel= mantel(aves.dist,amb.dist,method="pearson", permutations=9999);teste.mantel


