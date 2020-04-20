//
//  MainVC.swift
//  Finance Quiz
//
//  Created by UGURCAN KAYA on 4/20/20.
//  Copyright © 2020 co.veriexpo.ll-aLayout-iOS13. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
// IBOutlets Def
    //labels
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    //progressbar
    @IBOutlet var progressBar: UIProgressView!
    //buttons
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var quizBrain = QuizBrain()
    func updateQuestion(){
        questionLabel.text = quizBrain.showQuestion()
        button1.setTitle(quizBrain.returnChoice(btn: 0), for: .normal)
        button2.setTitle(quizBrain.returnChoice(btn: 1), for: .normal)
        button3.setTitle(quizBrain.returnChoice(btn: 2), for: .normal)
        button4.setTitle(quizBrain.returnChoice(btn: 3), for: .normal)
        updateScore()
        progressBar.progress = quizBrain.getProgress()


    }
    
    @objc func changeQuestion(){
        questionLabel.text = quizBrain.nextQuestion()
        button1.setTitle(quizBrain.returnChoice(btn: 0), for: .normal)
        button2.setTitle(quizBrain.returnChoice(btn: 1), for: .normal)
        button3.setTitle(quizBrain.returnChoice(btn: 2), for: .normal)
        button4.setTitle(quizBrain.returnChoice(btn: 3), for: .normal)
        updateScore()
        button1.backgroundColor = .black
        button2.backgroundColor = .black
        button3.backgroundColor = .black
        button4.backgroundColor = .black
        progressBar.progress = quizBrain.getProgress()
        print(quizBrain.getProgress())

    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //appearance
        button1.layer.cornerRadius = 3
        button2.layer.cornerRadius = 3
        button3.layer.cornerRadius = 3
        button4.layer.cornerRadius = 3
        updateQuestion()
        updateScore()
        progressBar.progress = quizBrain.getProgress()
        print(quizBrain.getProgress())
        
    }
    func updateScore(){
        scoreLabel.text = String(quizBrain.getScore())
        progressBar.progress = quizBrain.getProgress()
        print(quizBrain.getProgress())

    }
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
            
            if quizBrain.checkAnswer(Answer: sender.currentTitle!){
                sender.backgroundColor = .green
                print("true")
                updateScore()


            }else{
                sender.backgroundColor = .red
                updateScore()
                print("false")

            }
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)

            
        
    }
    
    
    
    
    
    
    



}
