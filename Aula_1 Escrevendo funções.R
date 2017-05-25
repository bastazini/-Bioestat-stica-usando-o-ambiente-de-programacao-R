## Estrutura das funcoes

# Nome da funcao
# Expressao - function()
# Argumentos, dentro dos parenteses
# Chaves - {}
# Comandos, dentro das chaves
# Comando return() ainda dentro das chaves com o objeto de saida dentro dos parentes

minha_funcao = function(argumento1,argumento2,argumento3,...){
  comando_1
  comando_2
  comando_3
  ...
  return(resultado)
}
#escrevendo funções simples com R
#Função dobro
dobro=function(x){
  (x)*2
}

dobro(2)
vetor=c(1,2,3,4,5,6,7,8,9)
dobro(vetor)
dados_6=matrix(1:20,nrow=5,ncol=4);dados_6
dobro(dados_6)

##Criando uma função para calcular média
#Vamos gerar uma variavel chamada Riqueza para utilizar
riqueza=rpois(500,lambda=5);riqueza

###media
minha.media=function(x){
  soma=sum(x)
  numeros_de_valores=length(x)
  resultado=soma/numeros_de_valores
  return(resultado)
}
minha.media(riqueza)
mean(riqueza)

#Inserindo argumentos  True e False
minha.media2<-function(x,texto=TRUE){
  soma<-sum(x)
  numeros_de_valores<-length(x)
  media<-soma/numeros_de_valores
  if(texto==TRUE){
    resultado<-paste("A media dos meus valores e:", media)
  }
  else{
    resultado<-media
  }
  return(resultado)
}
minha.media2(riqueza)
minha.media2(riqueza,texto=F)



#Função para ver estaticas descritivas de uma variavel
est.descrit=function(x){
  print(summary(x))
  print(mean(x))
  print(sd(x))
  print(quantile (x,c(0.025, 0.5,0.975)))
  par(mfrow=c(1,3))
  hist(x)
  plot(density(x))
  boxplot(x,horizontal=T)
}

est.descrit(riqueza)

### Encontrar outliers
outliers = function(x) {
  abs(x-mean(x,na.rm=TRUE)) > 2*sd(x,na.rm=TRUE)
}

meus.outliers=outliers(riqueza)
table(meus.outliers)


####Diversidade

#Shannon-Wienner
shannon=function(x){
  x<-x[x>0]
  p<-x/sum(x)
  -sum(p*log(p))
}

#Simpson
simpson=function(x){
  p<-x/sum(x)
  1-sum(p^2)
}
abundancia=rpois(50,lambda=5);abundancia
shannon(abundancia)
simpson(abundancia)

ShannonSim=function(x){
  x=x[x>0]
  p=x/sum(x)
  H=-sum(p*log(p))
  S=1-sum(p^2)
  resultado<-c(H,S)
  return(resultado)
}

ShannonSim(abundancia)

#Aplicar a função sobre uma matrix
#usando os dados de dados
#para as linhas
apply(aves, 1, FUN=ShannonSim)
#para as colunas
apply(aves, 2, FUN=minha.media)

