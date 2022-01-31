//
//  ViewController.swift
//  QuizApp
//
//  Created by Sunil Prajapati on 1/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblQuizQuestion: UILabel!
    @IBOutlet weak var lblCorrectCounter: UILabel!
    @IBOutlet weak var lblIncorrectCounter: UILabel!
    @IBOutlet weak var lblSkipCounter: UILabel!

    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    var qBank: [(question:String, answer:Bool)] = []
    var qCount: Int = 0
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    var skipCount: Int = 0

    
    
    func loadQuestions() {
        qBank.append(("1 + 1 = 2?", true))
        qBank.append(("2 + 2 = 4?", true))
        qBank.append(("3 + 3 = 9?", false))
        qBank.append(("4 + 4 = 12?", false))
        qBank.append(("5 + 5 = 25?", false))
    }

    

    @IBAction func btnAction(_ sender: UIButton) {
                
        switch sender.tag {
        case 1:
            if (qBank[qCount].1 == true) {
                correctCount += 1
                lblCorrectCounter.text = "CORRECT: \(correctCount)"
            }
            else {
                incorrectCount += 1
                lblIncorrectCounter.text = "INCORRECT: \(incorrectCount)"
            }
        case 2:
            if (qBank[qCount].1 == false) {
                correctCount += 1
                lblCorrectCounter.text = "CORRECT: \(correctCount)"
            }
            else {
                incorrectCount += 1
                lblIncorrectCounter.text = "INCORRECT: \(incorrectCount)"
            }
        case 3:
            skipCount += 1
            lblSkipCounter.text = "SKIP: \(skipCount)"
        default:
            break
        }

        
        qCount += 1
        if (qBank.count > qCount) {
            lblQuizQuestion.text = qBank[qCount].0
        }
        else {
            lblQuizQuestion.text = "Good Bye!!!"
            btnTrue.isEnabled = false
            btnFalse.isEnabled = false
            btnSkip.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadQuestions()
        lblQuizQuestion.text = qBank[qCount].0
    }
}

