//
//  ViewController.swift
//  testsoundiphone
//
//  Created by student on 11/21/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    let cellIdentifier = "cellIdentifier"
    var tableData = ["song1", "song2", "song3"]
    
    
   
    
    //Core Audio
    var audioPlayer = AVAudioPlayer()
    
    
    @IBAction func stopbutton(sender: AnyObject) {
        audioPlayer.stop()
    }
    
    @IBAction func playbutton(sender: AnyObject) {
       audioPlayer.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        audioPlayer.pause()
    }

    
    
    func coreAudio(){
        var url1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("LoveRunsOut", ofType: "mp3")!)
        var error: NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: url1, error: &error)
        audioPlayer.prepareToPlay()
        
    }
    
    
    override func viewDidLoad() {
        coreAudio()
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ////////////table/////////////
    // UITableVirwDataSource methods
    
    func numberOfSectionInTableView(tableView: UITableView!) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel!.text = tableData[indexPath.row]
        
        return cell
    }
    
    
    //UITableViewDalegate methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(tableData[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler:{ (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped")
        }))
        self.presentViewController(alert, animated:  true, completion: nil)
    }

    
    
   
}

