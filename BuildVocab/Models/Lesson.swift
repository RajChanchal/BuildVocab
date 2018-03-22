//
//  Lesson.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class Lesson: NSObject {
    
    var id:Int?
    var name:String?
    var fileName:String?
    var words:[Vocab]?
    init(fileName:String){
        self.fileName = fileName
        let text = fileName.split(separator: ".")[0]
        if let upperBound = text.range(of: "Lesson")?.upperBound{
            let number = text[upperBound...]
            self.id = Int(number)
        }
        
    }
    func initializeWords(){
        CSVWrapper.initializeWordsForLesson(lesson: self)
    }
    func removeWords(){
        self.words = nil
    }
}
