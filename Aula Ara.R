##Grafico diagrama de cordas
install.packages("circlize")
install.packages("vcd")

V1<-c(rep("F",4),rep("M",5), "F","M")
V2<-c("I","I","B","I","B","R","B","R","I","P","B")

length(V1)
length(V2)

m<-data.frame(table(V1, V2))
library("circlize")
library("vcd")
chordDiagram(m,col = rainbow(8))

##Grafico Hexbin

install.packages("hexbin")
library("hexbin")
hh<-hexbin(iris$Sepal.Length,iris$Petal.Width)
plot(hh)
hh1<-hexbin(iris$Sepal.Length,iris$Sepal.Width)
plot(hh1)

##grafico de bolhas
X=c(10, 20, 35, 20, 40)
Y=c(1, 4, 5, 1, 5)
Z=c(41,22,20,11,50)
R=c(1,2,3,4,5)
C=c("lightblue","orange","lightpink","lightgreen","brown")


symbols(x=X,y=Y, circles=Z, inches=0.6, bg=C)
legend(30,4,c("cat1","cat2","cat3","cat4","cat5"),pch=19,cex=1.5,col=C)
text(X,Y,R,cex=2)

##mapa de calor

data(mtcars)
head(mtcars)
a=as.matrix(mtcars)
heatmap(a,col=heat.colors(256),Rowv = NA,Colv=NA)

url1 <- "https://www.metropoles.com/distrito-federal/fake-news-e-mudanca-do-clima-sao-temas-de-evento-para-estudantes-no-df"
url2 <- "datasets/master/dilma.txt"
arquivo <- readLines(paste0(url1,url2))
arquivo2 <- iconv(arquivo, from="", to="utf-8")
#("wordcloud")
#nstall.packages("tm")
require("wordcloud")
require("tm")
doc <- Corpus(VectorSource(arquivo2))
doc <- tm_map(doc,removePunctuation)
doc <- tm_map(doc,tolower)
doc <- tm_map(doc,removeWords,c(stopwords("portuguese"),"nco","ser"))
wordcloud(doc, col=c("gray","orange","red"))

################################################

install.packages("networkD3")
install.packages("dplyr")
library(networkD3)
library(dplyr)

nos=tibble(names=c("A","B", "c", "d","e","f","g","h","i","j","k","l","m","n"))
links=tibble(source=c(0,1,2,3,4,4,6,6,7,7,7,8,8,8), target=c(4,4,4,4,5,6,7,8,9,10,11,12,13,14), value=c(4.3,3.0,1.2,1.1,4.4,5.2,2.6,1.8,2.1,0.4,0.089,0.6,0.7,0.4))
S=sankeyNetwork(Links = links, Nodes=nos, Source = "source", Target = "target", Value = "value", NodeID = "names", units = "Bi", fontSize = 12, nodeWidth = 10)
S

library(networkD3)
library(dplyr)

# Criar os nós
nos <- tibble(nomes = c("EUA e Canadá",   # 0
                        "Europa, OM, e África",  # 1
                        "LATAM",  # 2
                        "Ásia e Pacífico",  # 3
                        "Receita",  # 4
                        "Lucro Bruto",  # 5
                        "CMV",  # 6
                        "Lucro Operacional",  # 7
                        "Custo Operacional",  # 8
                        "Lucro Líquido",  # 9
                        "IR",  # 10
                        "Juros",  # 11
                        "Marketing",  # 12
                        "Tech e Dev",  # 13
                        "Adm e Geral"))  # 14

# Criar os links entre os nós
links <- tibble(source = c(0, 1, 2, 3,  # Regiões
                           4, 4,        # Receita
                           5, 5,        # Lucro Bruto
                           7, 7, 7,     # Lucro Operacional
                           8, 8, 8),    # Custo Operacional
                
                target = c(4, 4, 4, 4,   # Convergência Receita
                           5, 6,         # Convergência Lucro Bruto e CMV
                           7, 8,         # Lucro Operacional e Custo Operacional
                           9, 10, 11,    # Lucro Líquido, IR e Juros
                           12, 13, 14),  # Marketing, Tech e Adm
                
                valores = c(4.3, 3.0, 1.2, 1.1,  # Valores Receita
                            4.4, 5.2,           # Valores Lucro Bruto e CMV
                            2.6, 1.8,           # Lucro Operacional e Custo
                            2.1, 0.4, 0.089,    # Lucro Líquido, IR e Juros
                            0.6, 0.7, 0.4))     # Marketing, Tech e Adm

# Criar o gráfico de Sankey
sankey <- sankeyNetwork(Links = links, Nodes = nos, 
                        Source = "source", Target = "target", 
                        Value = "valores", NodeID = "nomes", 
                        units = "Bi", fontSize = 12, nodeWidth = 30)

# Exibir o gráfico
sankey

#################################


require(ggplot2)
require(dplyr)

data(mtcars)
head(mtcars)
#ctrl+shift+= %>% 
#dispersao
mtcars %>% ggplot(aes(x=hp, y=mpg))+geom_point()
#ou um pouco melhor
mtcars %>% ggplot(aes(x=hp, y=mpg,size = am,colour = factor(am)))+ #base crua do plot
  geom_point()+ #define o grafico de dispersao
  xlab("potencia")+ylab("milhas por galao")+ggtitle("grafico de dispersao")+ #nomes
  scale_y_log10()+scale_x_continuous(limits = c(50,400))+ #tamano escala x e y
  scale_size_continuous("quarto por milha")+ #modifica o size do comeco
  scale_color_manual("cambio",labels=c("man","aut"), values = c("blue","lightgreen"))+ #modifica o color do comeco+identificacao
  facet_grid(facets = ~am)+ #divide em duas grades
  theme_dark()+ #background
  theme(text = element_text(size=15, color="blue"), #alteracao do texto geral
        plot.title = element_text(hjust = 0.5,size = 15, color = "purple")) #alteracao do titulo

#############################################3

require(sf)
library(sf)
library(dplyr)
mapa=st_read("/home/est/bao24/Downloads/dados_mapa")

plot(st_geometry(mapa))
cidades=c("CURITIBA","SÃO JOSÉ DOS PINHAIS", "PINHAIS","QUATRO BARRAS")
mapa$NM_MUNICIP=iconv(mapa$NM_MUNICIP, from = "latin1", to="utf-8")
mapa$NM_MUNICIP=iconv(mapa$NM_MUNICIP)
cidades=data.frame(cidades)
names(cidades)="NM_MUNICIP"

cidades2=left_join(cidades,mapa, by="NM_MUNICIP")
mapa_red=st_as_sf(cidades2)
plot(st_geometry(mapa_red))
dados_pr=read.csv("/home/est/bao24/Downloads/dados_mapa/dados_pr.csv",dec=",", sep=";", header=T)

names(dados_pr)[1]="CD_GEOCOMDM"
dados_pr$CD_GEOCOMDM=as.character(dados_pr$CD_GEOCOMDM)
mapa_redD=left_join(mapa_red, dados_pr, by="CD_GEOCOMDM")


