//Disclaimer
//Refer here for the problem statement
//Solution may not have been optimized
//https://www.geeksforgeeks.org/find-length-largest-region-boolean-matrix/

//Default value that will be later

var xLimit = 0..<1
var yLimit = 0..<1

//Below functions can be added as sub function to findLargestRegion
func isVisited(x: Int, y: Int, visited: inout [[Bool]]) -> Bool {
    if visited[y][x] == true {
        return true
    } else {
        return false
    }
}

func setVisited(x: Int, y: Int, visited: inout [[Bool]]) {
    visited[y][x] = true
}

func isInLimit(x: Int, y: Int) -> Bool {
    return xLimit.contains(x) && yLimit.contains(y)
}

func checkData(point: (y: Int, x: Int), visited: inout [[Bool]]) -> Bool {
    guard isInLimit(x: point.x, y: point.y) == true else {
        return false
    }
    
    guard !isVisited(x: point.x, y: point.y, visited: &visited) else {
        return false
    }
    
    visited[point.y][point.x] = true
    
    if input[point.y][point.x] == 1 {
        return true
    }
    
    return false
}

func findLargestRegion(input: [[Int]]) -> Int{
    
    xLimit = 0..<(input.first?.count ?? 0)
    yLimit = 0..<input.count
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: xLimit.count), count: yLimit.count)
    
    //ops tracker
    var ops_tracker = 0
    var maxCount = 0
    for y in 0..<input.count {
        for x in 0..<input[y].count {
            if visited[y][x] {
                continue
            }
            ops_tracker += 1
            var curCount = 0
            visited[y][x] = true
            if input[y][x] == 0 {
                continue
            } else {
                curCount = 1
                var checkedIndex = 0
                var unchecked: [(y: Int, x: Int)] = [(y: y, x: x)]
                while checkedIndex < unchecked.count    {
                    let c_e = unchecked[checkedIndex]
                    //
                    var nearbyPoints = [(y: c_e.y-1, x: c_e.x-1),
                                        (y: c_e.y-1, x: c_e.x-0),
                                        (y: c_e.y-1, x: c_e.x+1),
                                        (y: c_e.y, x: c_e.x-1),
                                        (y: c_e.y, x: c_e.x+1),
                                        (y: c_e.y+1, x: c_e.x-1),
                                        (y: c_e.y+1, x: c_e.x-0),
                                        (y: c_e.y+1, x: c_e.x+1)]
                    
                    //current point : (y: c_e.y, x: c_e.x-0) is already covered

                    
                    for point in nearbyPoints {
                        if checkData(point: point, visited: &visited) {
                            unchecked.append(point)
                            curCount += 1
                        }
                    }
                    checkedIndex += 1
                }
                
            }
            maxCount = max(maxCount, curCount)
        }
    }
    print("ops_tracker: ", ops_tracker)
    return maxCount
}

//Alt inout to validate
//var input = [[0, 0, 1, 1, 0 ],
//             [ 1, 0, 1, 1, 0 ],
//             [ 0, 1, 0, 0, 0 ],
//             [ 0, 0, 0, 0, 1 ]];


var input = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
             [0,0,0,0,0,0,0,1,1,1,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,1,1,0,1,0,0,0,1,0,1,0,0],
             [0,1,0,0,1,1,0,0,1,1,1,0,0],
             [0,1,0,0,1,1,0,0,0,0,1,0,0],
             [0,0,0,0,0,0,0,1,1,1,0,0,0],
             [0,0,0,0,0,0,0,1,1,0,0,0,0]]

print("largest region:", findLargestRegion(input: input))
