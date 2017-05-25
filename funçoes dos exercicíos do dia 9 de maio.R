##Exercício 11
cubo.raiz=function(x,raiz=TRUE){
  cubo=x*x*x
  raiz=sqrt(x)
  resultados=c(cubo,raiz)
  return(resultados)
}
cubo.raiz(2)

##Exercício 12
cubo.raiz2<-function(x,raizq=TRUE){
  cubo=x^3
  raiz=sqrt(x)
  if(raizq==TRUE){
    resultado<-c(cubo,raiz)
  }
  else{
    resultado<-cubo
  }
  return(resultado)
}
cubo.raiz2(2)

##Exercício 13
#gerar dados
meus.dados=matrix(rep(0:9,each=5),10,5);meus.dados
meus.dados2=c(1,4,5,0,9,0,7,6,0,2,0,0)

transf.quali=function(x){
  ifelse(x==0,yes=0,no=1)
}
transf.quali(meus.dados)

teste=transf.quali(meus.dados2)
teste


