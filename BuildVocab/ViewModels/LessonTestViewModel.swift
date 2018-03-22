//
//  LessonTestViewModel.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonTestViewModel: NSObject {
    private var lesson:Lesson?
    var questions:[Question]?
    private override init(){
        
    }
    init(lesson:Lesson) {
        super.init()
        self.lesson = lesson
        lesson.initializeWords(shouldIgnoreMasteredWords: true) //To save memory, we only initialize words when they are needed
        self.initializeQuestions()
    }
    func lessonTitle()->String?{
        return self.lesson?.name
    }
    func initializeQuestions(){
        self.questions = []
        if let words = self.lesson?.words{
            for word in words{
                let lesson = self.lesson!
                let options = self.fetchOptionsForWord(word: word)
                let question = Question(lesson:lesson,vocab:word,options:options)
                self.questions?.append(question)
            }
        }
    }
    /** Fetches a randomly generated list of words for options
     */
    func fetchOptionsForWord(word:Vocab) -> [Vocab]{
        var copyOfWords = self.lesson?.words.map { $0 }
        copyOfWords?.remove(at: word.id!-1)
        var options = (copyOfWords?.choose(Constants.common.totalOptionsInQuestion-1))!
        options.append(word)
        return options.shuffle()
    }
    
}
fileprivate extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
