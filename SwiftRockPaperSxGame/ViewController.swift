//
//  ViewController.swift
//  SwiftRockPaperSxGame
//
//  Created by Brian Ho on 2020-02-06.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

var score: Int = 0
var cpuChoice: String = ""
var playerChoice: String = ""


class ViewController: UIViewController {
    
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var winLoseView: UILabel!
    @IBOutlet weak var cpuView: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    
    let imageNames = ["rock", "scissors", "paper"]
    
    func cpuChoose() -> String {
        let randomImageName = imageNames.randomElement()
        if let imageName = randomImageName
        {
            cpuView.image = UIImage(named: imageName)
            
            print( "CPU: " + imageName)
            return imageName
        }
        return ""
    }
    
    func scoreC(){
        scoreView.text = "Score: " + String(score)
    }
    
    func roundResult(cpuChoice: String, playerChoice: String) -> String{
        let results = (playerChoice.count - cpuChoice.count)
        //rock = 4
        //paper = 5
        //scissors = 8
        switch results {
            
        case 0: score += 0 //Tie
        scoreC()
        return "Tie"
        case -1: score += -1 // RvP
        scoreC()
        return "Lose"
        case -4: score += 1 //RvS
        scoreC()
        return "Win"
        case 1: score += 1 //PvR
        scoreC()
        return "Win"
        case -3: score += -1 //PvS
        scoreC()
        return "Lose"
        case 4: score += -1 //SvR
        scoreC()
        return "Lose"
        case 3: score += 1 //SvP
        scoreC()
        return "Win"
            
            
        default:
            score += -100
            scoreView.text = "Score: " + String(score)
            return "CHEATER!!!"
        }
        
        
        //
        //        if(cpuChoice == playerChoice){
        //            score += 0
        //            return "Tie"
        //        }else if(playerChoice == "rock" && cpuChoice == "scissors"){
        //        score += 1
        //        return "Win"
        //        }
        //        return "Cheater!"
    }
    
    
    @IBAction func rockButton(_ sender: UIButton) {
        playerChoice = "rock"
        print( "Player: " + playerChoice)
        cpuChoice =   cpuChoose()
        winLoseView.text =   roundResult(cpuChoice:cpuChoice, playerChoice:playerChoice)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        playerChoice = "paper"
        print( "Player: " + playerChoice)
        cpuChoice =   cpuChoose()
        winLoseView.text =   roundResult(cpuChoice:cpuChoice, playerChoice:playerChoice)
    }
    
    @IBAction func scisscorsButton(_ sender: UIButton) {
        playerChoice = "scissors"
        print( "Player: " + playerChoice)
        cpuChoice =   cpuChoose()
        winLoseView.text =   roundResult(cpuChoice:cpuChoice, playerChoice:playerChoice)
    }
    
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        score = 0
        scoreView.text = "Score " + String(score)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

