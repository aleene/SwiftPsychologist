//
//  ViewController.swift
//  SwiftPsychologist
//
//  Created by arnaud on 07/01/16.
//  Copyright © 2016 Hovering Above. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    @IBAction func nothing() {
        performSegueWithIdentifier("Show Nothing", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // This solution will work with or without the embedded NavigationController
        // This is changed from what is presented in the course
        //  We need to check the destination controller of the segue
        var destination = segue.destinationViewController
        // if the destination is a navigation controller
        if let navCon = destination as? UINavigationController {
            // the redefine the destination as the visible viewcontroller  on th enavigation stack
            destination = navCon.visibleViewController!
        }
        // is the destination now a happiness view controller?
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Show Sad": hvc.happiness = 0
                    case "Show Happy": hvc.happiness = 100
                    case "Show Nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }
}

