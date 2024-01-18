//
//  ViewController.swift
//  BullsEye
//
//  Created by Tristin Smith on 1/14/24.
//

import UIKit

class ViewController: UIViewController {
    //outlet used to connect to the slider on the storyboard.
    @IBOutlet var slider: UISlider!
    //Outlet for the target value label
    @IBOutlet var targetLabel: UILabel!
    //Outlet for the score value label
    @IBOutlet var scoreLabel: UILabel!
    //Outlet for the round value label
    @IBOutlet var roundLabel: UILabel!
    var targetValue = 0
    var currentValue = 0
    var score = 0
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame() //Replace previous code with this
    }
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.startNewRound()
            })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound()  {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

