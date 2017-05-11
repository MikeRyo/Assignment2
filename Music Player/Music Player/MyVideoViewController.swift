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
        /*
        //Passenger
        P.allowsInlineMediaPlayback = true
        P.loadHTMLString("<iframe width=\"\(P.frame.width)\" height=\"\(P.frame.height) src=\"https://www.youtube.com/embed/RBumgq5yVrA?list=PL8wCoQjJr41BBmV8Y-fKQB6cHA86tNg_x?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Napal Baji
        NB.allowsInlineMediaPlayback = true
        NB.loadHTMLString("<iframe width=\"\(NB.frame.width)\" height=\"\(NB.frame.height) src=\"https://www.youtube.com/embed/tF27TNC_4pc?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Circle Of Life
        COL.allowsInlineMediaPlayback = true
        COL.loadHTMLString("<iframe width=\"\(COL.frame.width)\" height=\"\(COL.frame.height) src=\"https://www.youtube.com/embed/o8ZnCT14nRc?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Somebody's Love
        SL.allowsInlineMediaPlayback = true
        SL.loadHTMLString("<iframe width=\"\(SL.frame.width)\" height=\"\(SL.frame.height) src=\"https://www.youtube.com/embed/cb5PalnCrhY?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Anywhere
        AW.allowsInlineMediaPlayback = true
        AW.loadHTMLString("<iframe width=\"\(AW.frame.width)\" height=\"\(AW.frame.height) src=\"https://www.youtube.com/embed/cb5PalnCrhY?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Galway Girl
        GG.allowsInlineMediaPlayback = true
        GG.loadHTMLString("<iframe width=\"\(GG.frame.width)\" height=\"\(GG.frame.height) src=\"https://www.youtube.com/embed/87gWaABqGYs?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Shape of you
        SOY.allowsInlineMediaPlayback = true
        SOY.loadHTMLString("<iframe width=\"\(SOY.frame.width)\" height=\"\(SOY.frame.height) src=\"https://www.youtube.com/embed/JGwWNGJdvx8?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        //Body Ache
        BA.allowsInlineMediaPlayback = true
        BA.loadHTMLString("<iframe width=\"\(BA.frame.width)\" height=\"\(BA.frame.height) src=\"https://www.youtube.com/embed/LbqcXnTt-7o?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        */
        
        
        
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
