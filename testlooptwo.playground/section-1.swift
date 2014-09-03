func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    println(min)
    var max = scores[0]
    println(max)
    
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score//หาค่ามากสุด
        } else if score < min {
            min = score//หาค่าน้อยสุด
        }
        sum += score//หาผลรวม
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
statistics.sum
statistics.2


