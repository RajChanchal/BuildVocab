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
        static let correctOption = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.8)
        static let incorrectOption = UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.8)
    }
}
