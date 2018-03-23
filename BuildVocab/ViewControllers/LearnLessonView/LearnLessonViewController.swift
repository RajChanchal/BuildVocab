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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = learnLessonViewModel?.lessonTitle()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //learnLessonViewModel?.removeLessonWords()
        self.navigationItem.title = " "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Miscellaneous Methods
    private func initializeViewComponents(){
        wordCardsView.collectionViewLayout = CardsCollectionViewLayout()
        self.title = learnLessonViewModel?.lessonTitle()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lessonTest"{
            if let lessonTestVC = segue.destination as? LessonTestViewController{
                if let lesson = learnLessonViewModel?.lesson{
                    lessonTestVC.lessonTestViewModel = LessonTestViewModel.init(lesson:lesson)
                }
                
            }
        }
    }
}
//MARK:-
extension LearnLessonViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    //MARK:- Collection View Delegate Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WordCardCell
        cell.vocab = learnLessonViewModel?.vocabAtIndex(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return learnLessonViewModel?.totalNumberOfWords() ?? 0
    }
    
    
}
