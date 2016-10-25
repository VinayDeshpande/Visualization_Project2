Visualization_Project2
In this project, we will work on the texts extracted from news/blogs and classified into 4 categories: people names, locations, organizations, and miscellaneous. Each entry also contains the published time/date of the article/blog.

#Top 50 words Extraction
We have create a script in R to extract top 50 words from wikinews dataset. The dataset provided as wikinews.tsv is processed to remove the tabs 
and generate it in form of a table with columns source,time,person,location,organization and miscellenious. The top 50 words are extracted from all
categories based on frequencies.
 The R script is top50_words.R, the processed data is in combined_dataset.csv and top 50 words with their frequencies in top_50_terms.csv having 
 columns word and frequency.
