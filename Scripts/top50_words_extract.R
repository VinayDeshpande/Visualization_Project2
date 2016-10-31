library(readr)

#Extract top 50 words from wiki news
data_wiki<- read.csv("wikinews_text.csv")
data_wiki$text<-bracketX(data_wiki$text,"angle")
data_wiki$text <-gsub("http[^[:space:]]*", "", data_wiki$text)

replacePunctuation <- function(x)
{
  x <- tolower(x)
  x <- gsub("[.]+[ ]"," ",x)
  x <- gsub("[:]+[ ]"," ",x)
  x <- gsub("[?]"," ",x)
  x <- gsub("[!]"," ",x)
  x <- gsub("[;]"," ",x)
  x <- gsub("[,]"," ",x)
  x
  }

data_wiki$text <- replacePunctuation(data_wiki$text)
data_wiki$text<- gsub(" "," ",data_wiki$text)

g<-vector()
for(i in 1:nrow(data_wiki)){
  a<-as.character(data_wiki$text[i])
  g<-c(g,unlist(strsplit(a,"|", fixed = TRUE, perl = FALSE, useBytes = FALSE)))
}

t<-as.data.frame(table(as.factor(g)))
s<-t[order(-t$Freq),]

wiki_data_bubble<-s[1:50,]
names(wiki_data_bubble)<-c("word","frequency")

#Extract top 50 words from huffington news
data_huff<- read.csv("huffingtonnews_text.csv")
data_huff$text<-bracketX(data_huff$text,"angle")
data_huff$text <-gsub("http[^[:space:]]*", "", data_huff$text)

replacePunctuation <- function(x)
{
  x <- tolower(x)
  x <- gsub("[.]+[ ]"," ",x)
  x <- gsub("[:]+[ ]"," ",x)
  x <- gsub("[?]"," ",x)
  x <- gsub("[!]"," ",x)
  x <- gsub("[;]"," ",x)
  x <- gsub("[,]"," ",x)
  x
}

data_huff$text <- replacePunctuation(data_huff$text)
data_huff$text<- gsub(" "," ",data_huff$text)

huff<-vector()
for(i in 1:nrow(data_huff)){
  a<-as.character(data_huff$text[i])
  huff<-c(huff,unlist(strsplit(a,"|", fixed = TRUE, perl = FALSE, useBytes = FALSE)))
}

t<-as.data.frame(table(as.factor(huff)))
s<-t[order(-t$Freq),]

huff_data_bubble<-s[1:50,]
names(huff_data_bubble)<-c("word","frequency")

write.csv(huff_data_bubble,file="top50_words_huff.csv")


write.csv(s,file="all_freq_huff.csv")

