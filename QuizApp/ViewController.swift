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

    var qBank: [(question:String, answer:Bool)] = []
    var qCount: Int = 0
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    var skipCount: Int = 0

    func loadQuestions() {
        qBank.append(("1 + 1 = 2?", true))
        qBank.append(("2 + 2 = 4?", true))
        qBank.append(("3 + 3 = 9?", false))
        qBank.append(("4 + 4 = 12?", true))
        qBank.append(("5 + 5 = 25?", false))
    }


    @IBAction func btnAction(_ sender: UIButton) {
                
        switch sender.tag {
        case 1:
            if (qBank[qCount].1 == true) {
                correctCount += 1
            }
            else {
                incorrectCount += 1
            }
        case 2:
            if (qBank[qCount].1 == false) {
                correctCount += 1
            }
            else {
                incorrectCount += 1
            }
        case 3:
            skipCount += 1
        default:
            break
        }

        lblCorrectCounter.text = "CORRECT: \(correctCount)"
        lblIncorrectCounter.text = "INCORRECT: \(incorrectCount)"
        lblSkipCounter.text = "SKIP: \(skipCount)"
        
        qCount += 1
        if (qBank.count > qCount) {
            lblQuizQuestion.text = qBank[qCount].0
        }
        else {
            lblQuizQuestion.text = "Good Bye!!!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadQuestions()
        lblQuizQuestion.text = qBank[qCount].0
    }
}

