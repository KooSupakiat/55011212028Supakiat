//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import Foundation
class TipCalculatorModel{
    
    //2
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        
    }
    //4
    func calcTipWithTipPct(tipPct:Double) ->(tipAmt:Double, total:Double){
        let tipAmt = subtotal * tipPct
        let finalitp = total + tipAmt
        return(tipAmt, finalitp)
    }
    
    //1
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)]{
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipExplicit:[Double] = [0.15, 0.18, 0.20]
        
        //2
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}


