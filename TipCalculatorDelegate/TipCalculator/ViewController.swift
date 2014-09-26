//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totallabel: UILabel!

    
    let cellIdentifier = "cellIdentifier"

    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTip = Dictionary<Int,(tipAmt:Double, total:Double)>()
    var  sortedKey:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        //1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        //2
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        //3
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        //4

    }

    @IBAction func calculateTapped(sender: AnyObject) {
        
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        println("tipCalc.total calculatTapped \(tipCalc.total)")
        possibleTip = tipCalc.returnPossibleTips()
        println("possibleTips. calculatTapped \(possibleTip)")
        sortedKey = sorted(Array(possibleTip.keys))
        tableView.reloadData()
     println("calculatTapped")
    
    
    }
    
    @IBAction func taxPercentegeChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject){
        totalTextField.resignFirstResponder()//เพื่อไม่ให้ใช้ keybord
    }
    
    
///UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return sortedKey.count
    }
    
    func tableView(tableView: UITableView!,  didselectRowIndexPath indexPath: NSIndexPath!){
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let tipPct = sortedKey[indexPath.row]
        let tipAmt = possibleTip[tipPct]!.tipAmt
        let total = possibleTip[tipPct]!.total
        println("tipPCT calculatTapped \(tipPct)" )
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $%0.2f, Total: $%0.2f",  tipAmt,total)
        println("TableView calculatTapped \(cell.textLabel!.text)" )
        return cell
    }

    
}

