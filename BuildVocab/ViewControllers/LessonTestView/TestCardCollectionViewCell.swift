//
//  TestCardCollectionViewCell.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit
protocol TestCardCollectionViewCellDelegate {
    func nextButtonPressed(cell:TestCardCollectionViewCell)
    func summaryButtonPressed(cell:TestCardCollectionViewCell)
}
class TestCardCollectionViewCell: UICollectionViewCell {
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
    var delegate:TestCardCollectionViewCellDelegate?
    //MARK:- Action Methods
    @IBAction func btnSkipAction(_ sender: Any) {
        if let delegate = self.delegate{
            isLastWord() ? delegate.summaryButtonPressed(cell: self) : delegate.nextButtonPressed(cell: self)
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

extension TestCardCollectionViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = question?.options[indexPath.row].translation
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = question?.options[indexPath.row]
        if self.question?.vocab.id == selectedOption?.id{
            //Correct
            lblInstructions.text = "Correct"
            Question.correct += 1
            self.viewPrompt.backgroundColor = Constants.colors.correctOption
        }else{
            lblInstructions.text = "Incorrect"
            Question.wrong += 1
            self.viewPrompt.backgroundColor = Constants.colors.incorrectOption
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
