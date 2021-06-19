
# Mostrando como escrever no script
2+1


# Atribuindo valor
a <- 8

# Comentando linha
#z = 4


# Comentando bloco
"x <- 5

y <- 2^3"

# Salvando environment
save.image("C:\\caminho_para_pasta_de_preferencia\\meu_workspace.RData")

save.image("C:/caminho_para_pasta_de_preferencia/meu_workspace.RData")

# Utilizando funcao
# nome_da_funcao(argumento1 = valor1, argumento2 = valor2, ...)

# Utilizando funcao seq para gerar um vetor
d <- seq(1: 100)

# Tamanho/comprimento
length(d)

length(seq(1: 100))

# pegando um elemento de um vetor
d[5]

# pegando uma sequencia de elementos de um vetor
d[1:3]
d[45:65]
d[c(seq(2, 20))]

d[length(d)]

# acessando o help
??logarithm

# outra forma de acessar o help
help(log)


# instalando o um pacote
install.packages("janitor")
install.packages("dplyr")

# carregando o pacote ja instalado
library(janitor)
library(dplyr)


# trabalhando com vetor
v1 <- seq(1:10)

# mudando um elemento de um vetor
v1[3] <- 200

# criando um vetor de caractere
nomes <- c("Claudia", "Bruno", "Simone")

# criando vetores para gerar um data frame
v6 <- 11:15
v7 <- seq(0.3, 0.7, by=0.1)
v8 <- rep("CEPERJ", 5)
v9 <- rep(c(TRUE, FALSE), 5)

# definindo data frame
df1 <- data.frame(v6, v7, v8, v9)

# concatenando os vetores
concat <- c(v6, v7, v8, v9)
concat


# criando uma sequencia de numeros impares
impares <- seq(1, 99, by=2)


# Importando dados csv

install.packages("readr")
library(readr)

# importanto arquivo csv
tb_tx_mort_infantil <- read_csv(file="C:/Users/claud/Documents/Cursos/Ministrados/EGPP/01 - Introdução com R/TMI_Aula2.csv")


# importando arquivo csv utilizando encoding para corrigir os caracteres especiais
tb_tx_mort_infantil <- readr::read_csv("https://raw.githubusercontent.com/brunolucian/cursoBasicoR/71de395a83f40736e5ea4f908209f960305c8173/datasets/taxa_mortalidade.csv",locale = locale(encoding = "latin1"))


# Outra forma de ler o arquivo utilizando função do pacote basedo R
df <- read.table("https://raw.githubusercontent.com/brunolucian/cursoBasicoR/71de395a83f40736e5ea4f908209f960305c8173/datasets/taxa_mortalidade.csv",
                 header = T,
                 sep = ",")


# limpando os nomes das variaveis e colocando no formato mais adequado para manipular os dados
tb_tx_mort_infantil <- janitor::clean_names(tb_tx_mort_infantil)

#
?read_csv

# Acessando as variáveis dentro da base tb_tx_mort_infantil
tb_tx_mort_infantil$taxa <- tb_tx_mort_infantil$totobit/tb_tx_mort_infantil$obit_n
# a variavel "tb_tx_mort_infantil$totobit" esta no formato caractere


# Transformando a variavel "tb_tx_mort_infantil$totobit" em numerica
tb_tx_mort_infantil$totobit <- as.numeric(tb_tx_mort_infantil$totobit)

# Calculando taxa e armazenando na base de dados
tb_tx_mort_infantil$taxa <- tb_tx_mort_infantil$totobit/tb_tx_mort_infantil$obit_n

# verificando em qual diretorio o arquivo vai ser salvo
getwd()

# salvando o arquivo no computador
write.csv(tb_tx_mort_infantil, "tb_tx_mort_infantil.csv")

# Removendo a primeira coluna da base tb_tx_mort_infantil
teste <- tb_tx_mort_infantil[,-1]

# Removendo a terceira linha da base tb_tx_mort_infantil
teste <- tb_tx_mort_infantil[-3,]

