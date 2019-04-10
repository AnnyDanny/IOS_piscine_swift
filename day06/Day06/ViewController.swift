//
//  ViewController.swift
//  Day06
//
//  Created by Ganna DANYLOVA on 4/10/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UIDynamicAnimatorDelegate {

    @IBOutlet weak var labelTap: UILabel!
    
    var dynamicAnimator = UIDynamicAnimator()
    var gravityBehavior = UIGravityBehavior()
    var collisionBehavior = UICollisionBehavior()
    var dynamicBehavior: UIDynamicItemBehavior!

    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTap.text = "Tap"
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravityBehavior = UIGravityBehavior(items: [])
        dynamicAnimator.addBehavior(gravityBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        
        dynamicBehavior = UIDynamicItemBehavior(items: [])
        dynamicAnimator.addBehavior(dynamicBehavior)
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        gravityBehavior.magnitude = 10
    }

    func addBehavior(newShape: UIView) {
        view.addSubview(newShape)
        gravityBehavior.addItem(newShape)
        collisionBehavior.addItem(newShape)
        dynamicBehavior.addItem(newShape)
    }
    
    @IBAction func TapAction(_ sender: UITapGestureRecognizer) {
        print("tapped")
        let touch = sender.location(in: self.view)
        let newShape = Shape(x : Int(touch.x - 50), y : Int(touch.y - 50))
        addBehavior(newShape : newShape)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        newShape.addGestureRecognizer(pan)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        newShape.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture(gesture:)))
        newShape.addGestureRecognizer(rotate)
        
    }
    @objc func panGesture(gesture: UIGestureRecognizer) {
        if gesture.state == .began  || gesture.state == .changed {
            self.gravityBehavior.removeItem(gesture.view!)
            gesture.view?.center = gesture.location(in: gesture.view?.superview)
            dynamicAnimator.updateItem(usingCurrentState: gesture.view!)
        }
        else if gesture.state == .ended {
            print("Ended")
            self.gravityBehavior.addItem(gesture.view!)
        }
        else if gesture.state == .failed || gesture.state == .cancelled {
            print("Failed or Cancelled")
        }
        else {
            print("Possible")
        }
    }
    
    @objc func pinchGesture(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            self.gravityBehavior.removeItem(gesture.view!)
            self.collisionBehavior.removeItem(gesture.view!)
            let checkShape = gesture.view as! Shape
            if checkShape.circle {
                gesture.view!.layer.cornerRadius *= gesture.scale
            }
            gesture.scale = 1
        }
        else if gesture.state == .ended {
            print("Ended")
            self.gravityBehavior.addItem(gesture.view!)
            self.collisionBehavior.addItem(gesture.view!)
        }
        else if gesture.state == .failed || gesture.state == .cancelled {
            print("Failed or Cancelled")
        }
        else {
            print("Possible")
        }
    }
    
    @objc func rotateGesture(gesture: UIRotationGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            print("Began or changed")
            self.gravityBehavior.removeItem(gesture.view!)
            gesture.view?.transform = gesture.view!.transform.rotated(by: gesture.rotation)
            dynamicAnimator.updateItem(usingCurrentState: gesture.view!)
        }
        else if gesture.state == .ended {
            print("Ended")
            self.gravityBehavior.addItem(gesture.view!)
        }
        else if gesture.state == .failed || gesture.state == .cancelled {
            print("Failed or Cancelled")
        }
        else {
            print("Possible")
        }
    }
}

