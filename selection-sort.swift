func selSort(arr: inout [Int]) {
    var swapCount = arr.count
    while swapCount > 0 {
        swapCount = 0
        for i in 0..<arr.count - 1 {
            let left = arr[i]
            let right = arr[i+1]
            if left > right {
                arr.swapAt(i, i+1)
                swapCount += 1
            }
        }
    }
}

//unique array
//var input = Array(0..<100).shuffled()

//non-unique array
var input: [Int] = []
for _ in 0..<100 {
    input.append(Int(arc4random_uniform(100)))
}
selSort(arr: &input)
print(input)
