
//Utiilty to get substring
//Get substring by index quickly
extension String {
    
    subscript(range : ClosedRange<Int>)-> String {
        let l = self.index(self.startIndex, offsetBy: range.lowerBound)
        let u = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[l...u])
    }
    
    subscript(range : PartialRangeFrom<Int>)-> String {
        let l = self.index(self.startIndex, offsetBy: range.lowerBound)
        let u = self.index(before: endIndex)
        return String(self[l...u])
    }
    
    subscript(range : PartialRangeThrough<Int>)-> String {
        let l = self.startIndex
        let u = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[l...u])
    }
    
    subscript(range : PartialRangeUpTo<Int>)-> String {
        let l = self.startIndex
        let u = self.index(self.startIndex, offsetBy: range.upperBound - 1)
        return String(self[l...u])
    }

}

var greeting = "Hello, playground"

//Test the ranges
print(greeting[0...4]) //ClosedRange //Hello
print(greeting[3...]) //PartialRangeFrom //lo, playground
print(greeting[...4]) //PartialRangeThrough //Hello
print(greeting[..<4]) //PartialRangeUpTo //Hell
