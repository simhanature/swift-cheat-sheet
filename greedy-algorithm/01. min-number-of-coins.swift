//min-number-of-coins
//Greedy Algorithm to find Minimum number of Coins
//Refer the link for problem statement
//https://www.geeksforgeeks.org/greedy-algorithm-to-find-minimum-number-of-coins/

//Find highest value in the array less than or equal to the given value
func binomialSearch(val: Int, input: [Int]) -> Int {
    if input.count == 1 {
        return input.first!
    }
    let midIndex = Int(input.count/2)
    if input[midIndex] == val   {
        return val
    } else if val > input[midIndex] {
        if val < input[midIndex + 1] {
            return input[midIndex]
        } else {
            return binomialSearch(val: val, input: Array(input[(midIndex+1)...]))
        }
    } else {
        if val > input[midIndex - 1] { // to be updated
            return input[midIndex - 1]
        } else {
            return binomialSearch(val: val, input: Array(input[...(midIndex-1)]))
        }
    }
}

func findMinRequired(val: Int, source: [Int]) -> Int {
    
    var amount = val
    var coins = 0
    while amount > 0 {
        let bigDenom = binomialSearch(val: amount, input: source)
        //number of coins
        let denomCount = Int(floor(Double(amount) / Double(bigDenom)))
        amount = amount - bigDenom * denomCount
        coins += denomCount
    }
    
    return coins
}

let source = [1, 2, 5, 10, 20, 50, 100, 500, 1000].sorted()

//for 121
let input = 150
let minCoinsRequired = findMinRequired(val: input, source: source)
print("minCoinsRequired: \(minCoinsRequired)")
