//
//  WordCardCell.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class WordCardCell: UICollectionViewCell {
    @IBOutlet private weak var lblToLanguage: UILabel!
    @IBOutlet private weak var lblFromLanguage: UILabel!
    @IBOutlet private weak var lblWord: UILabel!
    @IBOutlet private weak var lblTranslation: UILabel!
    
    var vocab:Vocab?{
        didSet{
            lblWord.text = vocab?.word
            lblTranslation.text = vocab?.translation
        }
    }
}
