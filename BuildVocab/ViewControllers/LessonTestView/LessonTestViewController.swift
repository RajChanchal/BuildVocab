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
        self.navigationItem.backBarButtonItem?.title = ""
    }

}
//MARK:-
extension LessonTestViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCardCollectionViewCell
        if let questions = lessonTestViewModel?.questions{
            cell.question = questions[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessonTestViewModel?.questions?.count ?? 0
    }
}


