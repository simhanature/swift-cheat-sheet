import Foundation //required for arc4random_uniform

func bubbleSort(arr: inout [Int]) {
    var opsCount = 0
    //Move towards right and swap
    for x in 0..<arr.count-1 {
        var moving_index = 0
        for y in 1..<arr.count - x {//left element
            opsCount += 1
            let left = arr[moving_index]
            let right = arr[y]
            if left > right {
                arr.swapAt(y, moving_index)
            }
            moving_index = y //moving index starts at 0 for every iteration and moves to cound - x everytime
            //Biggest number keeps moving to the right
        }
    }
    print("opsCount: ", opsCount)
}


// like bubble sort, another algorithm
func swapSort(arr: inout [Int]) {
    var opsCount = 0
    //
    //Start from Moving point index 1
    //Move towards left and swap
    var swapCount = arr.count
    var cycles = 0
    while swapCount > 0 {
        swapCount = 0
        for i in 0..<arr.count - 1 - cycles {
            opsCount += 1
            let left = arr[i]
            let right = arr[i+1]
            if left > right {
                arr.swapAt(i, i+1)
                swapCount += 1
            }
        }
        cycles += 1
    }
    print("opsCount: ", opsCount)
}

//var input = [7, 8, 1, 2, 5]
//unique array
//var input = Array(0..<20).shuffled()

//non-unique array
var input: [Int] = []
for _ in 0..<100 {
    input.append(Int(arc4random_uniform(100)))
}
bubbleSort(arr: &input)
print(input)
//30 mins

