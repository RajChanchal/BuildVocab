//
//  WordCardCell.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class WordCardCell: UICollectionViewCell {
    //MARK:- IBOutets
    @IBOutlet private weak var lblToLanguage: UILabel!
    @IBOutlet private weak var lblFromLanguage: UILabel!
    @IBOutlet private weak var lblWord: UILabel!
    @IBOutlet private weak var lblTranslation: UILabel!
    //MARK:- Instance Properties
    var vocab:Vocab?{
        didSet{
            lblWord.text = vocab?.word?.capitalized
            lblTranslation.text = vocab?.translation?.capitalized
        }
    }
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 7.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
}
