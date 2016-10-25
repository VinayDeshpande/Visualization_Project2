library(tm)
library(dplyr)
library(qdap)
library(stringr)
library(e1071)
library(quanteda)
library(igraph)
library(wordcloud)
library(compare)

p=list()
l=list()
o=list()
m=list()



words<-read.delim("wikinews.tsv", sep = "\t",header = TRUE,stringsAsFactors=FALSE,strip.white=TRUE)
words<- words[,3:6]




for(i in 1:nrow(words)){
  
  person<- strsplit(words$person[i], "|", fixed = TRUE, perl = FALSE, useBytes = FALSE)
  location<- strsplit(words$location[i], "|", fixed = TRUE, perl = FALSE, useBytes = FALSE)
  organization<- strsplit(words$organization[i], "|", fixed = TRUE, perl = FALSE, useBytes = FALSE)
  misc<- strsplit(words$miscellaneous[i], "|", fixed = TRUE, perl = FALSE, useBytes = FALSE)
  p<- c(p,person)
  l<- c(l,location)
  o<- c(o,organization)
  m<- c(m,misc)
  
}

p<- as.matrix(p)
l<- as.matrix(l)
o<- as.matrix(o)
m<- as.matrix(m)

p<- as.data.frame(p)
l<- as.data.frame(l)
o<- as.data.frame(o)
m<- as.data.frame(m)


colnames(p)<- "text"
colnames(l)<- "text"
colnames(o)<- "text"
colnames(m)<- "text"

final_words<- cbind(p,l,o,m)

colnames(final_words)<- c("person","location","organization","miscellaneous")
#write.csv(final_words,file="final_words.csv")

final_words<- as.data.frame(final_words)


#Words for person column
words_corpus <- Corpus(VectorSource(final_words$person))
words_corpus_clean <- words_corpus %>%
  tm_map(content_transformer(tolower)) %>% 
   tm_map(removePunctuation) 
 

preprocess_person<-as.data.frame(words_corpus_clean)
preprocess_person<- preprocess_person[,2]
preprocess_person<- as.data.frame(preprocess_person)
colnames(preprocess_person)<- "person"

#Words for location column
words_corpus <- Corpus(VectorSource(final_words$location))
words_corpus_clean <- words_corpus %>%
  tm_map(content_transformer(tolower)) %>% 
  tm_map(removePunctuation) 



preprocess_location<-as.data.frame(words_corpus_clean)
preprocess_location<- preprocess_location[,2]
preprocess_location<- as.data.frame(preprocess_location)
colnames(preprocess_location)<- "location"


#Words for organization column
words_corpus <- Corpus(VectorSource(final_words$organization))
words_corpus_clean <- words_corpus %>%
  tm_map(content_transformer(tolower)) %>% 
  tm_map(removePunctuation) 


preprocess_org<-as.data.frame(words_corpus_clean)
preprocess_org<- preprocess_org[,2]
preprocess_org<- as.data.frame(preprocess_org)
colnames(preprocess_org)<- "organization"


#Words for misc column
words_corpus <- Corpus(VectorSource(final_words$miscellaneous))
words_corpus_clean <- words_corpus %>%
  tm_map(content_transformer(tolower)) %>% 
  tm_map(removePunctuation) 


preprocess_misc<-as.data.frame(words_corpus_clean)
preprocess_misc<- preprocess_misc[,2]
preprocess_misc<- as.data.frame(preprocess_misc)
colnames(preprocess_misc)<- "misc"



#combine all information
combined_dataset<- cbind(preprocess_person,preprocess_location,preprocess_org,preprocess_misc)


write.csv(combined_dataset,file="combined_dataset.csv")
words_corpus <- Corpus(VectorSource(combined_dataset))

#Doc term matrix
words_dtm <- DocumentTermMatrix(words_corpus)
words_dtm<- as.matrix(words_dtm)


#Sorting
v<- sort(colSums(words_dtm),decreasing=TRUE)
d<- data.frame(word=names(v),freq=v)

top_50_terms<-subset(d,d$freq>=50)
top_50_terms<- as.data.frame(top_50_terms)

top_50_terms<- top_50_terms[-2,]
write.csv(top_50_terms,file="top_50_terms.csv")




