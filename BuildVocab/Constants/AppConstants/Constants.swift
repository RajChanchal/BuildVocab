//
//  File.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
//typealias Vocab = (word:String,translation:String)
class Constants:NSObject{
    struct common {
        static let wordMasterLimit = 4
        static let totalOptionsInQuestion = 3
    }
    struct colors{
        static let correctOption = UIColor.init(red: 75.0/255.0, green: 148.0/255.0, blue: 40.0/255.0, alpha: 1.0)
        static let incorrectOption = UIColor.init(red: 173.0/255.0, green: 33.0/255.0, blue: 26.0/255.0, alpha: 1.0)
    }
}
