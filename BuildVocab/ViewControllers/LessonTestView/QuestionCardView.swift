//
//  QuestionCardView.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 23/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
import Koloda

protocol QuestionCardViewDelegate {
    func nextButtonPressed(cardView:QuestionCardView)
    func summaryButtonPressed(cardView:QuestionCardView,question:Question)
}
class QuestionCardView: OverlayView {

    //MARK:- View Components
    @IBOutlet private weak var lblWord: UILabel!
    @IBOutlet private weak var tblView: UITableView!
    @IBOutlet private weak var lblInstructions: UILabel!
    @IBOutlet private weak var btnSkip: UIButton!
    @IBOutlet private weak var viewPrompt: UIView!
    
    //MARK:- Instance properties
    var question:Question!{
        didSet{
            lblWord.text = question?.vocab.word
            viewPrompt.alpha = question.isAnswered ? 1 : 0
            updateSkipButton()
        }
    }
    var delegate:QuestionCardViewDelegate?
    //MARK:- Action Methods
    @IBAction func btnSkipAction(_ sender: Any) {
        if let delegate = self.delegate{
            isLastWord() ? delegate.summaryButtonPressed(cardView: self,question:self.question) : delegate.nextButtonPressed(cardView: self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.layer.cornerRadius = 7.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        tblView.tableFooterView = UIView.init(frame: CGRect.zero)
    }

}
extension QuestionCardView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = Bundle.main.loadNibNamed("QuestionCardView", owner: self, options: nil)![1] as! UITableViewCell
        }
        cell?.textLabel?.text = question?.options[indexPath.row].translation
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = question?.options[indexPath.row]
        if self.question?.vocab.id == selectedOption?.id{
            //Correct
            lblInstructions.text = "Correct"
            Question.correct += 1
            self.viewPrompt.backgroundColor = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.7)
        }else{
            lblInstructions.text = "Incorrect"
            Question.wrong += 1
            self.viewPrompt.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.7)
        }
        self.question?.isAnswered = true
        UIView.animate(withDuration: 1.0) {
            self.viewPrompt.alpha = 1
        }
    }
    private func updateSkipButton(){
        if isLastWord(){
            //It means it's the last word
            btnSkip.setTitle("View Summary", for: .normal)
        }else{
            btnSkip.setTitle("Next", for: .normal)
        }
    }
    private func isLastWord()->Bool{
        return self.question?.lesson.words?.last?.id == self.question?.vocab.id
    }
}
