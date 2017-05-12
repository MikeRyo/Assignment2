//
//  ViewController.swift
//  Music Player
//
//  Created by MIKE NGUYEN on 25/04/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//  App for assignment 2

import UIKit

class ViewController: UIViewController {
    
    var gravity : UIGravityBehavior?
    var animator: UIDynamicAnimator?
    var gameTimer: Timer?
    
    func addBalloons( _ : Any)
    {
        
        let xCoordinate = arc4random() % UInt32(self.view.bounds.width)
        
        let btn = UIButton(frame: CGRect(x: Int(xCoordinate), y: 60, width: 50, height: 50))
        btn.setImage(UIImage(named: "multiple"), for: .normal)
        btn.addTarget(self, action: #selector(self.didPopBalloons(sender:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        gravity?.addItem(btn as UIView)
    }
    
    
    func didPopBalloons(sender : UIButton)
    {
        sender.setImage(UIImage(named: "music"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {sender.alpha = 0},
                       completion: { (true) in sender.removeFromSuperview()})
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get timer to show balloons
        gameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector (ViewController.addBalloons(_ :)), userInfo: nil, repeats: true)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior( items: [])
        
        let vector = CGVector(dx: 0.0, dy: 0.1)
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
