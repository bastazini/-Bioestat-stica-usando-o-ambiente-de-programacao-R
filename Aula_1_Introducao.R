### Introducao a linguagem R
### Operadores

# <- ou -> ou = - Atribuir
# + - Somar
# - - Subtrair
# * - Multiplicar
# / - Dividir
# $ - Selecionar de componentes
# [] - Indexar
# [[]] - Indexar
# ^ - Potencia
# : - Sequencia
# ~ - Formula estatistica
# %nome% - Operacoes especiais
# < - Comparar
# > - Comparar 
# <= - Comparar 
# >= - Comparar 
# == - Comparar 
# != - Comparar
# ! - Nao
# & - E
# | - Ou

### Palavras especiais

# Inf - Infinito
# NaN - Indeterminado (Not a Number)
# NA - Indeterminado (Not Avaiable)

#Citando o R
citation()

### Operacoes basicas

### Operacoes aritmeticas

2+2
8-3
3*8
8/2
(2*4)/7
2^8


### Gerar numeros
#sequencias
1:10
9:11
1:900
c(3,5,6)

#sequencias específicas
#sequencia de 1-10, pulando 2 numeros
seq(from=1,to=10,by=2)

#sequencia dividido em tamanhos iguais
seq(from=1,to=10,length.out=14 )

#repetir um numero n vezes
rep(3,6)
rep(1:4,each=4)


### Funções
#objetos que são utilizados para realizar operações

sqrt(4)
factorial(3)
log(10)
log(10,base=10)
abs(4-9)

### Ajudas

?log
??log
help.search("Log")
RSiteSearch("logarithms")# abre uma página na internet,
example(log)


### Criando Objetos
###Objetos: estruturas de dados contendo informações, e
a=3
b=2
a*b
minha.cor=amarelo
minha.cor

##Vetores
#seqüência de valores numéricos ou de caracteres
#atribuição = ou <- ou ->
numeros=c(2,5,6,7,2,3,5,0,10,1)
numeros
numeros<-c(2,5,6,7,2,3,5,0,10,1)
numeros
c(2,5,6,7,2,3,5,0,10,1)->numeros
numeros

letras=c("a","b","c","d")
letras
cores=c("verde","preto","amarelo","branco")
cores


##Matrizes
#coleção de vetores em linhas e colunas, todos os vetores dever ser do mesmo tipo 
dados_1=matrix(1:20,nrow=5,ncol=4)
dados_1

##Dataframes 
#mesmo que uma matriz, mas aceita vetores de tipos diferentes (numérico e caracteres)
dados_2=data.frame(1,1:5,5:1,"M")
dados_2
dados_3=data.frame(cbind(A=sample(letters,5),B=sample(1:50,5),C=sample(400:450,5)))
dados_3
dados_4=data.frame(letras,cores,1:4);dados_4
dados_4

##Listas
#conjunto de vetores, dataframes ou de matrizes. Não precisam ter o mesmo comprimento, é a forma que a maioria das funções retorna os resultados.
#Boa parte dos resultados das funções vem em listas
lista=list(dados_1,dados_2, dados_3, dados_4, numeros);lista
lista

#Reconhecendo a classe de objetos
class(dados_1)
class(numeros)
class(cores)species interaction networks
class(dados_3)
class(lista)
is.numeric(dados_3)
is.data.frame(dados_3)

### Indexecao
# Vetores
numeros
numeros[8]
numeros[6:8]
cores
cores[c(1,3,4)]

# Matrizes
#informar linha e coluna

dados_1
dados_1[1,1]
dados_1[4,2]

### Operacoes com objetos

numeros
numeros^3
#Somatório
sum(numeros)
#Valor minimo de um vetor
min(numeros)
#Valor maximo de um vetor
max(numeros)
#raiz quadrada
sqrt(numeros)
#log
log(numeros)
mean(numeros)
#Desvio padrão
sd(numeros)
#Comprimento de um vetor
length(numeros)
#Dimensão de uma matrix
dim(dados_1)
dim(dados_2)
#somatorio de uma coluna de uma matrix
colSums(dados_1)
#somatorio de uma liha de uma matrix
rowSums(dados_1)
#media de uma linha de uma matrix
rowMeans(dados_1)
#intervalos específicos
sum(numeros[2:3])
sum(dados_1[1:3,1:2])


### Dados aleatorios e amostras
#Distribuição Uniforme
runif(5,min=0,max=10)
#Distribuição normal
rnorm(100,mean=0,sd=1)
#Distribuição Poisson
rpois(5,lambda=1)
#Amostrar  valores aleatorios em uma sequencia
sample(1:100,size=4)
#Amostrar  valores aleatorios em uma sequencia, com reposição
sample(1:10,size=4,replace=TRUE)
#Amostrando dados categoricos
moeda=c("cara","coroa")
moeda
sample(moeda,1)
sample(moeda,10,replace=TRUE, prob=c(0.85,0.50))


### Ordenar
numeros
sort(numeros)
sort(numeros,decreasing=TRUE)
order(numeros)#dá a posição dos valores ordenados dentro do vetor

dados_3=data.frame(cbind(A=sample(letters,5),B=sample(1:50,5),C=sample(400:450,5)))
dados_3
dados_3[order(dados_3[,3]),]
dados_3[order(dados_3[,3],dados_3[,2]),]

### Operações logicas

valor=0.83
valor
valor<0.9 # Menor (> para maior)
valor<=0.83 # Menor ou igual (>= para maior ou igual)
valor==9 # valor exatamente igual
valor!=0.8 # valor diferente de
0<=valor & valor<=0.1 # Dois criterios aditivos
0<=valor | valor<=0.1 # Dois criterios, um ou outro



### Listar e remover objetos
#Listar tudo que está disponível
ls()
#remover um objeto específico
rm(moeda)
rm(list=ls()) # Remove todos objetos
ls()

### Instalar e carregar pacotes
#Para intalar
install.packages("vegan")
#Para carregar
library(vegan)
require(vegan)

### Entrada de dados

# Os formatos mais comuns para entrada de dados são .txt, .csv, .xls e .xlsx.
# Para a importação de dados no formato Excel e necessario o pacote gdata.

# read.table para arquivos .txt
# Arquivos .txt não podem ter celulas vazias, pois o R não consegue entender a disposição dos dados
# read.csv para arquivos .csv
# Arquivos .csv podem ter celulas vazias
# read.xls para arquivos .xls e .xlsx
# o argumento sheet indica qual das planilhas do você quer carregar


### Diretório de trabalho

getwd() # Ver diretorio
dir() # Ver o conteudo do diretorio
#definir o diretorio
setwd("/Users/...") 


#com R trabalhando na mesma pasta
dados=read.table("dados.botanica.txt",header=T,row.names=1)
dados
aves1=read.table("aves.txt",header=T,row.names=1)
#separando dados de aves e ambiente
names(aves1)
ambiente=aves1[,1:5];ambiente
dim(aves1)
aves=aves1[,6:35];aves


# Escolher arquivo  em outro diretorio

dados=read.table(file.choose(), h=T,row.names=1)#Mac
dados=read.table(choose.files(), h=T,row.names=1)#Windows

#Copiar e colar
dados.teste<-read.table("clipboard", h=T) # Windows
dados.teste<-read.table(pipe("pbpaste",h=T)) # Mac

### Editar dados

dados1<-matrix(1:25,5,5);dados1
dados2=edit(dados1);dados2


### Exportar resultados 

# Tabelas completas

write.table(dados2,"dados_editado.txt")
write.csv(dados2,"dados_editado.csv",sep=";")

# Exportando Resultados para vizualizacao

res_1=c("Meus dados");res_1
res_2=dados;res_2
res_3=c("Soma");res_3
res_4=colSums(dados1);res_4
res_5=list(min(dados1),max(dados1))
res_5
# Expostar em txt

sink("res.txt")
res_1
res_2
res_3
res_4
res_5
sink()


# Exportar lista em texto
dput(res_5, file = "res_5.txt") # Para exportar
dget(file = 'res_5.txt') # Para importar a mesma lista


### Manipular dados

X=data.frame(a = runif(10), b = runif(10),c = runif(10))
X
Y=data.frame(a = rnorm(10),d=rnorm(10))
Y
Z=rpois(30,lambda=1)
Z

# Nomes das linhas e colunas

colnames(X)
rownames(X)
colnames(Y)
colnames(Y)=c("adulto","plantula")
colnames(Y)
names(Z)
names(Z)=1:30
names(Z)


# Por linhas ou por colunas

cbind(Z)
rbind(Z)
plantas=1:30
mam=30:1
teste=rbind(plantas,mam)

# Filtrando dados
#Há valores = 1 no meu vetor?
Z==1
#Quais observações tem valores =1
which(Z==1)
#Há valores menor ou igual a 0.5?
X<=0.5
#Quais?
which(X<=0.5)

# Excluir coluna especificando o nome
X[,-which(colnames(X)=="a")]

#excluir colunas com NAs
#criar um data frame
dados_5=data.frame( SP1 = sample(1:10), SP2 = rep( NA , 10 ) , SP3 = sample( c( 1:10 , NA ) , 10 , repl = TRUE ) )
dados_5

novos.dados=Filter(function(x)!all(is.na(x)), dados_5)
novos.dados

#Substituindo NAs por zeros
dados_5[is.na(dados_5)]=0
dados_5

# Adicionar uma coluna 
X1=cbind(X,f=rep(NA,nrow(X)));X1

#Adicionar uma linha 
X2=rbind(X,f=rep(NA,ncol(X)));X2


# Mudar a ordem das colunas
names(X)
H=X[,c(3,1,2)]
names(H)

#Transformar um fator em variaveis dummies
dummies=model.matrix( ~ Tipo - 1, data=dados );dummies
class(dummies)
dados.dummies=cbind(dados$Riqueza,dummies);dados.dummies
colnames(dados.dummies)[1]="Riqueza"
dados.dummies

# Unir tabelas
#Primeiro, criar 3 tabelas
Y1=cbind(ID=LETTERS[11:20],Y)
Y1
Y2=cbind(ID=LETTERS[1:10],Y)
Y2
Y3<-cbind(ID=LETTERS[1:10],Y)
Y3
# Unir duas tabelas
merge(Y3,Y1,all = TRUE)
# Unir tabelas com prioridade para a primeira
merge(Y3,Y1,all.x=TRUE) 
# Unir tabelas por um criterio em comum, no caso ID
merge(Y3,Y2,by="ID") 



##Categorizar valores
#iflse elemneto condicional de seleção
names(dados)
#categorizar Temperatura
median(dados[,4])
ifelse(dados[,4]<19.392,yes=1,no=2)
ifelse(dados[,4]<19.392,yes="Frio",no="Quente")
#Categorizar condicional
#presença da especie se o a temperatura for maior que a mediana
ifelse(dados[,7]==1 | dados[,4]>=19.3 ,yes=1,no=2)


# avaliando variaveis por fatores
#tapply aplicar uma função sobre um conjunto de dados
tapply(dados$Riqueza,INDEX=dados$Tipo,FUN=mean)
tapply(dados$Riqueza,INDEX=dados$Tipo,FUN=max)
table(dados$Riqueza)

#Olhando para partes de um objeto:
##objeto[linhas, colunas]

aves[5, ]  #Mostra apenas a linha 5
aves[ ,3]   #Mostra apenas a coluna 3

aves[ ,"Anas_georgica"] #O mesmo que acima, mas usando o nome da coluna

aves[2, "Anas_georgica"]  #Aqui pedimos a abundancia da espécie no  sitio 2

aves[1:5, ]  #Mostra as linhas 1 a 5


#Também vale para variáveis!
dados=as.data.frame(dados)
dados$Precipitacao >1000  

dados$Tipo=="Dense"

####
#Comparando:
mean(dados$Riqueza[dados$Tipo=="Dense"])
mean(dados$Riqueza[dados$Tipo=="Mixed"])

#Um jeito mais eficiente:
#tapply(variável quantitativa, variável categórica, o que eu quero saber)
tapply(dados$Riqueza, dados$Tipo, mean)

#Outros exemplos:
tapply(dados$Riqueza, dados$Tipo, sd)
tapply(dados$Riqueza, dados$Tipo, quantile)


### Salvar e carregar workspace
### Salvar
save.image("meu_workspace")
#carregar
load("meu_workspace")

### Carregar funcoes ou scripts

source( "minhas_funcoes.R" )

### Fechar o R

q()
