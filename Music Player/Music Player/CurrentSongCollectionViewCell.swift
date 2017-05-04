//
//  CurrentSongCollectionViewCell.swift
//  Music Player
//
//  Created by MIKE NGUYEN on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class CurrentSongCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "pCell"
    
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var singerLabel: UILabel!
    override func awakeFromNib() {
        songImageView.layer.cornerRadius = songImageView.bounds.size.width / 2
        //        songImageView.clipsToBounds = true
        NotificationCenter.default.addObserver(self, selector: #selector(changeSong(_:)) , name: NSNotification.Name(rawValue: "changeSong") , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(actionRotateImage(_:)) , name: NSNotification.Name(rawValue: "actionRotateImage") , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(continueRotate) , name: NSNotification.Name(rawValue: "continueRotate") , object: nil)
        
    }
    
    var song:Song? {
        didSet {
            setUpCell()
        }
    }
    
    func setUpCell() {
        songNameLabel.text = song?.title
        let img = UIImage(named: (song?.fileName)!)
        songImageView.image = img
        singerLabel.text = song?.singer
    }
    
    func changeSong(_ notification: Notification) {
        songImageView.layer.removeAllAnimations()
        if let userInfo = (notification as NSNotification).userInfo {
            if let positionSong = userInfo["position"] as? Int {
                self.song = arrSong[positionSong]
            }
        }
    }
    
    func actionRotateImage(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let playing = userInfo["playing"] as? Bool {
                if playing {
                    songImageView.pauseRotateCD()
                } else {
                    if let currentTime = userInfo["currentTime"] as? Double {
                        if currentTime > 0 {
                            songImageView.resumeRotateCD()
                        } else {
                            songImageView.rotate()
                        }
                    }
                }
            }
        }
    }
    
    func continueRotate() {
        songImageView.rotate()
    }
}
