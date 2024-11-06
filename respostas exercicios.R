#############respostar exercicios
#3.7
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

##4.4
library(dplyr)
car_crash=read.csv("C:\\Users\\beatr\\Downloads\\Brazil Total highway crashes 2010 - 2023.csv")
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
car_crash %>% filter(automovel>=5 | moto>=3) %>% glimpse()
#Filtre as observações com vítimas.
car_crash %>% filter(tipo_de_ocorrencia=="com vítima") %>% glimpse()
#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente E que ocorreram em alguma das seguintes operadoras: “Autopista Regis Bittencourt”, “Autopista Litoral Sul”, “Via Sul”.
car_crash %>% filter(automovel>=5 | moto>=3, lugar_acidente==c("Autopista Regis Bittencourt", "Autopista Litoral Sul", "Via Sul")) %>% glimpse()

##4.5

starwars


#Qual é o número total de espécies únicas presentes? Qual a frequência de indivíduos por espécie?
# Número total de espécies únicas
starwars %>% 
  select(species) %>% 
  summarise(total_especies = n_distinct(species, na.rm = TRUE)) 

# Frequência de indivíduos por espécie
starwars %>% 
  select(species) %>% 
  group_by(species) %>% 
  summarise(frequencia = n()) %>% 
  arrange(desc(frequencia))

#Calcule a altura média de personagens masculinos e femininos.
# Altura média para personagens masculinos
altura_media_masculino <- starwars %>% 
  filter(gender == "masculine", !is.na(height)) %>% 
  summarise(altura_media_masculino = mean(height)) %>% 
  pull(altura_media_masculino)

# Altura média para personagens femininos
altura_media_feminino <- starwars %>% 
  filter(gender == "feminine", !is.na(height)) %>% 
  summarise(altura_media_feminino = mean(height)) %>% 
  pull(altura_media_feminino)

# Exibindo os resultados
altura_media_masculino
altura_media_feminino


#Qual é a média de idade dos personagens de cada espécie para personagens masculinos?
# Média de idade dos personagens masculinos por espécie
media_idade_masculinos <- starwars %>% 
  select(species, birth_year, gender) %>% 
  filter(gender == "masculine", !is.na(birth_year)) %>% 
  group_by(species) %>% 
  summarise(media_idade = mean(2024 - birth_year, na.rm = TRUE))
media_idade_masculinos


#Para cada espécie presente na base de dados, identifique o personagem mais velho e sua idade correspondente.
starwars %>% select(name, birth_year, species) %>% #seleciona as colunas
  group_by(species) %>% 
  mutate(primeiro_especie=max(birth_year, na.rm = T)) %>% #cria uma nova coluna
  filter(primeiro_especie==birth_year) #filtra as variaveis

# Personagem mais velho por espécie
personagem_mais_velho <- starwars %>% 
  select(name, species, birth_year) %>% 
  filter(!is.na(birth_year)) %>% 
  group_by(species) %>% 
  slice_min(birth_year, with_ties = FALSE) %>% 
  mutate(idade = 2024 - birth_year) %>% 
  select(species, name, idade)
personagem_mais_velho

##4.7
car_crash=read.csv("C:\\Users\\beatr\\Downloads\\Brazil Total highway crashes 2010 - 2023.csv")
#Utilizando o banco de dados car_crash formate a coluna data em uma data (dd-mm-yyyy);
car_crash %>% select(data) %>% mutate(new_data=(as.Date(data, format="%d/%m/%Y")))

#Utilizando o banco de dados car_crash formate a coluna horario para o horário do acidente (hh:mm:ss)
car_crash %>% select(horario) %>% mutate(new_horario=(as.Date(horario, format="%h:%m:%s")))


#Qual o mês com maior quantidade de acidentes?
car_crash %>%
  mutate(mes = format(data, "%m")) %>%
  group_by(mes) %>%
  summarise(total_acidentes = n()) %>%
  arrange(desc(total_acidentes)) %>%
  slice(1)
# Verificar o tipo de dado da coluna 'data'
str(car_crash$data)



#Qual ano ocorreram mais acidentes?

#Qual horário acontecem menos acidentes?

#Qual a média, desvio padrão, mediana, Q1 e Q3 para a quantidade de indivíduos classificados como levemente feridos por mês/ano?

#Quantos acidentes com vítimas fatais aconteceram, por mês/ano, em mediana entre as 6:00am e 11:59am.

##4.9

#Para vôos com atraso superior a 24 horas em flights, verifique as condições climáticas em weather. Há algum padrão? Quais os meses do ano em que você encontra os maiores atrasos?

#Encontre os 20 destinos mais comuns e identifique seu aeroporto. Qual a temperatura média (mensal) em Celcius desses lugares? E a precipiração média, em cm?

#Inclua uma coluna com a cia aérea na tabela planes. Quantas companhias áreas voaram cada avião naquele ano?

#Inclua a latitude e longitude de cada origem destino na tabela flights.