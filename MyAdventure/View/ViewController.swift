//  ViewController.swift
//  MyAdventure
//
//  Created by Melissa on 6/18/23.
//
import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var quizlogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        //get user response
        let answerSubmitted = sender.titleLabel!.text!
        
        sender.backgroundColor = UIColor.red
        
        //compare with question[index].answer
        _ = quizlogic.compareUserAnswer(answerSubmitted)
        
        quizlogic.increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        //show question
        questionLabel.text = quizlogic.getNextQuestion()
        optionOne.setTitle(quizlogic.getChoiceOne(), for: .normal)
        optionTwo.setTitle(quizlogic.getChoiceTwo(), for: .normal)
    }
    

    

}

