import Foundation //required for arc4random_uniform

func bubbleSort(arr: inout [Int]) {
    //Move towards right and swap
    for x in 0..<arr.count-1 {
        var moving_index = 0
        for y in 1..<arr.count - x {//left element
            let left = arr[moving_index]
            let right = arr[y]
            if left > right {
                arr.swapAt(y, moving_index)
            }
            moving_index = y //moving index starts at 0 for every iteration and moves to cound - x everytime
            //Biggest number keeps moving to the right
        }
    }
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

