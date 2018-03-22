//
//  CSVWrapper.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class CSVWrapper: NSObject {
    class func fetchLessonCSVContent(lessonNum:Int)->CSwiftV?{
        
        //let path = "ResourceFiles/Lessons/Lesson\(lessonNum)"
        guard let filepath = Bundle.main.path(forResource: "Lesson\(lessonNum)", ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            let csv = CSwiftV(with: contents)
            return csv
            
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    /**
     Returns a list of all the CSV lesson files
     */
    class func fetchLessonFileNames()->[String]?{
        if let resourcePath = Bundle.main.resourcePath{
            let fileManager = FileManager.default
            do {
                let resourceContents = try fileManager.contentsOfDirectory(atPath: resourcePath)
                let filter = NSPredicate.init(format: "self ENDSWITH '.csv'")
                let fileteredcontents = resourceContents.filter { filter.evaluate(with: $0) }
                return fileteredcontents
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
                return nil
            }
        }
        return nil
    }
    class func fetchLessonLearningStatus(lesson:Lesson) -> (total:Int,mastered:Int){
        if let lessonID = lesson.id{
            if let csv = fetchLessonCSVContent(lessonNum: lessonID){
                let rows = csv.rows
                let headers = csv.headers
                lesson.name = headers[3]
                //let keyedRows = csv.keyedRows
                var masteredLessons = 0
                for row in rows{
                    if Int(row[2]) == Constants.common.wordMasterLimit{
                        masteredLessons += 1
                    }
                }
                return (total:rows.count,mastered:masteredLessons)
            }
        }
        return (total:10,mastered:1)
    }
    class func initializeWordsForLesson(lesson:Lesson,ignoreMastered:Bool){
        if let lessonID = lesson.id{
            if let csv = fetchLessonCSVContent(lessonNum: lessonID){
                let rows = csv.rows
                lesson.words = []
                for (index,row) in rows.enumerated(){
                    if ignoreMastered && Int(row[2]) == Constants.common.wordMasterLimit{
                        
                        continue
                    }
                    let word = Vocab.init(id: index+1, word: row[0], translation: row[1])
                    lesson.words?.append(word)
                }
            }
        }
    }
}
