import Foundation

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

//9:41 - 9:53
func selectionSort(arr: inout [Int]) {
    var opsCount = 0
    
    for i in 0..<arr.count-1 {
        //swapping index is i
        //max of remaining part
        var minValPos = i+1
        for j in i+1..<arr.count {
            opsCount += 1
            if arr[j] < arr[minValPos] {
                minValPos = j
            }
        }
        if arr[minValPos] < arr[i] { //swap if not in order
            arr.swapAt(minValPos, i)
        }
    }
    
    print("opsCount: ", opsCount)
}

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


//unique array
var input = [12, 16, 27, 26, 21, 5, 18, 19, 11, 30, 13, 20, 15, 2, 25, 14, 29, 23, 9, 22, 10, 17, 24, 28, 6, 7, 31, 4, 8, 0, 1, 3]
//var input = (0...31).shuffled()
//already sorted
//var input = Array((0...31))

//non-unique array
//var input: [Int] = []
//for _ in 0..<100 {
//    input.append(Int(arc4random_uniform(100)))
//}

var input1 = input
insertionSort(arr: &input1)
print(input1)

var input2 = input
swapSort(arr: &input2)
print(input2)

var input3 = input
selectionSort(arr: &input3)
print(input3)


var input4 = input
bubbleSort(arr: &input4)
print(input4)
