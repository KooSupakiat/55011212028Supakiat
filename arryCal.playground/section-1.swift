class TipCalculator{
   
    //2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    //1
    func returnPssibleTip() -> [Int: Double]{
        let possibleTipInferred = [0.15, 0.18, 0.20]
        let possibleTipsExlicit:[Double] = [0.15, 0.18, 0.20]
        var number0fItem = possibleTipInferred.count
        
        //2
        var retval = [Int: Double]()
        for possbleTip in possibleTipInferred{
            let intPct = Int(possbleTip*100)
            
        }
        
    }
    return retval
    
}
//let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
