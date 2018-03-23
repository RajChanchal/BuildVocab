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

### New Features Handling
**Support a list of lessons:** Although one lesson was asked in the given task instructions, the code supports adding many lessons.
**GUI Improvements:** GUI is improved

### Coding Pattern
MMVM Design Pattern is used for this project causing not an incuring of Masive View Controllers

### Assumptions
All CSV files will be added with file names like: Lesson1.csv, Lesson2.csv

### To be Done
Currently the app doesn't write on CSV files, so the status of scores is not updated, if given 2 more hours, it will be done as well.
