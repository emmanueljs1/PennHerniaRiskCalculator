//
//  Questions.swift
//  PennHerniaRiskCalculator
//
//  Created by Emmanuel Suarez and Brailinson Disla
//  Copyright © 2016 PennSHPEAppDevelopment. All rights reserved.
//

import UIKit

class Questions: UIViewController {
    
    // MARK: Properties
    var questions: [(String, Int)]!
    var questionSwitches: [UISwitch]!
    var generalModel = false 
    @IBOutlet weak var questionsStackView: UIStackView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        questionSwitches = [UISwitch]()
        questionsStackView.removeArrangedSubview(doneButton)
        questionsStackView.sizeToFit()
        questionsStackView.spacing = CGFloat(10)
        
        for i in 0..<questions.endIndex {
            let questionSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            questionSwitches! += [questionSwitch]
            let questionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            questionLabel.numberOfLines = 0
            questionLabel.text = questions[i].0
            questionLabel.font = UIFont.systemFontOfSize(CGFloat(15))
            questionLabel.sizeToFit()
            let questionStack = UIStackView(arrangedSubviews: [questionLabel, questionSwitch])
            questionStack.axis = .Horizontal
            questionStack.spacing = CGFloat(10)
            questionsStackView.addArrangedSubview(questionStack)
        }
        
        questionsStackView.addArrangedSubview(doneButton)
        
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if let raceQuestionVC = segue.destinationViewController as? RaceQuestion {
            raceQuestionVC.questions = questions
            raceQuestionVC.score = calculateScore()
        }
        else if let scoreVC = segue.destinationViewController as? Score {
            scoreVC.score = calculateScore()
        }
    }
    
    // MARK: Actions
    
    
    @IBAction func doneButton(sender: UIButton) {
        if generalModel {
            performSegueWithIdentifier("toRaceQuestion", sender: sender)
        }
        else {
            performSegueWithIdentifier("toScore", sender: sender)
        }
    }
    
    @IBAction func resetButton(sender: UIBarButtonItem) {
        for i in 0..<questionSwitches.endIndex {
            questionSwitches[i].on = false
        }
    }
    
    // MARK: Helper
    
    private func calculateScore() -> Int {
        var score = 0
        for i in 0..<questions.endIndex {
            if questionSwitches[i].on {
                score += 1
            }
        }
        return score
    }
    
}