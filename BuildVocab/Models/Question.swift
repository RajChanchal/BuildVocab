//
//  Question.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class Question: NSObject {
    var lesson:Lesson!
    var vocab:Vocab!
    var options:[Vocab]!
    var isAnswered = false
    init(lesson:Lesson,vocab:Vocab,options:[Vocab]) {
        self.lesson = lesson
        self.vocab = vocab
        self.options = options
        isAnswered = false
    }
}
