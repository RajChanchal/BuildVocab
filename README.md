# BuildVocab
This is my skills assessment test project. It is an application that helps the user to learn a new vocabulary.
Learning a new vocabulary is done in lessons. A lesson is stored in a CSV file where the first row represents the header and the remaining rows contain the words in the respective languages.

A sample CSV file can be like:

German;English;Count
Tisch;table;0
Wetter;weather;0
Fahrrad;bicycle;0

The count in the third column is calculated as follows:
+1 -> the user entered the correct translation 
-1 -> the user entered a wrong word

