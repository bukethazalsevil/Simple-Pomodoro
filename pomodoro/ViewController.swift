//
//  ViewController.swift
//  pomodoro
//
//  Created by Buket Hazal Sevil on 12.02.2024.
//

import UIKit

class ViewController: UIViewController  {
    
    var timer = Timer()
    var minutes = 25
    var seconds = 0
    var pause = false
    var timeRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var breakLabel: UILabel!
    
    @IBAction func startButton(_ sender: UIButton) {
        
        runTimer()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        if pause == false {
            timer.invalidate()
            pause = true
        } else {
            runTimer()
            pause = false
        }
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        timer.invalidate()
        minutes = 25
        seconds = 0
        updateLabels()
        
    }
    
    func runTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        
        if seconds > 0 {
                    seconds -= 1
                } else {
                    if minutes > 0 {
                        minutes -= 1
                        seconds = 59
                    } else {
                        timer.invalidate()
                        breakLabel.text = String("Time to Break!")
                    }
                }
                updateLabels()
            
        }
    func updateLabels() {
           secondsLabel.text = String(format: "%02d", seconds)
           minuteLabel.text = String(format: "%02d", minutes)
    }
}
