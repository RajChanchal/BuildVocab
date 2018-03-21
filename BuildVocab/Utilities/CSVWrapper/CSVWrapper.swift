//
//  CSVWrapper.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
import CSVImporter
class CSVWrapper: NSObject {
    func fetchLesson(lessonNum:Int){
        
        let path = "ResourceFiles/Lessons/Lesson\(lessonNum)"
        let importer = CSVImporter<[String]>(path: path)
        //let importer = CSVImporter.init(path: path, delimiter: ";", lineEnding: .newLine, encoding: .utf8, workQosClass: .default, callbacksQosClass: nil)
        
        importer.startImportingRecords { $0 }.onFinish { importedRecords in
            for record in importedRecords {
                // record is of type [String] and contains all data in a line
            }
        }
    }
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
        
        
        return (total:10,mastered:1)
    }
}
