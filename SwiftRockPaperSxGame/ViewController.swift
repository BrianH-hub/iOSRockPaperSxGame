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
    
    @IBAction func rockButton(_ sender: UIButton) {
        playerChoice = "rock"
        winLoseView.text = playerChoice
    }
    
    
    @IBAction func paperButton(_ sender: UIButton) {
        playerChoice = "paper"
        winLoseView.text = playerChoice
    }
    
    @IBAction func scisscorsButton(_ sender: UIButton) {
        playerChoice = "scissors"
        winLoseView.text = playerChoice
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

