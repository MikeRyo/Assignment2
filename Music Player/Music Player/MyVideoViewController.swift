//
//  MyVideoViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class MyVideoViewController: UIViewController {

    @IBOutlet weak var SYA: UIWebView!
    
    @IBOutlet weak var ITAT: UIWebView!
    
    @IBOutlet weak var P: UIWebView!
    
    @IBOutlet weak var NB: UIWebView!
    
    @IBOutlet weak var COL: UIWebView!
    
    @IBOutlet weak var SL: UIWebView!
    
    @IBOutlet weak var AW: UIWebView!
    
    @IBOutlet weak var GG: UIWebView!
    
    @IBOutlet weak var SOY: UIWebView!
    
    @IBOutlet weak var BA: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //See you again
        getSYA(VideoCode: "RgKAFK5djSk")
        
        //In the air tonight
        getITAT(videoCode: "ylITtfio9Mg")
        
        //Passenger
        getP(VideoCode: "RBumgq5yVrA")
        
        //Napal Baji
        getNB(VideoCode: "tF27TNC_4pc")
        
        //Circle Of Life
        getCOL(VideoCode: "o8ZnCT14nRc")
        
        //Somebody's Love
        getSL(VideoCode: "cb5PalnCrhY")
        
        //Anywhere
        getAW(VideoCode: "cb5PalnCrhY")
        
        //Galway Girl
        getGG(VideoCode: "87gWaABqGYs")
        
        //Shape of you
        getSOY(VideoCode: "JGwWNGJdvx8")
        
        //Body Ache
        getBA(VideoCode: "LbqcXnTt-7o")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func getSYA(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        SYA.loadRequest(URLRequest(url: url!))
    }
    
    func getITAT(videoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        ITAT.loadRequest(URLRequest(url: url!))
    }
    
    func getP(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        P.loadRequest(URLRequest(url: url!))
    }
    
    func getNB(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        NB.loadRequest(URLRequest(url: url!))
    }
    
    func getCOL(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        COL.loadRequest(URLRequest(url: url!))
    }
    
    func getSL(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        SL.loadRequest(URLRequest(url: url!))
    }
    
    func getAW(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        AW.loadRequest(URLRequest(url: url!))
    }
    
    func getGG(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        GG.loadRequest(URLRequest(url: url!))
    }
    
    func getSOY(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        SOY.loadRequest(URLRequest(url: url!))
    }
    
    func getBA(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        BA.loadRequest(URLRequest(url: url!))
    }
 
}
