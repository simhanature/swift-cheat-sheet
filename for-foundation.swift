import Foundation

/// 01. String

// get char at index
// get the first index of the char
// get the last index of the char
// String to Character Array
// get the substr by range
let rangeStr = "abcdef"
var substr = rangeStr[rangeStr.index(string.startIndex, offsetBy: 2)..<rangeStr.index(rangeStr.startIndex, offsetBy: 3)]
//-------------------------------------------------------------
print(String(rangeStr))

// Convert substring to string
// String to Char
// Char to String

/// 02. Array
// insert at index
var arr: Array<Int> = [1, 2, 3, 4 , 5]
arr.insert(11, at: 2)
print(arr) //[1, 2, 11, 3, 4, 5]
//-------------------------------------------------------------

//arr count
print(arr.count)
//-------------------------------------------------------------

// remove at index
var arr: Array<Int> = [1, 2, 3, 4 , 5]
let removedItem = arr.remove(at: 2)
//-------------------------------------------------------------
print("removedItem: \(removedItem)")
print("After removedItem: \(arr)")

// find first occurance
var arr: Array<Int> = [1, 2, 3, 4, 5, 4]
let index = arr.index(of: 4)
//-------------------------------------------------------------
print("index: \(index)") //return is optional //Optional(3)
let index1 = arr.index(of: 10)
//-------------------------------------------------------------
print("index: \(index1)") //return is optional //nil

//Replace contents of for the range
var arr: Array<Int> = [1, 2, 3, 4, 5, 4]
arr[1...1] = [21,22,23,24,25]
//-------------------------------------------------------------
print(arr)
//
var arr: Array<Int> = [1, 2, 3, 4, 5, 4]
arr[1..<3] = [21,22,23,24,25]
//-------------------------------------------------------------
print(arr)
//
var arr: Array<Int> = [1, 2, 3, 4, 5, 4]
arr[..<3] = [21,22,23,24,25]
//-------------------------------------------------------------
print(arr)
//
var arr: Array<Int> = [1, 2, 3, 4, 5, 6]
arr[...3] = [21,22,23,24,25]
//-------------------------------------------------------------
print(arr)
//
var arr: Array<Int> = [1, 2, 3, 4, 5, 4]
arr[3...] = [21,22,23,24,25]
//-------------------------------------------------------------
print(arr)

// remove portion of arrays
//Remove by range
var arr: Array<Int> = [1, 2, 3, 4, 5, 6]
arr.removeSubrange(1...2)
//-------------------------------------------------------------
print(arr) // [1, 4, 5, 6]

//min value
//min / max
var arr: Array<String> = ["z", "a", "b"]
//min value
print(arr.min())
//-------------------------------------------------------------
//
var arr1: Array<Int> = [101, 102, 103, 104]
//min value
let minValue = arr1.min()
//-------------------------------------------------------------
print(minValue)
let maxValue = arr1.max()
//-------------------------------------------------------------
print(maxValue)

// contains
//contains
var arr: Array<String> = ["z", "a", "b"]
let xContains = arr.contains("a")
//-------------------------------------------------------------
print(xContains)

var arr = [1, 2, 3, 4 , 5]
//arr count
print(arr.count)
//-------------------------------------------------------------

//concat 2 arrays
arr += [11, 12] //concat arrays
//-------------------------------------------------------------
print("arr: ", arr)

//Add element to array
arr.append(21)  //add an element
//-------------------------------------------------------------

//Remove at index
var arr: Array<Int> = [1, 2, 3, 4, 5, 6]
arr.remove(at: 3)
//-------------------------------------------------------------
print(arr) //[1, 2, 3, 5, 6]

//remove last element and returns it
let obj = arr.removeLast() //collection must not be empty
//-------------------------------------------------------------
print("removed object", obj)
print("after removeLast arr: ", arr)

//remove last element and returns it
let popObj = arr.popLast() //optional is allowed, collection can be empty
//-------------------------------------------------------------
print("pop object", popObj)
print("after popLast arr: ", arr)

//remove first element //No popFirst for Array
let obj1 = arr.removeFirst()
//-------------------------------------------------------------
print("removed object", obj1)
print("after removeFirst arr: ", arr)

//swapAt
var myArr = [1001, 1002, 1003, 1004, 1005]
myArr.swapAt(0, 4)
print(myArr) //[1005, 1002, 1003, 1004, 1001]

//remove all where condition met
var myArr = [10, 11,12, 13, 14, 15, 101, 102, 1001, 1002, 1003, 1004, 1005]
myArr.removeAll { $0 > 1000 }
print(myArr) //[10, 11, 12, 13, 14, 15, 101, 102]

/// Set
// insert / add
// remove / delete
// contains
//
//Set not ordered. All ops O(1)
var mySet = Set<Int>()
mySet.insert(1)
//-------------------------------------------------------------
print(mySet) // prints [1]
mySet.insert(2)
print(mySet) // prints [2, 1] //remove by object
mySet.remove(2)
//-------------------------------------------------------------
print(mySet) // prints [1]
//Set does not have removeLast or removePop
//count --
print(mySet.count)
//-------------------------------------------------------------

//pop first
let obj1 = mySet.popFirst()
//-------------------------------------------------------------
print("removed object", obj1)
print("after removeFirst arr: ", mySet)

//remove first
let obj2 = mySet.removeFirst()
//-------------------------------------------------------------
print("removed object", obj2)
print("after removeFirst arr: ", mySet)

//contains
var mySet: Set<Int> = [1001, 1002, 1003, 1004, 1005]
let xContains = mySet.contains(1003)
//-------------------------------------------------------------
print(xContains) //true
print(mySet.contains(1009)) //false


////NSOrderedSet not mutable
//NSOrderedSet not mutable
//MSMutableOrderedSet to be used
var mySet = NSMutableOrderedSet()
mySet.insert(100, at: mySet.count) //Insert at the index
//-------------------------------------------------------------
mySet.add(400) //Adds at the tail
//-------------------------------------------------------------
print(mySet)
mySet.insert([210, 220, 230, 240, 250, 260], at: IndexSet([1, 2, 3, 4, 5, 6])) //Adds at the defined indices, moves others
//-------------------------------------------------------------
print(mySet)
mySet.remove(220) //remove object by value
//-------------------------------------------------------------
print(mySet)
mySet.removeObject(at: 1) //Remove object at index
//-------------------------------------------------------------
print(mySet)
mySet.removeObjects(at: IndexSet([1, 2])) //Remove object at indices
//-------------------------------------------------------------
print(mySet)
mySet.removeObjects(in: [240, 250]) //Remove specified objects
//-------------------------------------------------------------
print(mySet)
// -- Appends or replaces
//func setObject(
//    _ obj: Any,
//    at idx: Int
//)

// -- only replaces
//func replaceObject(
//    at idx: Int,
//    with object: Any
//)

//exchangeObject(at:withObjectAt:)
//func exchangeObject(
//at idx1: Int,
//withObjectAt idx2: Int
//)

//func moveObjects(
//    at indexes: IndexSet,
//    to idx: Int
//)



/// Dictionary
var dict: [String: Int] = [:]

// Set values
dict["a"] = 5
dict["b"] = 7
dict["b"] = 8
dict["c"] = 9
print(dict)

// remove values
dict["c"] = nil
print(dict)
// get all keys
print(dict.keys)
// get all values
print(dict.values)
//enumeration
for (k,v) in dict {
    print(k, v)
}

/// Math functions & its limiations
// sqrt (only on double?)
// pow (only on double?)

// Type conversions

// Int to Integer
// double to float
// float to double

// Objects vs Primitive types (& its associated libraries)


// Regex
// find matches
// replace all matches


//Functional functions
// map
// compactmap
// filter
let str = "The rain in Spain stays mainly in the plain."
let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
let no_vows = String(str.lazy.filter { !vowels.contains($0) })
//-------------------------------------------------------------
print(no_vows)

//compact / compactMap
var myArr = [1, 2, 3, 4, 5, 6, 7]
let rMap: [Int] = myArr.map { Int(pow(Double($0), 2)) } //return squared
print(rMap) //[1, 4, 9, 16, 25, 36, 49]

var myArr1 = ["a", "b", nil, "d"]
let cMap = myArr1.compactMap { $0 } //return the non-nil chars
print(cMap) //["a", "b", "d"]

var myArr2 = ["1", "2", "three", "4", "50"]
let cMap1 = myArr2.compactMap { Int($0) } // or myArr2.compactMap { str in Int(str) }
print(cMap1) //[1, 2, 4, 50]
let rMap1 = myArr2.map { Int($0) }
print(rMap1) //[Optional(1), Optional(2), nil, Optional(4), Optional(50)]


// reduce
let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { //Can use [Character: Int]() or [:] here
    $0[$1, default: 0] += 1
}
print(letterCount) //["b": 2, "d": 1, "a": 5, "r": 2, "c": 1]

//Average to use global variable
var myArr = [15,25,35,40]
var count = 0
let aggrVal = myArr.reduce(into: 0) { result, val in
    count += 1
    result = result * (count - 1)/count + (val / count)
}
print(aggrVal) //27

//Both reduce and reduce(into: can be used
var myArr = [15,25,35,40]
let aggrVal = myArr.reduce(0) { result, val in
    result + val
}
print(aggrVal) //115

var myArr = [15,25,35,40]
let aggrVal = myArr.reduce(into: 0) { result, val in
    result = result + val
}
print(aggrVal) //115


//flatMap
var myArr = [1, 2, 3, 4, 5]
let mapped = myArr.flatMap { Array(repeating: $0, count: $0 % 2 + 1) } //:) repeat only odd values
print(mapped)

// lazy sequences. usually sequences are eager. lazy makes this as required
//lazy sequence. changes executed only when accessed
let str = "The rain in Spain stays mainly in the plain."
let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
let no_vows = str.lazy.filter { !vowels.contains($0) }
print(no_vows)
let disemvoweled = String(no_vows)
print(disemvoweled)

//lazy sequence. changes executed only when accessed
let input = [0,1,2,3,4,5]
let squared = input.lazy.map { pow(Double($0), 2.0) }
print(squared[3])
print(squared)


// declaring closures

//Double
let myNum = 2.0 //Default is double
print(myNum) //2.0
print(pow(myNum, 0.5)) //1.4142135623730951
//-------------------------------------------------------------
print(sqrt(myNum)) //1.4142135623730951
//-------------------------------------------------------------

//
let myInt = 8
//Int to Double is Double(intValue)
let output = pow(Double(myInt), 2.0)
//-------------------------------------------------------------
print(output)

//Num bitwise operators
print("Int.min:", UInt8.min)  // 0
//-------------------------------------------------------------
print("Int.max:", UInt8.max)  // 255
//-------------------------------------------------------------
print("-------------------------")

//
print("Int.min:", Int8.min)  // -128
//-------------------------------------------------------------
print("Int.max:", Int8.max)  // 127
//-------------------------------------------------------------
print("-------------------------")

//Int  (Signed Int) ; default: 64bit
//min
let minVal = Int.min //Int.min: -9223372036854775808
//-------------------------------------------------------------
let maxVal = Int.max //Int.max: 9223372036854775807
//-------------------------------------------------------------

print("Int.min:", UInt16.min)  // 0
//-------------------------------------------------------------
print("Int.max:", UInt16.max)  // 65535
//-------------------------------------------------------------
print("-------------------------")

//UInt  (Unsigned Int)
//min
let minVal = UInt.min //0 default: 64bit
//-------------------------------------------------------------
let maxVal = UInt.max //18446744073709551615
//-------------------------------------------------------------

// <<
var leftBitNum = 1
var leftMovedBit = leftBitNum << 3
//-------------------------------------------------------------
print(leftMovedBit)  //2 + 2^3
print("-------------------------")

//Becomes negative, then it becomes zero and it stays 0 in left bitwise
var leftBitNum = 1 //By default assigns SignedInt of 64 bit
var leftMovedBit = leftBitNum << 63 // << 63 becomes negative, 64 makes it 0. after 0 it stops. as leftmost bit is for sign
//-------------------------------------------------------------
print(leftMovedBit)
print("-------------------------")

// >>
var rightBitNum = 8
var rightMovedBit = rightBitNum >> 3
//-------------------------------------------------------------
print(rightMovedBit)  //2 + 2^3
print("------------------------- 1")

//Once becomes zero it stays zero in right bitwise
var inputNum = 1
var rightMovedBit = inputNum >> 6
//-------------------------------------------------------------
print(rightMovedBit)  //2 + 2^3
print("inputNum", inputNum)  //Input unchanged
print("-------------------------")


/// ~ reverse the bits
// reverse 0
//input + ~input = -1 => -input = ~input + 1; For all below cases
let inputNum = 0 //All zeroes
var val = ~inputNum //reverse all the bits //All ones
//-------------------------------------------------------------
print(inputNum) //prints 0
print(val)  // prints - 1
print("-------------------------")

//reverse max
let inputNum: Int = Int.max //All zeroes
var val = ~inputNum //reverse all the bits //All ones
//-------------------------------------------------------------
print("inputNum:", inputNum)  // 9223372036854775807
print("outputNum:", val)  // -9223372036854775808 //
print("-------------------------")

//reverse min
let inputNum: Int = Int.min //All zeroes
var val = ~inputNum //reverse all the bits //All ones
//-------------------------------------------------------------
print("inputNum:", inputNum)  // -9223372036854775808
print("outputNum:", val)  // 9223372036854775807
print("-------------------------")


//String bitwise operators

/// Operator overloading (for Number, Int, String etc.)

// +
// -
// *
// /


// +=

// *=

// /=

// ~=

//Comparison functions
//Int
let x = 4
let y = 5
let minVal = min(x, y)
//-------------------------------------------------------------
print("minVal:", minVal)
let maxVal = max(x, y)
//-------------------------------------------------------------
print("maxVal:", maxVal)z

//Double
let x = 4.0
let y = 5.0
let minVal = min(x, y)
//-------------------------------------------------------------
print("minVal:", minVal)
let maxVal = max(x, y)
print("maxVal:", maxVal)


//Collection functions


//Sorting functions


// Misc
// different ranges
// closed range
// partial closed range
// PartialRangeFrom
// PartialRangeTo


//Statements & iterators

//for x in 0..<len //And other ranges
//for (key, value) in array.enumerated()
//for (key, value) in dict
//switch
//


//Tree, Heap, Graphs, Minheap, Maxheap
//Balanced Binary Search Trees (BST)
//Creating these Trees and Graphs


//

print("range: ", 0...9 ~= 5) //true
print("range: ", 0...9 ~= 20) //false

// String modified ~- operator
extension String {
    static func ~= (pattern: String, value: String) -> Bool {
        return  value.contains(pattern)
    }
}

let aMatch = "awes" ~= "awesome"
print(aMatch) //true
let aNonMatch = "Awes" ~= "awesome"
print(aNonMatch) //false
