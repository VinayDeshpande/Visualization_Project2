##Visualization_Project2: Text Visualization from wiki news and huffington posts
Please click to watch the overview video.

[![video](https://cloud.githubusercontent.com/assets/19288804/19246691/37394c84-8eed-11e6-8ad6-2ff0f208e299.jpg)](https://youtu.be/afw_tuR4nA8)




## Link for my web application is 
https://vinaydeshpande.github.io/Visualization_Project2/index.html

In this project, we will work on the texts extracted from news/blogs and classified into 4 categories: people names, locations, organizations, and miscellaneous. Each entry also contains the published time/date of the article/blog. We have extracted top 50 words from whole dataset and then displayed a word cloud from that. The word cloud provides the yearly frequencies of all words. We have a force directed layout to show the relationships between terms. We can search any word and then produce the top 50 related terms of that searched term. We have also provided a world map functionality to display the locations of top 50 words in the  map.

##Top 50 words Extraction
We have create a script in R to extract top 50 words from wikinews and huffington news dataset. The dataset provided as wikinews.tsv and huffington.tsv is preprocessed to remove the tabs,remove url's, punctuation and some stop words 
and generate it in form of a table with columns source,time,person,location,organization and miscellenious. The top 50 words are extracted from all categories based on frequencies.

The R script is top50_words_extract.R for both datasets, the processed data is in wikinews_text for wiki news data and huffingtonnews_text.zip for huffington news data. The dataset is in dataset folder under whom wiki and huffington folders are for wiki news and huffington news data respectively. top50_words_huff.csv and top50_words_wiki.csv files contain the top 50 words extracted from the dataset.

Later on we have read and preprocessed the dataset using D3 only and find the top 50 words.

##wordle
The top 50 words have been placed in a wordle with the words with higher frequency looking bigger and the words with lower frequencies looking smaller.Words like new, united have higher frequency

##Contribution of each team member
1) Vibhuti Gupta(Leader)

- Wrote script in R for data preprocessing.
-  Wrote script in R for generating top 50 words of each category along with monthly and daily frequencies.
- Wrote scripts for finding relationships between terms in collaboration with Vinay.
- Made the github report with Naimisha.

2) Vinay Deshpande

- Worked on scripts for visualization of word cloud.
-  Developed the UI for the word cloud with Naimisha.
- Developed the slider with Vibhuti and Naimisha.

3) Naimisha 

- Developed scripts for generation of world map showing locations of top 50 words.
- Developed the UI for relationships page.


##Basic Functionalities are shown below along with Screenshots.

### Word cloud
![wordcloud](https://cloud.githubusercontent.com/assets/19288804/20230163/18927cd2-a820-11e6-9a97-90e8bb712e31.jpg)

###Relationships

![relation](https://cloud.githubusercontent.com/assets/19288804/20230167/1d2a0daa-a820-11e6-8c3e-4aad0ffbbbae.jpg)

###cahnge in size of nodes 

![change in size of nodes and links on mouse hover](https://cloud.githubusercontent.com/assets/19288804/20230292/c94c5d7c-a820-11e6-9c8f-4430ef67fc1c.jpg)

###change in size of labels
![change in size of label on mouse over](https://cloud.githubusercontent.com/assets/19288804/20230285/c213d4b8-a820-11e6-9b95-1f1e419592fc.png)




 
