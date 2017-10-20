//
//  ViewController.swift
//  Three Card Monty
//
//  Created by MacBook on 10/16/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var winningTag = 0
    var userScore = 0
    var game = true
    var upperBound = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
   
    
    @IBAction func newGame(_ sender: UIButton) {
        
        let buttonArray = [bottomLeft, middleButton, rightButton,leftButton,bottomRight]
        for button in buttonArray {
            button?.isHidden = false
            button?.setBackgroundImage(#imageLiteral(resourceName: "queen_of_spades_playing_card_design_by_vesperius-d8jycht (1)"), for: UIControlState.normal)
        }
        
        switch sender.tag {
        case 3:
            upperBound = 3
            bottomRight.isHidden = true
            bottomLeft.isHidden = true
            
        case 4:
            upperBound = 4
            bottomRight.isHidden = true
            
        case 5:
            upperBound = 5
        default:
            upperBound = 5
        }
        
        winningTag = Int(arc4random_uniform(UInt32(upperBound)))
        winLabel.text = "Pick a card!"
        game = true
    }
    @IBAction func winningCard(_ sender: UIButton) {
        
        while game {
            if winningTag == sender.tag {
                sender.setBackgroundImage(#imageLiteral(resourceName: "playing_card_design___the_king_by_smartgfx-d9knjyj"), for: UIControlState.normal)
                winLabel.text = "You win!"
                userScore += 1
                game = false
            } else {
                sender.setBackgroundImage(#imageLiteral(resourceName: "queen_of_spades_playing_card_design_by_vesperius-d8jycht"), for: UIControlState.normal)
                winLabel.text = "You Lose!"
                game = false
            }
        }
        scoreLabel.text = String(userScore)
        
    }
    
}

