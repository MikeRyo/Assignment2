//
//  MyVideoViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class MyVideoViewController: UIViewController {

    @IBOutlet weak var FADED: UIWebView!
    
    @IBOutlet weak var ITAT: UIWebView!
    
    @IBOutlet weak var p: UIWebView!
    
    @IBOutlet weak var NB: UIWebView!
    
    @IBOutlet weak var COL: UIWebView!
    
    @IBOutlet weak var SL: UIWebView!
    
    @IBOutlet weak var AW: UIWebView!
    
    @IBOutlet weak var PS: UIWebView!
    
    @IBOutlet weak var W: UIWebView!
    
    @IBOutlet weak var BA: UIWebView!
    
    @IBOutlet weak var A: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Faded
        getF(VideoCode: "60ItHLz5WEA")
        
        //In the air tonight
        getITAT(videoCode: "ylITtfio9Mg")
        
        //Let Her Go
        getP(VideoCode: "RBumgq5yVrA")
        
        //Napal Baji
        getNB(VideoCode: "tF27TNC_4pc")
        
        //Circle Of Life
        getCOL(VideoCode: "o8ZnCT14nRc")
        
        //Somebody's Love
        getSL(VideoCode: "jPqVoaJZWFc")
        
        //Anywhere
        getAW(VideoCode: "cb5PalnCrhY")
        
        //Party Shaker
        getPS(VideoCode: "8sPj0Ic8KQ8")
        
        //W
        getW(VideoCode: "NwL98zzdEXo")
        
        //Body Ache
        getBA(VideoCode: "LbqcXnTt-7o")
        
        //Alone
        getA(VideoCode: "ALZHF5UqnU4")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func getF(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        FADED.loadRequest(URLRequest(url: url!))
    }
    
    func getITAT(videoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        ITAT.loadRequest(URLRequest(url: url!))
    }
    
    func getP(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        p.loadRequest(URLRequest(url: url!))
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
    
    func getPS(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        PS.loadRequest(URLRequest(url: url!))
    }
    
    func getW(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        W.loadRequest(URLRequest(url: url!))
    }
    
    func getBA(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        BA.loadRequest(URLRequest(url: url!))
    }
    
    func getA(VideoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(VideoCode)")
        A.loadRequest(URLRequest(url: url!))
    }
}
