//
//  colortwoviewController.swift
//  twoview
//
//  Created by student on 10/17/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
protocol colortwoviewControllerDelegate{
    func myVCDidFinish(controller: colortwoviewController,text:String)
}

class colortwoviewController: UIViewController {
    var delegate:colortwoviewControllerDelegate? = nil
    
    var colorstring = ""

    @IBOutlet var colorview: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func savecolor(sender: UIBarButtonItem) {
        if(delegate != nil){
           delegate!.myVCDidFinish(self, text: colorview!.text!)
        }
    }
    
   
    @IBAction func colorbutton(sender: UIButton) {
        colorview.text = sender.titleLabel!.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorview.text = colorstring
        
    }

    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
