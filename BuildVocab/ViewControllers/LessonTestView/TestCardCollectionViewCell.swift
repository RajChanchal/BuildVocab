//
//  TestCardCollectionViewCell.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 22/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class TestCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var viewPrompt: UIView!
    var question:Question!{
        didSet{
            lblWord.text = question?.vocab.word
            viewPrompt.alpha = question.isAnswered ? 1 : 0
        }
    }
    @IBAction func btnSkipAction(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.layer.cornerRadius = 7.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        tblView.tableFooterView = UIView.init(frame: CGRect.zero)
        updateSkipButton()
    }
}

extension TestCardCollectionViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = question?.options[indexPath.row].translation
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = question?.options[indexPath.row]
        if self.question?.vocab.id == selectedOption?.id{
            //Correct
            lblInstructions.text = "Correct"
            self.viewPrompt.backgroundColor = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.7)
        }else{
            lblInstructions.text = "Incorrect"
            self.viewPrompt.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.7)
        }
        self.question?.isAnswered = true
        UIView.animate(withDuration: 1.0) {
            self.viewPrompt.alpha = 1
        }
    }
    private func updateSkipButton(){
        if self.question?.lesson.words?.last?.id == self.question?.vocab.id{
            //It means it's the last word
            btnSkip.setTitle("View Summary", for: .normal)
        }else{
            btnSkip.setTitle("Next", for: .normal)
        }
    }
}
