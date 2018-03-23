//
//  LessonTestViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
import CardsLayout
import FCAlertView
import Koloda
class LessonTestViewController: UIViewController {
    @IBOutlet weak var testCardsView: UICollectionView!
    @IBOutlet weak var viewQuestionCards: KolodaView!
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
        testCardsView.allowsSelection = false
        viewQuestionCards.delegate = self
        viewQuestionCards.dataSource = self
        self.title = lessonTestViewModel?.lessonTitle()
        self.navigationItem.backBarButtonItem?.title = ""
    }

}
//MARK:-
extension LessonTestViewController:KolodaViewDelegate,KolodaViewDataSource,QuestionCardViewDelegate{
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
       let questionCardView = Bundle.main.loadNibNamed("QuestionCardView", owner: self, options: nil)![0] as! QuestionCardView
        
        if let questions = lessonTestViewModel?.questions{
            questionCardView.question = questions[index]
            questionCardView.delegate = self
        }
        return questionCardView
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return lessonTestViewModel?.questions?.count ?? 0
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("ran out of questions")
        showSummary()
    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection){
        if direction == .left{
            if let question = self.lessonTestViewModel?.questions![index]{
                if question.isAnswered == false{
                    Question.skipped += 1
                }
            }
            
        }
    }
    func nextButtonPressed(cardView: QuestionCardView) {
        self.viewQuestionCards.swipe(.left)
    }
    func summaryButtonPressed(cardView: QuestionCardView, question: Question) {
        showSummary()
    }
    
    private func showSummary(){
        let summaryPop = FCAlertView()
        summaryPop.makeAlertTypeSuccess()
        
        if let totalQuestions = self.lessonTestViewModel?.lesson?.words?.count{
            summaryPop.showAlert(withTitle: "Test Summary", withSubtitle: "Total: \(totalQuestions)\nCorrect: \(Question.correct)\nWrong: \(Question.wrong)\nSkipped:\(Question.skipped)", withCustomImage: nil, withDoneButtonTitle:"Done", andButtons: nil)
            summaryPop.doneActionBlock {
                Question.clearTestStatus()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}


