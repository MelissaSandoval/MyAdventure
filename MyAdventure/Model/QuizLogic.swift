//
//  QuizLogic.swift
//  MyAdventure
//
//  Created by Melissa on 6/18/23.
//

import Foundation

struct QuizLogic {
    var questionIndex : Int = 0
    var score : Int = 0
    
    let question = [
        Question("You owe a lot of money to lenders. You found a mysterious USB drive that belongs to a CEO. It contains their money laundering ledgers.", "Blackmail CEO for money", "Sell it to competitors", "Blackmail CEO for money"),
        Question("What would you like in return?", "$1,000,000", "Company Stock", "$100,000,000"),
        Question("Great, your request has been granted, though it looks like you're being followed. Turns out the files got leaked by an unknown source. Would you like to cash out and go into hiding?", "Yes", "No", "Yes"),
        Question("A spy sent by the FBI broke into your house to look for the USB. Did you remember where you hid the copy you made?", "Yes", "No", "No"),
        Question("Hurry! Retrieve the copy and get out of there! How would you like to escape?", "Motorcycle", "Car", "Motorcycle"),
        Question("The FBI is chasing you in their car and is starting to shoot at you.", "Shoot back", "Speed up and loose them", "Speed up and loose them"),
        Question("The only person you know that can help you escape to another country is a someone you owe money to. Will you pay them back before asking for help?", "Yes", "No", "Yes"),
        Question("The guy you owe money to will help you escape. Do you trust him?", "Yes", "No", "Yes"),
        Question("Congratulations, you are in a new country and away from danger!", "End Game", "Restart", "Restart"),
        Question("It was a set up. You have been caught and thrown in jail. Sorry.", "End Game", "Restart", "Restart")

    ]
    
    mutating func compareUserAnswer(_ response: String) -> Bool{
        if response == question[questionIndex].answer {
            score += 1
            return true
        }
        else {
            return false
        }
        
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count - 1 {
            if (questionIndex == 1 && score == 1) {
                questionIndex += 1
            }
            else if (questionIndex == 1 && score == 0) {
                questionIndex += 2
            }
            else if (questionIndex == 2 && score == 2) {
                questionIndex += 2
            }
            else if (questionIndex == 2 && score == 1) {
                questionIndex += 3
            }
            else if (questionIndex == 3 && score == 1) {
                questionIndex += 3
            }
            else if (questionIndex == 3 && score == 0) {
                questionIndex += 4
            }
            else if (questionIndex == 4 || questionIndex == 5 || questionIndex == 6 || questionIndex == 7) {
                if (score == 3) {
                    questionIndex = 8
                }
                else {
                    questionIndex = 9
                }
            }
            else if (questionIndex == 9 || questionIndex == 8) {
                questionIndex = 0
                score = 0
            }
            else {
                questionIndex += 1
            }
        }
        else {
            questionIndex = 0
            score = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getScore() -> Int{
        return score
    }
}
