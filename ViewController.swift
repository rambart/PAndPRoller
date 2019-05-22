//
//  ViewController.swift
//  PandPRoller
//
//  Created by Tom on 9/12/17.
//  Copyright © 2017 Tom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pool = 1
    var ranks = 1
    var autoSucc = 0
    
    @IBOutlet weak var dicePoolDisplay: UILabel!
    @IBAction func dicePoolSlider(_ sender: UISlider) {
        ranks = Int(sender.value)
        dicePoolDisplay.text = String(Int(sender.value)) + "D"
    }
    
    @IBOutlet weak var ranksSlider: UISlider!
    
    
    
    
    @IBOutlet weak var autoSuccDisplay: UILabel!
    @IBAction func autoSuccSlider(_ sender: UISlider) {
        autoSucc = Int(sender.value)
        autoSuccDisplay.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var rollsDisplay: UILabel!
    
    @IBOutlet weak var successesDisplay: UILabel!
    
    @IBAction func ROLL(_ sender: Any) {
        pool = ranks - autoSucc - autoSucc - 1
        if pool < -1 {
            successesDisplay.text = "Too many automatic successes"} else {
            roll(pool)}
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pool = ranks - autoSucc - autoSucc - 1
            if pool < -1 {
                successesDisplay.text = "Too many automatic successes"} else {
                roll(pool)}
        }
    }
    
    
    
    
    func roll (_ dicePool:Int) {
        var diceCap = dicePool
        var allRolls = [Int] ()
        var successes = 0
        var rolls = 0
        while rolls <= diceCap {
            rolls += 1
            let currentRoll = arc4random_uniform(6) + 1
            if currentRoll == 2 || currentRoll == 4 {
                successes += 1
            } else if currentRoll == 6 {
                successes += 1
                diceCap += 1
            } else {}
            allRolls.append(Int(currentRoll))
        }
        rollsDisplay.text = String(describing: allRolls)
        successesDisplay.text = String(successes + autoSucc)
    }


    override func viewDidLoad() {
        ranksSlider.setValue(7, animated: true)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

