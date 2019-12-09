//
//  ViewController.swift
//  multiple Choice
//
//  Created by Jesse Zhang on 2019-12-03.
//  Copyright © 2019 Jesse Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// outlet
    
    @IBOutlet weak var numberOfQuestions: UITextField!
    
    @IBOutlet weak var studentAnswers: UITextField!
    
    @IBOutlet weak var correctAnswers: UITextField!
    
    @IBOutlet weak var output: UITextView!

    // methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }
// action
    @IBAction func checkAnswers(_ sender: Any) {
        
    // Clear the output answer list
           output.text = ""
    //check the number of question
    guard let numberOfQuestionsAsString = numberOfQuestions.text, numberOfQuestionsAsString.count>0 else {checkAnswers.text = "Please enter an integer value greater than 0"
                    return
                }
    // make sure the number of questions are numbers
    guard let numberOfQuestionsAsInt = Int(numberOfQuestionsAsString)else{
                    checkAnswers.text = "Please enter an integer value greater than 0"
                    return
                }
    // make sure two student answer input got the same number of answers
    guard let studentAnswersAsString = studentAnswers.text,studentAnswersAsString.count == numberOfQuestionsAsInt
                    else{
                        checkAnswers.text = "Please be sure you input exactly \(numberOfQuestionsAsInt) student answers"
                        return
                }
