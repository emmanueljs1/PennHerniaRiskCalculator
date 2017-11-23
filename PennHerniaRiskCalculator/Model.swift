//
//  Model.swift
//  PennHerniaRiskCalculator
//
//  Created by Emmanuel Suarez and Brailinson Disla
//  Copyright © 2016 PennSHPEAppDevelopment. All rights reserved.
//

import UIKit

class Model: UIViewController {
    
    // MARK: Models
    
    static let isPrefix = "Is the patient "
    static let hasPrefix = "Has the patient "
    static let didPrefix = "Did the patient have "
    static let doesPrefix = "Does the patient have "
    static let wasPrefix = "Was the patient "
    
    let generalModel = [(didPrefix + "a concurrent ostomy closure?", 4),
                        (doesPrefix + "irritable bowel syndrome?", 3),
                        (hasPrefix + "undergone a bariatric procedure?", 3),
                        (hasPrefix + "had a colectomy and a protectomy?", 3),
                        (doesPrefix + "an acute gastrointestinal inflammation?", 2),
                        (doesPrefix + "concurrent fistulectomy?", 2),
                        (doesPrefix + "a liver disease?", 2),
                        (doesPrefix + "a history of chemotherapy?", 2),
                        (isPrefix + "obese?", 2),
                        (hasPrefix + "had a colectomy and not a protectomy?", 2),
                        (hasPrefix + "had a protectomy?", 2),
                        (hasPrefix + "had a small bowel resection?", 1),
                        (didPrefix + "a preoperative wound complication?", 1),
                        (isPrefix + "a smoker?", 1),
                        (isPrefix + "anemic?", 1),
                        (doesPrefix + "hyperlipidemia?", 1),
                        (isPrefix + "between the ages of 45 and 80?", 1),
                        (doesPrefix + "a cardiovascular disease?", -1),
                        (doesPrefix + "a benign gynecologic mass?", -2),
                        (doesPrefix + "a systemic infection?", -2),
                        (doesPrefix + "a non-large bowel gastrointestinal cancer?", -2)]
    
    // asian = -4
    // hispanic / native american = 2
    // white = 1
    
    
    let bariatricModel = [(didPrefix + "an open approach surgery?", 5),
                          (isPrefix + "malnourished?", 2),
                          (hasPrefix + "had a gastrointestinal surgery?", 2),
                          (isPrefix + "morbidly obese?", 2),
                          (isPrefix + "aged 45-65?", 1)]
    
    let emergentModel = [(isPrefix + "obese?", 3),
                         (doesPrefix + "a history of hematologic cancer?", 2),
                         (hasPrefix + "had a small bowel resection?", 2),
                         (isPrefix + "the patient Hispanic?", 2),
                         (hasPrefix + "had a concurrent ostomy / fistula takedown?", 2),
                         (hasPrefix + "had a left, sigmoid, or tranverse colectomy?", 2),
                         (doesPrefix + "a history of a surgical wound complication?", 1),
                         (isPrefix + "overweight (but not obese)?", 1),
                         (doesPrefix + "a history of liver disease?", 1),
                         (isPrefix + "older than 45 years?", 1),
                         (doesPrefix + "a benign gyneocological mass?", -3),
                         (doesPrefix + "a gastrointestinal malignancy?", -3)]
    
    let gynModel = [(didPrefix + "a vertical incision?", 2),
                    (doesPrefix + "ascites?", 1),
                    (doesPrefix + "a gynecologic malignancy?", 1),
                    (isPrefix + "obese?", 1),
                    (doesPrefix + "an acute inflammatory process?", 1),
                    (doesPrefix + "anemia?", 1),
                    (doesPrefix + "a history of smoking?", 1),
                    (didPrefix + "a concurrent gastrointestinal procdeure?", 1)]
    
    // MARK: Properties
    
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var bariatricButton: UIButton!
    @IBOutlet weak var gynButton: UIButton!
    @IBOutlet weak var emergentButton: UIButton!

    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let questionsVC = segue.destinationViewController as? Questions {
            
            var questions: [(String, Int)]!
            
            if sender === generalButton {
                questions = generalModel
                questionsVC.generalModel = true
            }
            else if sender === bariatricButton {
                questions = bariatricModel
            }
            else if sender === emergentButton {
                questions = emergentModel
            }
            else if sender === gynButton {
                questions = gynModel
            }
            questionsVC.questions = questions
        }
    }
    
}