//
//  Vocab.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class Vocab: NSObject {
    var id:Int?
    var word:String?
    var translation:String?
    private override init() {
        //Don't let normal init
    }
    init(id:Int,word:String,translation:String) {
        self.id = id
        self.word = word
        self.translation = translation
    }
}
