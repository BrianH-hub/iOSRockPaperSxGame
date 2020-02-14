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
var firstPlay: Int = 0
var cpuMainChoice: String = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var winLoseView: UILabel!
    @IBOutlet weak var cpuView: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playerFirst: UISwitch!
    
    let imageNames = ["rock", "scissors", "paper"]
    
    @IBAction func cpuFirst(_ sender: Any) {
        
        if (firstPlay == 1) {
            firstPlay = 0
            cpuChoice =   cpuChoose()
        }else{
            firstPlay = 1
            cpuChoice =   cpuChoose()
        }
        
    }
    
    
    func cpuChoose() -> String {
        let randomImageName = imageNames.randomElement()
        
        if let imageName = randomImageName
        {
            cpuMainChoice = imageName
//            cpuView.image = UIImage(named: imageName)
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
        
    }
    
//    @IBAction func cpuButton(_ sender: UIButton) {
//        winLoseView.text = "test"
//    }
    
    func processGameResults(playerChoice: String){
    print( "Player: " + playerChoice)
    if(firstPlay == 0){
    cpuChoice =   cpuChoose()
    }
    getCPUImage()
    winLoseView.text =   roundResult(cpuChoice:cpuChoice, playerChoice:playerChoice)
    if(firstPlay == 1){
    cpuChoice =   cpuChoose()
    }
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        playerChoice = "rock"
        processGameResults(playerChoice:playerChoice)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        playerChoice = "paper"
        processGameResults(playerChoice:playerChoice)
        }
    
    @IBAction func scisscorsButton(_ sender: UIButton) {
        playerChoice = "scissors"
        processGameResults(playerChoice:playerChoice)
        }
    
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
//        score = 0
//        scoreView.text = "Score " + String(score)
        getCPUImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getCPUImage(){
        cpuView.image = UIImage(named: cpuMainChoice)
    }
    
}

