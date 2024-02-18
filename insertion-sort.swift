func insertionSort(arr: inout [Int]) {
    var opsCount = 0
    //
    //Start from Moving point index 1
    //Move towards left and swap
    for x in 1..<arr.count {
        var moving_index = x //left pointer
        for y in (0...(moving_index - 1)).reversed() {
            opsCount += 1
            if arr[y] > arr[moving_index] {
                arr.swapAt(y, moving_index)
                //When swapped, index should change to new position
                moving_index = y
            } else {
                break //since first part is sorted, once we are not swapping. no, we can move to next element
            }
        }
    }
    print("opsCount: ", opsCount)
}

//unique array
var input = Array(0..<100).shuffled()

//non-unique array
//var input: [Int] = []
//for _ in 0..<100 {
//    input.append(Int(arc4random_uniform(100)))
//}
insertionSort(arr: &input)
print(input)


//08:55 -> 9:02 => 7 mins
