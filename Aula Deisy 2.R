###########conteudo prova2
#estrurura de repeticoes, looping


i <- 1 # sempre definimos o critério de parada fora do loop
while (i < 6) {
  print(i)
  i <- i + 1} # Sempre alteramos o critério 
  # de parada, senão caímos em um loop infinito


i <- 1
while (i < 6) {print(i) #tem que colocar as coisas que fica abaixo do while/if dentro de{}
  i <- i + 1
  if (i == 4) {
    break}}


contador=0
i=0
while(i<10){
  i=sample(1:100, size=1)
  contador=contador+1
  print(contador)
  print(i)
  if(contador==4){
    break}}


i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3|i==2) {
    next} #nest pula o numero indicado, ou tals
  print(i)}


#exercicio
set.seed(1234)

dado <- seq(1:6)
n_lancamento = 0
sorteio = 0

while (sorteio != 5) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  df[[n_lancamento]]=data.frame(n_sorteado=sorteio,
                              n_lancamento=n_lancamento)
  cat(paste0("\n\nLançamento: ", n_lancamento, "\nValor Sorteado: ", sorteio))
}

#for
for(i in 1:10) {
  x1 <- i^2
  print(x1)}


dado = c(1:6)
soma_dois_dados = function(dado1, dado2){
  soma = dado1 + dado2}

quadrado_soma = function(soma){
  soma2 = soma^2
  return(soma2)}

resultado = list()
k = 0 
for(i in dado){
  for(j in dado){
    k = k + 1
    soma = soma_dois_dados(dado[i], dado[j])
    somaqd = quadrado_soma(soma)
    
    resultado[[k]] = data.frame(dado1 = dado[i], 
                                dado2 = dado[j], 
                                soma = soma, 
                                soma2 = somaqd)}}

resultado

#apply(): Aplica uma função qualquer a uma matriz, array ou data.frame ao longo de
#margens específicas (linhas 1 ou colunas 2). O output de um apply() é um vetor.

matriz1 <- matrix(1:6, nrow = 2)
soma_linhas <- apply(matriz1, 1, sum)
soma_colunas <- apply(matriz1, 2, sum)

#lapply(): Aplica uma função a cada elemento de uma lista e retorna uma lista com os resultados.
minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6))
resultados <- lapply(minha_lista, mean)
resultados

#sapply(): A função sapply() é semelhante ao lapply(), mas tenta simplificar o resultado em um vetor 
#ou matriz sempre que possível. Se todos os resultados forem do mesmo comprimento, será retornado um vetor
#. Caso contrário, será retornada uma matriz.
minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6), c=c(7,6,8))
resultados <- sapply(minha_lista, mean)
resultados

#mapply(): Aplica uma função a vários argumentos. Ele oferece uma maneira eficiente de realizar essas operações 
#de forma flexível e controlada.

resultado <- mapply(soma_dois_dados, 
                    dado, 
                    dado)

print(resultado)

#E se eu quisesse somar todas as combinações como no for aninhado? Para isso podemos expandir o grid de busca,
#utilizando o expand.grid.
dois_dados = expand.grid(dado, dado)
dois_dados

resultado <- mapply(soma_dois_dados, 
                    dois_dados$Var1, 
                    dois_dados$Var2)

print(resultado)

###funcao

nome_da_funcao <- function(argumentos) {
  # Corpo da função
  # Instruções para realizar a tarefa
  return(resultado) # Resultado da função
}
#nome_da_funcao: É o nome atribuído à função, que deve ser descritivo e significativo.
#argumentos: São os parâmetros que a função recebe como entrada. Eles podem ser opcionais ou obrigatórios,
#dependendo da função.
#Corpo da função: É onde as operações desejadas são definidas usando R.
#return(resultado): A função pode opcionalmente retornar um resultado calculado. Se não especificado, 
#a função retorna implicitamente o último valor calculado. É uma boa prática explicitamente definir o que a função deve retornar.

minha_media <- function(vetor_de_dados){
  media = sum(vetor_de_dados)/length(vetor_de_dados)
  media = round(media, 2)
  return(media)}

minha_media(iris$Sepal.Length)

minha_media_arredond <- function(vetor_de_dados, arredondamento = 5){
  media = sum(vetor_de_dados)/length(vetor_de_dados)
  media = round(media, arredondamento)
  return(media)}

minha_media(iris$Sepal.Length)

minha_media_arredond(iris$Sepal.Length)

meu_desvio_padrao_amostral <- function(vetor) {
  media <- minha_media_arredond(vetor) 
  diferenca <- vetor - media  # Calcula as diferenças em relação à média
  quadrados <- diferenca^2  # Calcula os quadrados das diferenças
  variancia <- sum(quadrados) / (length(vetor) - 1)  # Calcula a variância
  desvio_padrao <- sqrt(variancia)  # Calcula o desvio padrão
  return(desvio_padrao)}

meu_desvio_padrao_amostral(iris$Sepal.Length)

meu_coeficiente_variacao2 <- function(vetor, arredondamento = 2) {
  media <- minha_media_arredond(vetor, arredondamento = arredondamento)  # Calcula a média
  desvio_padrao <- meu_desvio_padrao_amostral(vetor)  # Calcula o desvio padrão
  coeficiente_variacao <- (desvio_padrao / media) * 100  # Calcula o CV em porcentagem
  coeficiente_variacao = round(coeficiente_variacao, arredondamento)
  return(data.frame(CV = coeficiente_variacao, 
                    média = media, 
                    dp = desvio_padrao))}

meu_coeficiente_variacao2(iris$Sepal.Length, arredondamento = 2)

################msg
x <- -5
if (x < 0) {
  message("O valor de x é negativo.")}

x <- -5
if (x < 0) {
  warning("O valor de x é negativo.")}

x <- -5
if (x < 0) {
  stop("O valor de x é negativo.")}

###########if else

if (condicao) {
  # Código a ser executado se a condição for verdadeira
} else {
  # Código a ser executado se a condição for falsa
}

idade <- 17

if (idade >= 18) {
  cat("Você é maior de idade.\n")} else {
  cat("Você é menor de idade.\n")}

pontuacao = 50

if (pontuacao >= 90) {
  nota = "A"} else {
  if (pontuacao >= 80) {
    nota = "B"} else {
    if (pontuacao >= 70) {
      nota = "C"} else {
      nota = "D"}}}

nota

quadrante <- function(x, y) {
  if (x > 0) {
    if (y > 0) {
      quadrante = "Quadrante 1"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
      return(quadrante)} else {
      quadrante = "Quadrante 4"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))}} else {
    if (y > 0) {
      quadrante = "Quadrante 2"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))} else {
      quadrante = "Quadrante 3"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))}}}


quadrante(1, 1)
