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
    
    struct Song {
        var fileName    :   String
        var type        :   String
        var title       :   String
        var singer      :   String
        var isPlaying   :   Bool    = false
    }
    
    var arrSong:[Song] = [
        Song(fileName: "Hotel California", type: "mp3",title: "Hotel California", singer: "Elgal", isPlaying: false),
        Song(fileName: "Anywhere", type: "mp3",title: "Anywhere", singer: "Passengers", isPlaying: false),
        Song(fileName: "Let Her Go", type: "mp3",title: "Let her go", singer: "Passengers", isPlaying: false),
        Song(fileName: "love", type: "mp3",title: "Love", singer: "Unknown Singer", isPlaying: false),
        Song(fileName: "alone", type: "mp3",title: "Em cứ đi đi", singer: "Unknown Singer", isPlaying: false),
        Song(fileName: "Drag Me Down", type: "mp3",title: "Drag Me Down", singer: "One Direction", isPlaying: false),
        Song(fileName: "Story of My Life", type: "mp3",title: "Story of My Life", singer: "One Direction", isPlaying: false)
        
    ]
    let notificationCenter = NotificationCenter.default
    
    class MyMusicViewController: UIViewController {
        
        @IBOutlet weak var sliderTimer: UISlider!
        @IBOutlet weak var playOutlet: UIButton!
        @IBOutlet weak var prevOutlet: UIButton!
        @IBOutlet weak var nextOutlet: UIButton!
        @IBOutlet weak var durationLabel: UILabel!
        @IBOutlet weak var runningTimeLable: UILabel!
        @IBOutlet weak var collectionView : UICollectionView!
        @IBOutlet weak var bgImageView: UIImageView!
        @IBOutlet weak var pageControl: UIPageControl!
        var avAudio:AVAudioPlayer!
        var timer:Timer!
        var positionSong = 0
        
        var mask:CALayer?
        var songURL:URL?
        fileprivate var timingKeys:Array<CGFloat> = [CGFloat]()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            notificationCenter.addObserver(self, selector: #selector(selectedSongFromTable(_:)) , name: NSNotification.Name(rawValue: "selectedSong"), object: nil)
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("error audio session")
            }
            //createStartUpAnimation()
        }
        
        func selectedSongFromTable(_ notification: Notification) {
            if let userInfo = (notification as NSNotification).userInfo {
                if let position = userInfo["position"] as? Int {
                    if position != positionSong {
                        self.positionSong = position
                        getSong()
                        actionPlaySong(false)
                    } else {
                        actionPlaySong(avAudio.isPlaying)
                    }
                }
            }
        }
        
        var isPlaying: Bool = false {
            didSet {
                changeButtonImage(isPlaying)
            }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            setUpScreen()
        }
        
        func setUpScreen() {
            collectionView.dataSource = self
            collectionView.delegate = self
            sliderTimer.minimumValue = 0
            getSong()
            let thumbImg = UIImage(named: "circle_y")
            sliderTimer.setThumbImage(thumbImg!, for: UIControlState())
            avAudio?.delegate = self
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                collectionView.isPagingEnabled = true
                layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.height )
            }
        }
        
        
        @IBAction func playSongAction(_ sender: AnyObject) {
            actionPlaySong(avAudio.isPlaying)
        }
        
        @IBAction func nextSongAction(_ sender: AnyObject) {
            changeStatusPlaying(false)
            positionSong += 1
            if positionSong >= arrSong.count {
                positionSong = 0
                changeStatusPlaying(true)
            }
            changeSong()
        }
        
        @IBAction func prevSongAction(_ sender: AnyObject) {
            changeStatusPlaying(false)
            positionSong -= 1
            if positionSong < 0 {
                positionSong = arrSong.count - 1
                changeStatusPlaying(true)
            }
            changeSong()
        }
        
        
        @IBAction func dragToTimeOfSong(_ sender: AnyObject) {
            Thread.cancelPreviousPerformRequests(withTarget: self)
            self.perform(#selector(playAtSelectedTime) , with: nil, afterDelay: 0.2)
        }
        
    }
    
    // MARK: Helper
    extension MyMusicViewController {
        
        func getSong() {
            let first = arrSong[positionSong]
            if let mp3 = Bundle.main.path(forResource: first.fileName, ofType: first.type) {
                if let mp3URL = URL(string: mp3) {
                    do {
                        avAudio = try AVAudioPlayer(contentsOf: mp3URL, fileTypeHint: "mp3")
                        avAudio.delegate = self
                        sliderTimer.value = 0
                        sliderTimer.maximumValue = Float(avAudio.duration)
                        bgImageView.image = UIImage(named: first.fileName)
                        convertTimingToText(avAudio.currentTime, label: self.runningTimeLable)
                        convertTimingToText(avAudio.duration, label: self.durationLabel)
                    } catch {
                        print("error get Song")
                    }
                }
            }
        }
        
        func convertTimingToText(_ time: Double, label: UILabel) {
            let minute = Int(time / 60)
            let seconds = Int(time - Double(minute * 60))
            setTimingSongForLabel(minute, seconds: seconds, label: label)
        }
        
        func setTimingSongForLabel(_ minute: Int, seconds: Int, label: UILabel) {
            let mStr = minute > 9 ? "\(minute)" : "0\(minute)"
            let sStr = seconds > 9 ? "\(seconds)" : "0\(seconds)"
            label.text = "\(mStr) : \(sStr)"
        }
        
        func actionPlaySong(_ playing: Bool) {
            if timer != nil {
                timer.invalidate()
            }
            
            if playing {
                avAudio.pause()
                isPlaying = false
            } else {
                isPlaying = true
                avAudio.play()
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playingSong) , userInfo: nil, repeats: true)
            }
            
            let userInfo:[AnyHashable: Any] = [
                "playing": playing,
                "currentTime": avAudio.currentTime,
                "position" : positionSong
            ]
            notificationCenter.post(name: Notification.Name(rawValue: "actionRotateImage"), object: nil, userInfo: userInfo)
            setUpBackgroundMode()
        }
        
        override func remoteControlReceived(with event: UIEvent?) {
            if let receivedEvent = event {
                if (receivedEvent.type == .remoteControl) {
                    switch receivedEvent.subtype {
                    case .remoteControlTogglePlayPause:
                        actionPlaySong(avAudio.isPlaying)
                    case .remoteControlPlay:
                        actionPlaySong(false)
                    case .remoteControlPause:
                        actionPlaySong(true)
                    case .remoteControlNextTrack:
                        nextSongAction(nextOutlet)
                    case .remoteControlPreviousTrack:
                        prevSongAction(prevOutlet)
                    default:
                        print("received sub type \(receivedEvent.subtype) Ignoring")
                    }
                }
            }
        }
        
        func changeButtonImage(_ playing: Bool) {
            if playing {
                playOutlet.setImage(UIImage(named: "ic_pause")!, for: UIControlState())
            } else {
                playOutlet.setImage(UIImage(named: "ic_play")!, for: UIControlState())
            }
        }
        
        func playingSong() {
            sliderTimer.value = Float(avAudio.currentTime)
            convertTimingToText(avAudio.currentTime, label: self.runningTimeLable)
        }
        
        func playAtSelectedTime() {
            actionPlaySong(avAudio.isPlaying)
            let selectedTime = Double(sliderTimer.value)
            avAudio.currentTime = selectedTime
            convertTimingToText(selectedTime, label: self.runningTimeLable)
            actionPlaySong(avAudio.isPlaying)
        }
        
        func setUpBackgroundMode() {
            let song = arrSong[positionSong]
            let ar = MPMediaItemArtwork(image: UIImage(named: song.fileName)!)
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                MPMediaItemPropertyTitle: song.title,
                MPMediaItemPropertyArtist: song.singer,
                MPMediaItemPropertyArtwork: ar,
                MPMediaItemPropertyPlaybackDuration: avAudio.duration
            ]
            UIApplication.shared.beginReceivingRemoteControlEvents()
            becomeFirstResponder()
        }
        
        func changeSong() {
            notificationCenter.post(name: Notification.Name(rawValue: "changeSong"), object: nil, userInfo: ["position":positionSong])
            getSong()
            actionPlaySong(false)
        }
        
        func changeStatusPlaying(_ status: Bool) {
            var playingSong = arrSong[positionSong]
            playingSong.isPlaying = status
            arrSong[positionSong] = playingSong
        }
        
        func createStartUpAnimation() {
            mask
                = CALayer()
            mask!.contents = UIImage(named: "logo")!.cgImage
            mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            mask!.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
            self.view.layer.mask = mask
            
            let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
            keyFrameAnimation.duration = 1
            keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
            let initalBounds = NSValue(cgRect: mask!.bounds)
            let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 90))
            let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1500, height: 1500))
            keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
            keyFrameAnimation.keyTimes = [0, 0.3, 1]
            mask!.add(keyFrameAnimation, forKey: "bounds")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                if self.mask != nil {
                    self.view.layer.mask = nil
                }
            }
        }
    }
    
    extension MyMusicViewController : AVAudioPlayerDelegate {
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            if flag {
                nextSongAction(nextOutlet)
            }
        }
    }
    
    extension MyMusicViewController : UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if (indexPath as NSIndexPath).row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentSongCollectionViewCell.reuseIdentifier, for: indexPath) as! CurrentSongCollectionViewCell
                let song = arrSong[positionSong]
                cell.song = song
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongsCollectionViewCell.reuseIdentifier, for: indexPath) as! SongsCollectionViewCell
                if avAudio.isPlaying {
                    cell.playingIndex = positionSong
                }
                return cell
            }
        }
    }
    
    extension MyMusicViewController : UICollectionViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            let indexImg = Int(offset / scrollView.bounds.size.width)
            
            pageControl.currentPage = indexImg
        }
        
}

