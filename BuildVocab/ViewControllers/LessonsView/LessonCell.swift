//
//  LessonCell.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet private weak var lblLessonTitle: UILabel!
    @IBOutlet private weak var lblLessonStatus: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var lblLessonActionTitle: UILabel!
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Make progress bar look bigger
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    ///Populates lesson data into UI components of cell
    func populateLessonData(lesson:Lesson,lessonNum:Int){
        lblLessonTitle.text = "Lesson \(lessonNum)"
        let lessonLearningStatus = CSVWrapper.fetchLessonLearningStatus(lesson: lesson)
        progressBar.progress = Float(lessonLearningStatus.mastered)/Float(lessonLearningStatus.total)
        lblLessonStatus.text = "\(lessonLearningStatus.mastered) out of \(lessonLearningStatus.total) words mastered"
        lblLessonActionTitle.text = "Lets study lesson \(lessonNum)"
    }
}
