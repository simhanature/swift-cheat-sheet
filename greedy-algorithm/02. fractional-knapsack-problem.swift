

//=========
//Disclaimer:
//fractional-knapsack-problem
//Fractional Knapsack Problem
//Refer the link for problem statement
//This is the swift implementation for problem stated here. I may not have optimized this solution enough :)
//https://www.geeksforgeeks.org/fractional-knapsack-problem/

func getProfit(source: [(Int, Int)], capacity: Int) -> Int {
    let pwSourceSorted = source.sorted {
                                            $0.0 / $0.1 > $1.0 / $1.1
                                        }
    var profit = 0
    var capacity = capacity
    
    var index = 0
    while capacity > 0 {
        if capacity < pwSourceSorted[index].1 {
            profit += Int(Double(pwSourceSorted[index].0) * (Double(capacity) / Double(pwSourceSorted[index].1)))
            break
        } else {
            profit += pwSourceSorted[index].0
            capacity = capacity - pwSourceSorted[index].1
            index += 1
        }
    }
    return profit
}

//tuple = (profit, weight)
let pwSource = [(100, 20), (60, 10), (120, 30)]
let availableCapacity = 50

//execute and print the requested problem
print("profit:", getProfit(source: pwSource, capacity: availableCapacity))

