//
//  SongsCollectionViewCell.swift
//  Music Player
//
//  Created by MIKE NGUYEN on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mCell"
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var tableView : UITableView!
    
    var playingIndex = -1 {
        didSet {
            let indexPath = IndexPath(row: playingIndex, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }
    
    deinit {
        
    }
    
    override func awakeFromNib() {
        tableView.dataSource = self
        tableView.delegate = self
        blurView.layer.cornerRadius = 20
        blurView.clipsToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(actionRotateImage(_:)) , name: NSNotification.Name(rawValue: "actionRotateImageTable") , object: nil)
    }
    
    func actionRotateImage(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let position = userInfo["position"] as? Int {
                self.playingIndex = position
            }
        }
    }
}

extension SongsCollectionViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseIdentifier, for: indexPath) as! SongTableViewCell
        let song = arrSong[(indexPath as NSIndexPath).row]
        
        if playingIndex == (indexPath as NSIndexPath).row {
            cell.songImageView.rotate()
        } else {
            cell.songImageView.pauseRotateCD()
        }
        cell.position = (indexPath as NSIndexPath).row
        cell.song = song
        cell.layoutIfNeeded()
        return cell
    }
}

extension SongsCollectionViewCell : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "selectedSong"), object: nil, userInfo: ["position": (indexPath as NSIndexPath).row])
    }
}
