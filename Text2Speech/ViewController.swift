//
//  ViewController.swift
//  Text2Speech
//
//  Created by Jonathan Lace on 10/5/15.
//  Copyright © 2015 SHP. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController
{

    //Outlets
    @IBOutlet var textView: UITextView!
    
    
    //contants-variables
    let synth = AVSpeechSynthesizer()
    var mySpeech = AVSpeechUtterance(string: "")
    
    var rate: Float!
    var pitch: Float!
    var volume: Float!
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !loadSettings() {
            registerDefaultSettings()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerDefaultSettings() {
        
        rate = AVSpeechUtteranceDefaultSpeechRate
        pitch = 1.0
        volume = 1.0
        
        let defaultSpeechSettings: Dictionary<String, AnyObject> = ["rate": rate, "pitch": pitch, "volume": volume]
        
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultSpeechSettings)
        
    }
    
    
    func loadSettings() -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults() as NSUserDefaults
        
        if let theRate: Float = userDefaults.valueForKey("pitch") as? Float {
            rate = theRate
            pitch = userDefaults.valueForKey("pitch") as! Float
            volume = userDefaults.valueForKey("volume") as! Float
            
            return true
        }
        
        return false
    }
    
    
    @IBAction func pauseSpeech(sender: AnyObject) {
        synth.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    
    @IBAction func stopSpeech(sender: AnyObject) {
        synth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    


    
    
    @IBAction func textToSpeech(sender: AnyObject) {
        
       textView.text = "Seton Hall Preparatory School is a Catholic college‐preparatory school called to serve young men of diverse cultural and economic backgrounds. Firmly rooted in our Catholic identity, our mission is to foster the spiritual, intellectual, social, and physical growth of our students in order for them to meet the challenges of college and adulthood in a manner that embodies the values that this community cherishes. Among these values, we highlight spiritual awareness, academic excellence, personal maturity, and social responsibility with a particular emphasis on service.\r\rFounded in 1856 in Madison, the school moved to South Orange in 1860, where it prospered as part of Seton Hall University until 1985, when, after becoming independent, it re‐located to the neighboring town of West Orange. Seton Hall Prep is accredited by the Middle States Association of Colleges and Schools, drawing its 950 students [grades 9‐12] from 130 towns and 10 counties, principally from the northern New Jersey counties of Essex, Morris, Union and Hudson. The school is located less than one half mile from Interstate Route 280 and near or along major rail and public bus routes. In 2009 the school added a corporate‐style Dining Hall to the 1926 main building, and, in 2014, the John J. Murphy ’52 Science Center. A comprehensive Activities Program offers 40 clubs and co‐ curricular activities. The Prep’s widely respected Athletic Program fields 15 interscholastic varsity teams, most also at sub‐varsity and freshman levels. The school’s nearby Kelly Athletic Complex provides a 400m track, lacrosse, soccer, baseball and tennis facilities."
        
        mySpeech = AVSpeechUtterance(string: textView.text)
        mySpeech.rate = rate
        mySpeech.pitchMultiplier = pitch
        mySpeech.volume = volume
        synth.speakUtterance(mySpeech)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}