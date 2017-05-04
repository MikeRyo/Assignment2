//
//  UIImage.swift
//  Music Player
//
//  Created by MIKE NGUYEN on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

extension UIImageView {
    func rotate() {
        if self.layer.animation(forKey: "cdImage") == nil {
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotateAnimation.toValue = M_PI * 2
            rotateAnimation.duration = 13
            rotateAnimation.repeatCount = HUGE
            rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            self.layer.speed = 1
            self.layer.add(rotateAnimation, forKey: "cdImage")
        }
    }
    
    func pauseRotateCD() {
        let pauseTime = self.layer.convertTime(CACurrentMediaTime(), from: nil)
        self.layer.speed = 0.0
        self.layer.timeOffset = pauseTime
    }
    
    func resumeRotateCD() {
        let pauseTime = self.layer.timeOffset
        self.layer.speed = 1.0;
        self.layer.timeOffset = 0.0;
        self.layer.beginTime = 0.0;
        self.layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - pauseTime
    }
    
    func stopRotateCD() {
        self.layer.removeAllAnimations()
    }
    
}
