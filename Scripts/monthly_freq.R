library(stringi)
library(dplyr)

monthly=list()
monthly_huff = list()

#Program for monthly frequency of top 50 wiki news words
data_wiki<- read.csv("wikinews_text.csv")
top50<- read.csv("top50_words_wiki.csv")

words<- top50$word
words<- as.character(words)

w<-as.data.frame(read_tsv("wikinews.tsv"))
time<- w$time
time<- as.data.frame(time)


data_wiki<- cbind(data_wiki,time)

for(j in 1:length(words)){
    
    data_wiki[words[j]] <- vapply(data_wiki$text, function(x) sum(stri_count_fixed(x, words[j])), 1L)
}


#Get the monthly frequency of words for wiki news 

for(j in 3:ncol(data_wiki))
{
r<- aggregate(data_wiki[,j] ~ format(as.Date(time),format="%m") , data_wiki, sum)
r<- as.data.frame(r)
r<- r[,2]
r<- as.data.frame(r)
colnames(r)<- colnames(data_wiki)[j]
monthly<-c(monthly,r) 
} 
  
monthly<- as.data.frame(monthly) 
write.csv(monthly,file="monthly_freq_wiki.csv")
  
#Program for monthly frequency of top 50 huffington news words  
data_huff<- read.csv("huffingtonnews_text.csv")
data_huff<- data_huff[,2]
data_huff<- as.data.frame(data_huff)

top50_huff<- read.csv("top50_words_huff.csv")  

top50_huff_word<- top50_huff$word
top50_huff_word<- as.character(top50_huff_word)

h<-as.data.frame(read_tsv("huffington.tsv"))
time<- h$time
time<- as.data.frame(time)  


data_huff<- cbind(data_huff,time)
colnames(data_huff)[1]<- "text"


for(j in 1:length(top50_huff_word)){
  
  data_huff[top50_huff_word[j]] <- vapply(data_huff$text, function(x) sum(stri_count_fixed(x, top50_huff_word[j])), 1L)
}


#Get the monthly frequency of words for huffington news 

for(j in 3:ncol(data_huff))
{
  r<- aggregate(data_huff[,j] ~ format(as.Date(time),format="%m") , data_huff, sum)
  r<- as.data.frame(r)
  r<- r[,2]
  r<- as.data.frame(r)
  colnames(r)<- colnames(data_huff)[j]
  monthly_huff<-c(monthly_huff,r) 
} 

monthly_huff<- as.data.frame(monthly_huff) 
write.csv(monthly_huff,file="monthly_freq_huff.csv")





  