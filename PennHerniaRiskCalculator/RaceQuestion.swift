//
//  RaceQuestion.swift
//  PennHerniaRiskCalculator
//
//  Created by Emmanuel Suarez on 8/24/16.
//  Copyright © 2016 PennSHPEAppDevelopment. All rights reserved.
//

import UIKit

class RaceQuestion: UIViewController {

    // MARK: Properties
    
    var questions: [(String, Int)]!
    var score = 0
    
    @IBOutlet weak var asianButton: UIButton!
    @IBOutlet weak var caucButton: UIButton!
    @IBOutlet weak var hispButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if let questionsVC = segue.destinationViewController as? Questions {
            questionsVC.questions = questions
            questionsVC.generalModel = true
        }
        else if let scoreVC = segue.destinationViewController as? Score {
            if sender === asianButton {
                score -= 4
            }
            else if sender === hispButton {
                score += 2
            }
            else if sender === caucButton {
                score += 1
            }
            scoreVC.score = score
        }
    }

}
