//
//  ViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonsViewController: UIViewController {

    @IBOutlet private weak var lblLessonTitle: UILabel!
    @IBOutlet private weak var lblLessonStatus: UILabel!
    @IBOutlet private weak var viewLessonStatusBar: UIView!
    @IBOutlet private weak var lblLessonActionTitle: UILabel!
    
    var lessonsViewModel = LessonsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

