#Visualization_Project2
In this project, we will work on the texts extracted from news/blogs and classified into 4 categories: people names, locations, organizations, and miscellaneous. Each entry also contains the published time/date of the article/blog.

#Top 50 words Extraction
We have create a script in R to extract top 50 words from wikinews and huffington news dataset. The dataset provided as wikinews.tsv and huffington.tsv is preprocessed to remove the tabs,remove url's, punctuation and some stop words 
and generate it in form of a table with columns source,time,person,location,organization and miscellenious. The top 50 words are extracted from all
categories based on frequencies.
 
The R script is top50_words_extract.R for both datasets, the processed data is in wikinews_text for wiki news data and huffingtonnews_text.zip for huffington news data. The dataset is in dataset folder under whom wiki and huffington folders are for wiki news and huffington news data respectively. top50_words_huff.csv and top50_words_wiki.csv files contain the top 50 words extracted from the dataset.


 
