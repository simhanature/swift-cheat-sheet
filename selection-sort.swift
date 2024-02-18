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

//unique array
//var input = Array(0..<100).shuffled()

//non-unique array
var input: [Int] = []
for _ in 0..<100 {
    input.append(Int(arc4random_uniform(100)))
}
selectionSort(arr: &input)
print(input)
