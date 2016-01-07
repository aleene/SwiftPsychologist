//
//  HappinessViewController.swift
//  Happiness
//
//  Created by arnaud on 03/01/16.
//  Copyright © 2016 Hovering Above. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            // tell the FaceView that HapinessViewController will be its datasource
            faceView.dataSource = self
            // the pinch is a View element only, so the faceview can handle it
            // you need to add an argument to scale as it takes an argument
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    var happiness: Int = 10 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            // print("happiness = \(happiness)") //note that println() has changed to print() in Swift 2.1
            updateUI()
        }
    }
   
    func updateUI() {
        // instruct faceView to redraw itself
        // Use optional chaining to prevent crash
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinesForFaceView(sender: FaceView) -> Double? {
        // interpret model for the view
        return Double(happiness-50)/50
    }
}
