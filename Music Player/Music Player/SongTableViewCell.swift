//
//  SongTableViewCell.swift
//  Music Player
//
//  Created by MIKE NGUYEN on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = "mtbCell"
    
    @IBOutlet weak var songSingerLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    
    var position = 0
    
    var song:Song? {
        didSet {
            setUpCell()
        }
    }
    
    func setUpCell() {
        guard let song = self.song else {return}
        songNameLabel.text = song.title
        
        let img = UIImage(named: song.fileName, in: Bundle.main, compatibleWith: nil  )
        songImageView.image = img
        songSingerLabel.text = song.singer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        songImageView.layer.cornerRadius = songImageView.bounds.size.width / 2
        //        songImageView.layer.masksToBounds = true
        
        
        
        notificationCenter.addObserver(self, selector: #selector(actionRotateImage(_:)) , name: NSNotification.Name(rawValue: "actionRotateImage") , object: nil)
    }
    
    
    
    func actionRotateImage(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let position = userInfo["position"] as? Int {
                if position == self.position {
                    
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
                } else {
                    songImageView.stopRotateCD()
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
