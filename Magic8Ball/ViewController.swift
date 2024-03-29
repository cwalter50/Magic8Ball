//
//  ViewController.swift
//  Magic8Ball
//
//  Created by  on 9/19/17.
//  Copyright © 2017 DocsApps. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITextFieldDelegate {

    // adding a comment to change commit
    // adding a 2nd commit
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            
            revealFortune()
            
        }
    }
   
    func revealFortune () {
        // get a random number
        let random = Int.random(in: 0...3)
        print(random)
        // link the number to a random response
        var message = ""
        if random == 0 {
            message = "No way Jose"
        } else if random == 1 {
            message = "Of course"
        } else if random == 2 {
            message = "Yes"
        } else if random == 3 {
            message = "Not a chance"
        } else {
            message = "cannot determine"
        }
        // display response
       
        
        let question = myTextField.text!
        
        myLabel.text = "\(question) \n\(message)"
        
        let utterance = AVSpeechUtterance(string: message)
        
//        utterance.voice = AVSpeechSynthesisVoice.speechVoices()[2]
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
//        let speechUtterance = AVSpeechUtterance(string: tvEditor.text)
//        
//        speechSynthesizer.speakUtterance(speechUtterance)
        // clear the TF
        myTextField.text = ""
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        
        revealFortune()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // I was testing the lifecycle actions of the TF. All of these actions just print stuff for the programmer.
    @IBAction func valueChanged(_ sender: UITextField)
    {
        print("valueChanged")
    }
    @IBAction func primaryActionTriggered(_ sender: UITextField)
    {
        print("primaryActionTriggered")
    }
    @IBAction func editingChanged(_ sender: UITextField)
    {
        print("editingChanged")
    }
    @IBAction func tfDidEndOnExit(_ sender: UITextField)
    {
        print("tfDidEndOnExit")
    }
    @IBAction func tfEditingDidBegin(_ sender: UITextField)
    {
        print("tfEditingDidBegin")
    }
    
    @IBAction func tfEditingDidEnd(_ sender: UITextField)
    {
        print("tfEditingDidEnd")
    }
    
    
    

}

