//
//  MyMusicViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit
import AVFoundation

class MyMusicViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    //Play Music
    @IBAction func play(_ sender: Any) {
      if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)
    {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    
    //Previous Music
    @IBAction func prev(_ sender: Any) {
  
        if thisSong != 0 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
 
        if thisSong < songs.count-1 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuffed == true
        {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //label.text = songs[thisSong]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 import UIKit
 import AVFoundation
 import MediaPlayer
 
 class MyMusicViewController: UIViewController {
 
 
 var timer: Timer?
 @IBOutlet weak var label: UILabel!
 @IBOutlet weak var myImageView: UIImageView!
 
 
 //Play Music
 @IBAction func play(_ sender: Any) {
 if audioStuffed == true && audioPlayer.isPlaying == false
 {
 audioPlayer.play()
 }
 }
 
 @IBAction func pause(_ sender: Any)
 {
 if audioStuffed == true && audioPlayer.isPlaying
 {
 audioPlayer.pause()
 }
 }
 
 
 //Previous Music
 @IBAction func prev(_ sender: Any) {
 
 if thisSong != 0 && audioStuffed == true
 {
 playThis(thisOne: songs[thisSong-1])
 thisSong -= 1
 label.text = songs[thisSong]
 }
 else
 {
 
 }
 }
 
 @IBAction func next(_ sender: Any) {
 
 if thisSong < songs.count-1 && audioStuffed == true
 {
 playThis(thisOne: songs[thisSong+1])
 thisSong += 1
 label.text = songs[thisSong]
 }
 else
 {
 
 }
 }
 
 
 //Slider Timer Music
 @IBOutlet weak var sliderOutlet: UISlider!
 
 @IBAction func sliderChangeValue(_ sender: Any) {
 }
 
 
 //slider volume
 
 @IBAction func slider(_ sender: UISlider)
 {
 if audioStuffed == true
 {
 audioPlayer.volume = sender.value
 }
 }
 
 func playThis(thisOne:String)
 {
 sliderOutlet.minimumValue = 0
 
 do
 {
 let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
 try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
 sliderOutlet.maximumValue = Float(audioPlayer.duration)
 timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeSliderValueFollowPlayerCurTime), userInfo: nil, repeats: true)
 audioPlayer.play()
 }
 catch
 {
 print ("ERROR")
 }
 }
 
 
 func changeSliderValueFollowPlayerCurTime(){
 let curValue = Float(audioPlayer.currentTime)
 sliderOutlet.value = curValue
 }
 override func viewDidLoad() {
 
 super.viewDidLoad()
 //label.text = songs[thisSong]
 
 
 //sliderOutlet.minimumValue = 0
 
 
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 }
 

 */

