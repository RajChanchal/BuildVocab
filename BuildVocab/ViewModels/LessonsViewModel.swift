//
//  LessonsViewModel.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonsViewModel: NSObject {
    var lessons:[Lesson]!
    override init() {
        super.init()
        self.lessons = [Lesson]()
    }
    
    func repopulateLessons(){
        self.lessons = [Lesson]()
        if let lessonFiles = CSVWrapper.fetchLessonFileNames(){
            print("numbers: \(lessonFiles)")
            for lessonFileName in lessonFiles{
                let lesson = Lesson.init(fileName: lessonFileName)
                self.lessons.append(lesson)
            }
        }
    }
}
