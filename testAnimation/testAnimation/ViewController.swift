//
//  ViewController.swift
//  testAnimation
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollisionBehaviorDelegate{
    
    var square: UIView!
    var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var centersquare: CGPoint!
    var count=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        square = UIView(frame: CGRect(x: 100, y: 20, width: 50, height: 50))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        let barrirer = UIView(frame: CGRect(x: 50, y: 300, width: 130, height: 20))
        let barrirer2 = UIView(frame: CGRect(x: 170, y: 450, width: 130, height: 20))
        let barrirer3 = UIView(frame: CGRect(x: 200, y: 100, width: 20, height: 130))
        
        
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        barrirer.backgroundColor = UIColor.redColor()
        barrirer2.backgroundColor = UIColor.redColor()
        barrirer3.backgroundColor = UIColor.redColor()
        
        view.addSubview(barrirer)
        view.addSubview(barrirer2)
        view.addSubview(barrirer3)
        
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrirer.frame))
        collision.addBoundaryWithIdentifier("barrier2", forPath: UIBezierPath(rect: barrirer2.frame))
        collision.addBoundaryWithIdentifier("barrier3", forPath: UIBezierPath(rect: barrirer3.frame))
        
        collision.action = {
            /*println("---\(NSStringFromCGAffineTransform(self.square.transform))\(NSStringFromCGPoint(self.square.center))-----")*/
            
            
            
        }

                collision.collisionDelegate = self
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.7
        animator.addBehavior(itemBehaviour)
    }
    
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        var firstContact = false
        
        
        /*println("Boundary contact occurred - \(identifier)")*/
        
        
        let collidingView = item as UIView
        collidingView.backgroundColor = self.getRandomColor()
        UIView.animateWithDuration(100.0){
            collidingView.backgroundColor = UIColor.grayColor()
            
        self.centersquare = self.square.center
            
        
            if (!firstContact){
                firstContact = true
            
                let square = UIView(frame: CGRect(x: self.view.frame.origin.x + self.square.frame.origin.x, y: self.view.frame.origin.y + self.square.frame.origin.y
, width: 10, height: 10))
            square.backgroundColor = self.getRandomColor()
                self.view.addSubview(square)
                
                self.collision.addItem(square)
                self.gravity.addItem(square)
                
                let attach = UIAttachmentBehavior(item: collidingView, attachedToItem: square)
                self.animator.addBehavior(attach)
                
            }
        
        }
        
    }
    
    
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (snap != nil){
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func panning(pan: UIPanGestureRecognizer){
        println("Our box is panning...")
        var location = pan.locationInView(self.view)
        var touchlocation = pan.locationInView(self.square)
        if pan.state == UIGestureRecognizerState.Began{
            self.animator!.removeAllBehaviors()
            self.square!.center = location
        }else if pan.state == UIGestureRecognizerState.Changed{
            self.square!.center = location
        }else if pan.state == UIGestureRecognizerState.Ended{
            self.animator!.addBehavior(self.gravity)
            self.animator!.addBehavior(self.collision)
        }
        
    }
    func xybox(){
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

