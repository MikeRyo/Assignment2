//
//  MyRadioViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//


import UIKit
import AVFoundation
    
class MyRadioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
        
        var soundPlayer: AVAudioPlayer?
        var elapsedTime: TimeInterval = 0
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            songs.dataSource = self
            songs.delegate = self
            // Do any additional setup after loading the view, typically from a nib.
            let path = Bundle.main.path(forResource: "Shape", ofType: "mp3") //URL of the file
            
            let url = URL(fileURLWithPath: path!)
            
            do{
                //setup the player by loading the sound file
                try soundPlayer = AVAudioPlayer(contentsOf:url)
            }
                //catch the error if playback fails
            catch{print("file not available")}
            
        }
        
        
        
        
        //play and resume
        @IBAction func Play(_ sender: UIButton) {
            
            if soundPlayer != nil{
                soundPlayer!.currentTime=elapsedTime
                soundPlayer!.play()
            }
        }
        
        
        //Pause
        @IBAction func Pause(_ sender: UIButton) {
            
            if soundPlayer != nil{
                elapsedTime = soundPlayer!.currentTime
                soundPlayer!.pause()
            }
            
        }
        
        
        //Stop
        @IBAction func Stop(_ sender: UIButton) {
            if soundPlayer != nil{
                soundPlayer!.stop()
                elapsedTime = 0
            }
        }
        
        
        @IBOutlet weak var songs: UIPickerView!
        var items = ["Shape"]
        public func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return items.count
        }
        
        
        public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return items[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            
            let path = Bundle.main.path(forResource: items[row], ofType: "mp3") //URL of the file
            
            let url = URL(fileURLWithPath: path!)
            
            do{
                try soundPlayer = AVAudioPlayer(contentsOf: url)
            }
                //catch the error if playback fails
            catch{print("file not available")}
        }
        
        
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}
