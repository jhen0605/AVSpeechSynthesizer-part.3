//
//  ViewController.swift
//  language
//
//  Created by 簡吟真 on 2021/4/23.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
   @IBOutlet weak var loveTextField: UITextField!
   @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
   @IBOutlet weak var volumeSlider: UISlider!
   @IBOutlet weak var pitchSlider: UISlider!
   @IBOutlet weak var speedSlider: UISlider!
   @IBOutlet weak var volumeSliderText: UILabel!
   @IBOutlet weak var pitchSliderText: UILabel!
   @IBOutlet weak var speedSliderText: UILabel!
    
    
    // 滑動slider時顯示數值
    @IBAction func volumeTypeClick(_ sender: Any) {
        volumeSliderText.text = String(format: "%.1f", volumeSlider.value)
    }
    @IBAction func pitchTypeClick(_ sender: Any) {
        pitchSliderText.text = String(format: "%.1f", pitchSlider.value)
    }
    @IBAction func speedTypeClick(_ sender: Any) {
        speedSliderText.text = String(format: "%.1f", speedSlider.value)
    }
    
    
override func viewDidLoad() {
super.viewDidLoad()
}
    
    
//點空白處收鍵盤
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
self.view.endEditing(true)
}
    
    
// 輸入完return收鍵盤
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
textField.resignFirstResponder();
return true
}
    
    
@IBAction func buttonPressed(_ sender: Any) {
view.endEditing(true)
    
let speechUtterance = AVSpeechUtterance(string: loveTextField.text!)
let synthesizer = AVSpeechSynthesizer()
speechUtterance.volume = volumeSlider.value
speechUtterance.pitchMultiplier = pitchSlider.value
speechUtterance.rate = speedSlider.value
    
    
//語言
if languageSegmentedControl.selectedSegmentIndex == 0 {
speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
}
else if languageSegmentedControl.selectedSegmentIndex == 1 {
speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
}
else if languageSegmentedControl.selectedSegmentIndex == 2 {
speechUtterance.voice = AVSpeechSynthesisVoice(language: "es")
}
synthesizer.speak(speechUtterance)
   
}
    
    
    //隨機按鈕
    
    //速度
    @IBAction func speedClick(_ sender: Any) {
        speedSlider.value = Float.random(in: 0.1...2)
        speedSliderText.text = String(format: "%.1f", speedSlider.value)
    }
    
    //音調
    @IBAction func pitchClick(_ sender: Any) {
        pitchSlider.value = Float.random(in: 0.1...2)
        pitchSliderText.text = String(format: "%.1f", pitchSlider.value)

    }
    
    //音量
    @IBAction func volumeClick(_ sender: Any) {
        volumeSlider.value = Float.random(in: 0.1...2)
        volumeSliderText.text = String(format: "%.1f", volumeSlider.value)

    }
    
    //速度＆音調
    @IBAction func speedPitchClick(_ sender: Any) {
        speedSlider.value = Float.random(in: 0.1...2)
        pitchSlider.value = Float.random(in: 0.1...2)
        speedSliderText.text = String(format: "%.1f", speedSlider.value)
        pitchSliderText.text = String(format: "%.1f", pitchSlider.value)

    }
    
    //重置
    @IBAction func reset(_ sender: Any) {
        speedSlider.value = Float.random(in: 0.0...0.0)
        pitchSlider.value = Float.random(in: 0.0...0.0)
        volumeSlider.value = Float.random(in: 1.0...1.0)
        speedSliderText.text = String(format: "%.1f", speedSlider.value)
        pitchSliderText.text = String(format: "%.1f", pitchSlider.value)
        volumeSliderText.text = String(format: "%.1f", volumeSlider.value)

        
    }
}
