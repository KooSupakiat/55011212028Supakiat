//
//  RegisterController.swift
//  testideainclass
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class RegisterController: UIViewController ,UIImagePickerControllerDelegate{

    @IBOutlet var nameRegister: UITextField!
    @IBOutlet var passwordRegister: UITextField!
    @IBOutlet var repasswordRegister: UITextField!
    
    
    @IBAction func chooseimage(sender: AnyObject) {
        var pickerC = UIImagePickerController()
        pickerC.delegate?
        self.presentViewController(pickerC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
