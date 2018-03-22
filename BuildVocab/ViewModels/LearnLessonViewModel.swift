//
//  LearnLessonViewModel.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LearnLessonViewModel: NSObject {
    var lesson:Lesson?
    private override init(){
        
    }
    init(lesson:Lesson) {
        self.lesson = lesson
        lesson.initializeWords() //To save memory, we only initialize words when they are needed
    }
    
    func removeLessonWords(){
        lesson?.removeWords()
    }
    func lessonTitle()->String?{
        return self.lesson?.name
    }
}
