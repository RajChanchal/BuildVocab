//
//  ViewController.swift
//  BuildVocab
//
//  Created by Chanchal Raj on 21/03/2018.
//  Copyright © 2018 Avira Corporation. All rights reserved.
//

import UIKit

class LessonsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    
    var lessonsViewModel = LessonsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.tableFooterView = UIView.init(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension LessonsViewController:UITableViewDelegate,UITableViewDataSource{
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
        //
    }
}

