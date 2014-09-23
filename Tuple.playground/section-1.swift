    let  tipAndTotalNamed = (tipAmt:4.00, total:25.19)
    tipAndTotalNamed.tipAmt
    tipAndTotalNamed.total
    

////////random//////////

    import Foundation

        var randomNumber : Int = Int(arc4random())%50
        var randomNumberNoLimit : Int = Int(arc4random())
        var ran = arc4random_uniform(150)

/////////toInt//////////
    let string = "42"
    if let number = string.toInt(){
        println("Got the number : \(number)")
    } else {
        println("Couldn't convert to a number")
    }
    
    // prints "Got the number : 42"
    
//////////protocal////////
    
    protocol Speaker {
        func Speak()
    }
    
    class Vicki: Speaker {
        func Speak() {
            println("Hello, I am Vicki!")
        }
    }
    
    class Ray: Speaker {
        func Speak() {
            println("Yo, I am Ray")
        }
    }
    