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

