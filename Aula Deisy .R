((((((((()))))))))
?mean
help("sd")
install.packages("ggplot2")
??mean
vignette("ggplot2")

########
#operadores aritimeticos

x <- 23
y <- 8

x+y
x-y
x*y
x/y
x**y 
x%%y ##modulo
x%/%y #divisao_inteira

###operadores relacionais

x==y
x!=y
x>y
x<y
x>=y
x<=y

##arredondamento
round(pi)
ceiling(pi)
floor(pi)
trunc(pi)

##vetores

vetor<- c(1,2,3,4,5,6,7)

vetor[6]
vetor[2:4]
vetor2<-c("a", "e", "i", "o", "u")
vetor3<-c(8,9,10,11,12,13,14)
vetor+vetor3
vetor-vetor3
vetor*vetor3
vetor/vetor3
class(vetor2)
is.integer(vetor2)
#tem mais is... like a quenstion

as.character(vetor)
#tem mais as... convertando tal para tal

altura<-c("1"=12,
          "2"=78,
          "3"=96,
          "4"=6)
class(altura)
attributes(altura)
names(altura)

#seq e rep

seq(1,50)
seq(from=100, 
    to=10, 
    by=-5)

rep(c(1, 2, 3), times = 3)
rep(c(1, 2, 3),each = 3)

#numeros aleatorios

runif(9)
n<-c(1,2,3,4,5,6,7,8,9)
l<-c("a", "b", "c", "d")
sample(l)
sample(n, size=11, replace=T)

##modificar

altura
altura[4]<-88
altura[2]<-NA
altura[-1]
append(altura, value=c("5", 189), after=2)
al2<-c("b" =8.5,
      "c" = 9.6)
altura<-c(altura, al2)
altura

#opecacao vetor
sum(vetor)
mean(vetor3)
sqrt(vetor)
length(vetor)
sort(vetor)
rev(vetor3)
unique(vetor3)

###########################################
vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = 16,
     col="light blue")


x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "b")  

#########################################
nomes = c("Maria", "Ana", "Rafaela")

paste(nomes[1], "e", nomes[2], "são minhas amigas.")
paste(nomes[1], nomes[2], nomes[3], sep = "|")
paste(nomes, collapse = " ")
toupper(nomes)
tolower(nomes)
substr(x = nomes[1], start = 1,stop = 3)
gsub(pattern = "G", 
     replacement = "R",
     x = "Gato")

#############################inf diretorio e arq

getwd()
#read. le arquivos, seja de excel, texto padrao, etc

##############

data(iris)
iris
summary(iris)

################################matriz
matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

A <- matrix(c(1:9), 
            ncol = 3,
            byrow = TRUE)
A
A[,3]
A[which(A>5)]

############data frame

# Exemplo de criação de Data Frame
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)

df<-data.frame(x=c(1:10),y=LETTERS[1:10])
df
meu_data_frame$nome
str(meu_data_frame)
class(meu_data_frame)
meu_data_frame[,"idade"]
meu_data_frame$idade
meu_data_frame[,-2] #exclue tao coluna
meu_data_frame$Bolo=c(T,F,F,T,T,T,F,F) #adiciona coluna
meu_data_frame
subconj=subset(meu_data_frame,idade>28)
subconj2=subset(meu_data_frame, idade>18 | !Bolo) #& é e, | é ou
dim(meu_data_frame)
nrow(meu_data_frame)
ncol(meu_data_frame)
summary(meu_data_frame)
result=by(meu_data_frame$salario, meu_data_frame$Bolo, mean)
genero=factor(c("masculino","feminino","masculino","feminino"))
estadiamento_doenca <- factor(c("Estágio I", "Estágio II", "Estágio I", "Estágio III", "Estágio IV"), 
                              levels = c("Estágio I", "Estágio II", "Estágio III", "Estágio IV"))

str(meu_data_frame)
meu_data_frame$genero = as.factor(meu_data_frame$genero)

meu_data_frame$genero
# Definindo fator com níveis específicos
cores <- factor(c("Vermelho", "Verde", "Azul"), levels = c("Vermelho", "Verde", "Azul", "Amarelo"))
cores
# Acessar níveis de um fator
niveis_cores <- levels(cores)
niveis_cores

##############tabela dupla entrada

# Exemplo de criação de tabela de dupla entrada
sexo <- c("Masculino", "Feminino", "Masculino", "Masculino", "Feminino")
cidade <- c("A", "B", "A", "B", "A")
tabela_contingencia <- table(sexo, cidade)
tabela_contingencia

tabela_contingencia2 <- table(meu_data_frame$meio_de_transporte, meu_data_frame$genero)
tabela_contingencia2

#######lendo dados externos
Queimadas_Q1 <- read.csv("/home/est/bao24/Downloads/Dataset_FireWatch_Brazil_Q1_2024.csv")
Queimadas_Q1
head(Queimadas_Q1)
Queimadas_Q2=read.csv("/home/est/bao24/Downloads/Dataset_FireWatch_Brazil_Q2_2024.csv")
Queimadas_Q3=read.csv("/home/est/bao24/Downloads/Dataset_FireWatch_Brazil_Q3_2024.csv")
Queimadas_Q2
Queimadas_Q3
head(Queimadas_Q2)
head(Queimadas_Q3)
Queimadas=rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
Queimadas
dim(Queimadas)
write.csv(Queimadas, "/home/est/bao24/Downloads/Queimadas.csv")


######exercicio
#Imprima na tela as 9 primeiras observaÃ§Ãµes.
head(Queimadas, n=9)

#Imprima as Ãºltimas 3 observaÃ§Ãµes.
tail(Queimadas, n=3)

#Quantas observaÃ§Ãµes temos?
nrow(Queimadas)

#Quantas variÃ¡veis temos?
ncol(Queimadas)

#Apresente o sumÃ¡rio dos dados.
summary(Queimadas)

#Apresente a estrutura dos dados.
str(Queimadas)

#Quantos biomas estÃ£o sendo afetados?
unique(Queimadas$bioma)
length(unique(Queimadas$bioma))
Queimadas$bioma=factor(Queimadas$bioma)
Queimadas$bioma
nlevels(Queimadas$bioma)
levels(Queimadas$bioma)

#Qual a mÃ©dia de avg_numero_dias_sem_chuva para os estados da regiÃ£o sul e da regiÃ£o norte?
sul=toupper(c("Parana","Santa Cataria", "Rio grande do sul"))
sul=subset(Queimadas, estado%in%sul)
mean(sul$avg_numero_dias_sem_chuva)

norte=c("acre", "amazonas", "para", "rondonia", "roraima")
norte=subset(Queimadas, estado%in%norte)
mean(norte$avg_numero_dias_sem_chuva)

######data table

install.packages("data.table")
library(data.table)
# Criar um data.table
mdt<- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
mdt

# Importar um data.table e comparando o tempo de importação com o read.csv

system.time(Queimadas <- fread("/home/est/bao24/Downloads/Queimadas.csv"))
system.time(Queimadas <- read.csv("/home/est/bao24/Downloads/Queimadas.csv"))
# Selecionar colunas e filtrar linhas
resultado <- mdt[idade > 25, .(nome, salario)]
resultado

# Agregar dados 
agregado <- mdt[, .(media_salario = mean(salario)),]
agregado

####tibble

require(tibble)
install.packages("tibble")

#####################tidyverse

install.packages("tzbd")
install.packages("timechange")
library(timechange)
dados=data.table::fread("/home/est/bao24/CE302/Mental Health Dataset.csv")
head(dados)
glimpse(dados)
Poland=subset(dados, Country=="Poland")
Poland

#####Pipes
sort(cos(unique(x)), decreasing=T)
x=seq(1:10)
y=sqrt(x)
z=log(y)
z
#ou
log(sqrt(x))
#ou pipe
require(magrittr)
x%>%
  unique()%>%
  cos()%>%
  sort(decreasing = T)

set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)     

set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)     

require(dplyr)

meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

glimpse(meu_data_frame)

car_crash=data.table::fread("/home/est/bao24/CE302/Brazil Total highway crashes 2010 - 2023.csv.gz")
glimpse(car_crash)

car_crash %>% 
  select(data, tipo_de_acidente) %>% 
  head()

car_crash %>% 
  select(starts_with("tipo")) %>% 
  head()

car_crash %>% 
  select(ends_with("feridos")) %>% 
  head()

car_crash %>% 
  select(contains("mente")) %>% 
  head()

vars_interesse = c("automovel", "bicicleta", "onibus")
car_crash %>% 
  select(all_of(vars_interesse)) %>% 
  glimpse()

#############################################
#4.4
library(dplyr)
#Selecione as variáveis data, tipo_de_ocorrencia, automovel, bicicleta, onibus, caminhao, moto, trator, outros e total.
car_crash %>% 
  select(data, tipo_de_ocorrencia, automovel, bicicleta, onibus, 
         caminhao, moto, outros) %>%
  head()
#Selecione todas as variáveis que contenham a palavra feridos.
car_crash %>% select(contains("feridos")) %>% glimpse()
#Selecione todas as variáveis numéricas.
car_crash %>% select(where(is.numeric)) %>% glimpse()
#Selecione todas as variáveis lógicas.
car_crash %>% select(where(is.logical)) %>% glimpse()
#Selecione todas as variáveis que terminem com a letra o.
car_crash %>% select(ends_with("o")) %>% glimpse()
#Selecione todas as variáveis que iniciem com a letra t.
car_crash %>% select(starts_with("t")) %>% glimpse()
#Filtre as observações com pelo menos 5 carros E 3 motos envolvidos no acidente.
car_crash %>% filter(automovel>=5, moto>=3) %>% glimpse()
#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente.
#Filtre as observações com vítimas.
#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente E que ocorreram em alguma das seguintes operadoras: “Autopista Regis Bittencourt”, “Autopista Litoral Sul”, “Via Sul”.

#4.5

starwars
  
#Qual é o número total de espécies únicas presentes? Qual a frequência de indivíduos por espécie?
starwars %>% select(name, birth_year, species) %>% #seleciona as colunas
  group_by(species) %>% 
  mutate(primeiro_especie=max(birth_year, na.rm = T)) %>% 
  filter(primeiro_especie==birth_year) #filtra as variaveis
#Calcule a altura média de personagens masculinos e femininos.

#Qual é a média de idade dos personagens de cada espécie para personagens masculinos?
  
#Para cada espécie presente na base de dados, identifique o personagem mais velho e sua idade correspondente.

####string to date

data_string <- "2023-08-21"# String representando uma data
data <- as.Date(data_string)# Transformando a string em data
print(data)# Exibindo a data

data_string <- "21/08/2023"
data <- as.Date(data_string, 
                format = "%d/%m/%Y")
print(data)

data <- as.Date("2023-08-21")
data_formatada <- format(data, "%d/%m/%Y")

data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
diferenca <- difftime(data1, data2, units = "days")  # Diferença em dias

#lubridate

require(lubridate)

data_ymd <- ymd("2023-08-21")
data_mdy <- mdy("08-21-2023")
data_dmy <- dmy("21-08-2023")

print(data_ymd)
print(data_mdy)
print(data_dmy)

data <- ymd("2023-08-21")
data_nova <- data + days(7)  # Adiciona 7 dias
data_anterior <- data - months(2)  # Subtrai 2 meses

print(data_nova)
print(data_anterior)

data <- ymd_hms("2023-08-21 15:30:45")
ano <- year(data)
mes <- month(data)
dia <- day(data)
hora <- hour(data)
minuto <- minute(data)
segundo <- second(data)

print(ano)
print(mes)
print(dia)
print(hora)
print(minuto)
print(segundo)

#4.7


#Utilizando o banco de dados car_crash formate a coluna data em uma data (dd-mm-yyyy);

car_crash %>% select(data) %>% mutate(new_data=(as.Date(data, format="%d/%m/%Y"))) %>% dmy


#Utilizando o banco de dados car_crash formate a coluna horario para o horário do acidente (hh:mm:ss)

#Qual o mês com maior quantidade de acidentes?
  
#Qual ano ocorreram mais acidentes?
  
#Qual horário acontecem menos acidentes?
  
#Qual a média, desvio padrão, mediana, Q1 e Q3 para a quantidade de indivíduos classificados como levemente feridos por mês/ano?
  
#Quantos acidentes com vítimas fatais aconteceram, por mês/ano, em mediana entre as 6:00am e 11:59am.

####juncao de dados
library(dplyr)
require(nycflights13)
#Uma chave primária é uma variável ou conjunto de variáveis que identifica cada observação de forma única
#Uma chave estrangeira é uma variável (ou conjunto de variáveis) que corresponde a uma chave primária em outra tabela

planes %>% 
  count(tailnum) %>%
  filter(n > 1)

flights2 <- flights %>% 
  filter(distance > 2000) %>% 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2

#join é funcao de junção
#left join junta da esquerda para a direita e o right da dirieta para a esquerda
flights2_airlines = 
  flights2  %>% 
  left_join(., airlines)
#inner é a intersesao, só os em comuns e full é a uniao, tudo
# Semi-junções mantêm todas as linhas em x que têm uma correspondência em y.
airports %>% 
  semi_join(flights2, join_by(faa == origin))

#Anti-junções são o oposto: elas retornam todas as linhas em x que não têm correspondência em y.
flights %>%
  anti_join(airports, join_by(dest == faa)) %>% 
  distinct(dest)

#####################################pivotagem
library(tidyverse)
library(magrittr)
library(tzdb)
table1

#pivot wider
table1 %>% 
  select(country, year, cases) %>% 
  pivot_wider(names_from = year, values_from = cases, #names= colunas, values=valores
              values_fill = 0, values_fn = max) #fill= completa os NA com oq eu quero, fn=aplica funcao dentro dos valores

table1 %>% 
  pivot_longer(cols = c(cases, population), # variaveis que eu quero pivotar, oq eu quero empilhar
               names_to = "variavel", #nome da coluna 
               values_to = "tamanho") #nome dos valores

table3

separated = table3 %>% 
  separate(rate, into = c("cases", "population")) #separa uma coluna em duas
separated

separated %>% 
  unite("1", cases, population, sep = " ") #une duas colunas, rate é o nome da nova coluna e sep é como eu quero juntar

#exemplo
library(data.table)
TB=fread("/home/est/bao24/Downloads/TB.csv.gz")
names(TB)
TB1 <- TB %>% 
  pivot_longer(
    cols = -c(1:4), 
    names_to = "chave", 
    values_to = "casos", 
    values_drop_na = TRUE
  )
TB1

TB1 %>% count(chave)
TB1 %<>% filter(chave %like% "^new")
TB2 <- TB1 %>% 
  mutate(chave = stringr::str_replace(chave, "newrel", "new_rel"))
TB2
TB3 <- TB2 %>% 
  separate(chave, c("new", "type", "sexage"), 
           sep = "_")
TB3
TB4 <- TB3 %>% 
  select(-new, -iso2, -iso3)
TB5 <- TB4 %>% 
  separate(sexage, c("sexo", "idade"), sep = 1)
TB5

###########################str
texto_multilinhas <- "Primeira linha\nSegunda linha\nTerceira linha"
str_view(texto_multilinhas)
texto_tabulado <- "Primeira coluna\tSegunda coluna\tTerceira coluna" 
str_view(texto_tabulado)

##################################




