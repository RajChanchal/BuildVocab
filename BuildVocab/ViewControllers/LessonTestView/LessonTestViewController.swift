//
//  LessonTestViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
import CardsLayout

class LessonTestViewController: UIViewController {
    @IBOutlet weak var testCardsView: UICollectionView!
    var lessonTestViewModel:LessonTestViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewComponents()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:- Miscellaneous Methods
    private func initializeViewComponents(){
        testCardsView.collectionViewLayout = CardsCollectionViewLayout()
        self.title = lessonTestViewModel?.lessonTitle()
    }

}
