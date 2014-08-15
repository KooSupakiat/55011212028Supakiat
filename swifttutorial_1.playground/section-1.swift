let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

let tutorialTeamInferred = -19
let tutorialTeamExplicit: Int = -19

let priceintInferred = -19
let priceintExplicit:Int = -19

let priceInferred = 19.99
let priceExplicit:Double = 19.99

let pricefloatInferred = 19.99
let pricefloatExplicit:Float = 19.99

let onSaleInferred = true
let onSaleExplicit:Bool = false

let nameInferred = "Whoopie Cushion"
let nameExplicit:String = "Whoopie Cushion"

if (onSaleInferred) {
    println("\(nameInferred) on sale for \(priceInferred)!")
} else {
    println("\(nameInferred) at regular price: \(priceInferred)!")
}

