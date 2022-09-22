//
//  ViewController.swift
//  Timer
//
//  Created by Soo Jang on 2022/09/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondSlider: UISlider!
    weak var timer: Timer?
    var audio: SystemSoundID = 1016
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSlider()
        
    }

    func setSlider() {
        secondSlider.minimumValue = 0
        secondSlider.maximumValue = 60
        secondSlider.value = 30
    }
    
    @IBAction func secondSliderVC(_ sender: UISlider) {
        secondLabel.text = String(Int(secondSlider.value))
    }
    @IBAction func startButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            self.secondSlider.value -= 1
            self.secondLabel.text = String(Int(self.secondSlider.value))
            if self.secondSlider.value <= 0 {
                AudioServicesPlaySystemSound(self.audio)
                timer.invalidate()
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        secondSlider.value = 30
        secondLabel.text = "초를 선택하세요"
        timer?.invalidate()
    }

}

