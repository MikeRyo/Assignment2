//
//  MyMusicViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MyMusicViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!

    
    var timer: Timer?

    
    
    //Play music
    @IBAction func play(_ sender: Any) {
      if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    
    //Pause music
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    
    //Previous song
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
    
    //Next song
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
        audioPlayer.pause()
        let curTime = sliderOutlet.value
        audioPlayer.currentTime = TimeInterval(curTime)
        audioPlayer.play()
    }
    
    // Option volume of song
    /*
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuffed == true
        {
            audioPlayer.volume = sender.value
        }
    }*/
    
    
    
    //Play music with time of Song
    func playThis(thisOne:String)
    {
        sliderOutlet.minimumValue = 0
        
        //play music on background
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
            
        }catch{
        }
        
        //Play Music
        
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            sliderOutlet.maximumValue = Float(audioPlayer.duration)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeSliderValueFollowPlayerCurTime), userInfo: nil, repeats: true)
            
            //catch event of music
            audioPlayer.delegate = self
            
            audioPlayer.play()
            
            //View info at Background
            
            //View information of Song such as: song name, song singer
            let artwork = MPMediaItemArtwork(image: #imageLiteral(resourceName: "passenger"))
            
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                MPMediaItemPropertyTitle: "Alone",
                MPMediaItemPropertyArtist: "Unknow",
                MPMediaItemPropertyPlaybackDuration:
                    audioPlayer.duration,
                MPMediaItemPropertyArtwork: artwork
                
            ]
            UIApplication.shared.beginReceivingRemoteControlEvents()
            becomeFirstResponder()
            
        }
        catch
        {
            print ("ERROR")
        }
    }

    
    //Change value of song
    func changeSliderValueFollowPlayerCurTime(){
        let curValue = Float(audioPlayer.currentTime)
        sliderOutlet.value = curValue
    }
    
    
    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            if event.type == .remoteControl{
                switch event.subtype {
                case .remoteControlPlay:
                    audioPlayer.play()
                case .remoteControlPause:
                    audioPlayer.pause()
                case .remoteControlNextTrack:
                    print("Next Song")
                case .remoteControlPreviousTrack:
                    print("Previous Song")
                    
                default:
                    print("Not configure!")
                }
            }
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


//Auto play next song

extension MyMusicViewController : AVAudioPlayerDelegate{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            do
            {
                let audioPath = Bundle.main.path(forResource: "love", ofType: ".mp3")
                try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                sliderOutlet.maximumValue = Float(audioPlayer.duration)
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeSliderValueFollowPlayerCurTime), userInfo: nil, repeats: true)
                
                //catch event of music
                audioPlayer.delegate = self
                
                audioPlayer.play()
                
            }
            catch
            {
                print ("ERROR")
            }
            
        }
    }
}





