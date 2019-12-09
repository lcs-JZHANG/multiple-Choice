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
    //make sure two student answer input got the same number of answers
guard let correctAnswersAsString = correctAnswers.text,correctAnswersAsString.count == numberOfQuestionsAsInt else{
    checkAnswers.text = "Please be sure you input exactly \(numberOfQuestionsAsInt) answers for the answer key"
                return
            }
// make sure the only answer are "A,B,C,D and E"
let allAnswer = "ABCDE"
        
for eachAnswer in studentAnswersAsString {
guard  allAnswer.contains(eachAnswer) else{
checkAnswers.text = "Student answers contain invalid choices, please ensure only character A, B, C, D or E are used"
                    return
                }
            }
for eachAnswer in correctAnswersAsString {
guard allAnswer.contains(eachAnswer) else {
                    checkAnswers.text = "Only answers A,B,C,D and E should be contained"
                    return
                }
             }
 var index = -1
 var correctNumber = 0
             
 for eachStudentAnswer in studentAnswersAsString{
                 
 index += 1
 let theNthCorrectAnswers = correctAnswersAsString.index(correctAnswersAsString.startIndex, offsetBy: index)
               
 if eachStudentAnswer == correctAnswersAsString[theNthCorrectAnswers] {
                     correctNumber += 1
 }else{
                     correctNumber += 0
                 }
             }
     // show the final answer in the storyboard
             checkAnswers.text = "The student answered \(correctNumber) question(s) correctly"
            
            
        }
        
        
    }
       
      




