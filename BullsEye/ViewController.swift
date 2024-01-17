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
    var targetValue = 0
    var currentValue: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound() //Replace previous code with this
    }
    
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound()  {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
}

