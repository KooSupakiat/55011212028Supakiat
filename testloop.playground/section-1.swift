//loop

var i = 1
println("start\(i)")

while i < 5{
    println("round\(i)")
    i = i+1
}


let m=2
var im=1

while im <= 12{
    var av = m*im
    println("\(m) * \(im) = \(av)")
    im = im+1
}

//do while

var r = 1
println("startdo \(r)")
do {
    println("rounddo \(r)")
    r = r+1
} while r < 5



let mdo = 2
var imdo = 1

do{
    var avdo = mdo*imdo
    println("\(mdo) * \(imdo) = \(avdo)")
    imdo += 1
} while imdo <= 12

//for

var first = 1
println("startforround \(first)")
for i in 0..<4 {
    println("forround \(first)")
    first += 1
}

var first2 = 1
println("startfortwo \(first2)")
for var i = 0; i < 4;++i {
    println("forroundtwo \(first2)")
    first2 += 1
}

var num = 2
for i = 1;i <=12; ++i {
    var av = num*i
    println("\(num) * \(i) = \(av)")
}















