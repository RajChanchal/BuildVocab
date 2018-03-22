//
//  LearnLessonViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
import CardsLayout
class LearnLessonViewController: UIViewController {
    //MARK:- Instance variables
    @IBOutlet weak var wordCardsView: UICollectionView!
    var learnLessonViewModel:LearnLessonViewModel?
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeViewComponents()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        learnLessonViewModel?.removeLessonWords()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Action Methods
    @IBAction func SkipLesson(_ sender: Any) {
        
    }
    //MARK:- Miscellaneous Methods
    private func initializeViewComponents(){
        wordCardsView.collectionViewLayout = CardsCollectionViewLayout()
        self.title = learnLessonViewModel?.lessonTitle()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testView"{
            
        }
    }
}
//MARK:-
extension LearnLessonViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WordCardCell
        cell.vocab = learnLessonViewModel?.lesson?.words![indexPath.row]
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 7.0
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return learnLessonViewModel?.lesson?.words?.count ?? 0
    }
    
    
}
