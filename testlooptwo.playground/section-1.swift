func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]//กำหนดค่าแรก
    println(min)
    var max = scores[0]
    println(max)
    
    var sum = 0
    
    for score in scores {
        println("ipscore \(score)")
        if score > max {
            println("score \(score)")
            max = score//หาค่ามากสุด
            println("max \(max)")
        } else if score < min {
             println("score \(score)")
            min = score//หาค่าน้อยสุด
            println("max \(min)")
        }
        sum += score//หาผลรวม
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
statistics.sum
statistics.2


