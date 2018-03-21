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
    var words:[(word:String,translation:String)]?
    init(fileName:String){
        self.fileName = fileName
        
    }
}
