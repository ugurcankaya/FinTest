//
//  Quiz_Brain.swift
//  Finance Quiz
//
//  Created by UGURCAN KAYA on 4/20/20.
//  Copyright © 2020 co.veriexpo.ll-aLayout-iOS13. All rights reserved.
//

import UIKit

struct Question{
    var q:String
    var a:String
    var c:[String]?
    
    init(Question q: String, Choices c:[String], Answer a:String) {
        self.q = q
        if c.count == 4{
            self.c = c
        }else{
            self.c = ["A", "B", "C", "D"]
        }
        self.a = a
    }
}

let quiz = [
            Question(Question: "Question Example 1", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
             Question(Question: "Question Example 2", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 3", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 4", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 5", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 6", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 7", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 8", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 9", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1"),
            Question(Question: "Question Example 10", Choices: ["Choice 1", "Choice 2", "Choice 3", "Choice 4"], Answer: "Choice 1")




          ]

struct QuizBrain{
    var questionNumber:Int = 0
    var point:Double = 0.0
    
    func showQuestion() -> String{
        return quiz[questionNumber].q
    }
   
    func returnChoice(btn:Int)-> String{
        return quiz[questionNumber].c![btn]
    }
    mutating func checkAnswer(Answer a:String)->Bool{
        if  a == quiz[questionNumber].a {
            self.point += Double(quiz.count) / Double(100)
            return true
        }else {
            self.point -= Double(quiz.count) / Double(100)
            return false
        }
    }
    func getScore() -> Int{
        return Int(point*100)
    }
    mutating func nextQuestion() -> String{
        if questionNumber != quiz.count-1{
            self.questionNumber += 1
            return showQuestion()
        }else{
            print("Done")
            self.questionNumber = 0
            self.point = 0
            return showQuestion()

        }
    }
    func getProgress() -> Float{
        if(questionNumber == quiz.count-1){
            return 1.0
        }
       return Float(questionNumber)/Float(quiz.count)
    }
    
    
    
    
}
