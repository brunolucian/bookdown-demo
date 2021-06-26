
# Condicionais

#### if ####

camisa <- "rosa"

# Mostrando como imprimir algo quando uma condicao
# eh satisfeita
if (camisa == "rosa"){
  print("camisa rosa eh bonita")
}


valor <- 75

impares <- seq(1, 200, by=2)

pares <- seq(0, 200, by=2)


# Condicional verificando a classe de um objeto
if (class(pares) == "numeric"){
  sum(pares)
}

# Verificando duas condicoes simultaneas
pares[50]
impares[50]
if(pares[50] > 90 && impares[50] > 100){
  pares[50] + impares[50]
}

# Verificando se pelo menos uma das duas condicoes
# eh satisfeita
if(pares[50] > 90 || impares[50]>100){
  pares[50] + impares[50]
}


#### if - else ####

# Mostrando como executar coisas distintas de acordo
# com a condicao
if(pares[50] > 90 && impares[50]>100){
  pares[50] + impares[50]
}else{
  print("uma das condicoes nao foi satisfeita")
}

if(class(pares) != "numeric"){
  print("tipo do objeto incompativel")
}else{
  sum(pares)
}

camisa <- "vermelha"

# O objetivo, neste exemplo, foi demonstrar que o que
# precisa ser executado nao necessariamente e o que
# esta dentro dos parenteses, outros objetos podem
# ser manipulados ou ate mesmo criados dentro do
# comando, caso a condicao seja satisfeita
if(camisa != "vermelha"){
  print("camisa bonita")
  a <- 4
  c <- a + 2
}else{
  print("prefiro camisa vermelha")
  c <- 5
  b <- 10
}
a
b


#### if - else if - else ####

tempo <- sample(1:60, 1)
tempo

# Demosntrando como encadear diversos if - else
if(tempo > 35){
  print("tempo de espera muito longo")
}else if(tempo >= 24){
  print("tempo de espera longo")
}else if(tempo >15){
  print("tempo de espera razoavel")
}else{
  print("tempo de espera curto")
}

valor <- 36

if (valor == 0){
  print("valor igual a zero")
}else if(valor %% 2 == 0){
  print("valor eh um numero par")
}else{
  print("valor eh um numero impar")
}

#### for ####

result <- c()

# Definindo os elementos de um vetor utilizando
# um iterador
for(i in 1:10){
  result[i] <- pares[i]*impares[i]
  #print(result[i])
}


result2 <- c()

length(pares)
length(impares)

# Definindo os elementos de um vetor utilizando
# um iterador (com o auxilio da funcao 'length')
for(i in 1:length(pares)){
  result2[i] <- pares[i]*impares[i]
  #print(result[i])
}

# Criando uma matriz vazia
matriz <- matrix(nrow = 20, ncol = 20)

# Definindo os elementos da matriz
for(i in 1:dim(matriz)[1]){
  for(j in 1:dim(matriz)[2]){
    matriz[i,j] <- i*j
  }
}


# Demosntracao de como utilizar um iterador
# considerando o nome das variaveis
myList <- 1:26
names(myList) <- LETTERS
for(name in names(myList)){
  print(name)
}


#### while ####

a <- 1
while(a <= 10){
  a <- a + 1
}
a


vetor <- c(1:15, 30:45)
soma <- 0
i <- 1
# Utilizando iterador para calcular a soma dos ele-
# mentos de um vetor
while(i <= length(vetor)){
  soma <- soma + vetor[i]
  i <- i + 1
}
soma

#### Funcoes ####

# Retorna o maior valor entre dois numeros
maior <- function(a, b){
  if(a < b){
    return(b)
  }else{
    return(a)
  }
}
maior(a,b)
maior(3,9)
maior()

# Definindo um valor padrao p o argumento b
maior <- function(a, b = 7){
  if(a < b){
    return(b)
  }else{
    return(a)
  }
}
maior(a,b)
maior(3)

# Retorna a soma de 2 valores
soma2val <- function(a, b){
  return(a + b)
}
soma2val(a, b)
soma2val(35, 12)

# Retorna a media de um vetor de inteiros
media_vetor <- function(x){
  med <- sum(x)/length(x)
  return(med)
}
media_vetor(pares)
media_vetor(impares)


# Retorna a sequencia de Fibonacci
fibo <- function(n){
  # vetor com a quantidade de elementos
  fib <- numeric(n)
  
  # definindo os dois primeiros elementos
  fib[1] <- 0
  fib[2] <- 1
  
  # definindo os valores dos elementos subsequentes
  for(i in 3:n){
    fib[i] <- fib[i-1] + fib[i-2]
  }
  return(fib)
}
fibo(10)

#### Demonstração: variaveis locais e globais ####
# (Ambiente)
y <- 10
soma_xy <- function(x){
  return(x + y)
}
soma_xy(a)


y <- -68
soma_xy(a)


soma_xz <- function(x){
  return(x + z)
}
soma_xz(a)