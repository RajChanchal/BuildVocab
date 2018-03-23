//
//  ViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonsViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Instance properties
    var lessonsViewModel = LessonsViewModel()
    
    //MARK:- ViewConroller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lessonsViewModel.repopulateLessons()
        tblView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Miscellenious Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lessonLearnView"{
            if let learnLessonVC = segue.destination as? LearnLessonViewController{
                learnLessonVC.learnLessonViewModel = LearnLessonViewModel.init(lesson: sender as! Lesson)
            }
        }
    }
}
extension LessonsViewController:UITableViewDelegate,UITableViewDataSource{
    //MARK:- TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsViewModel.lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LessonCell
        cell.populateLessonData(lesson: lessonsViewModel.lessons[indexPath.row], lessonNum: indexPath.row+1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "lessonLearnView", sender: lessonsViewModel.lessons[indexPath.row])
    }
}

