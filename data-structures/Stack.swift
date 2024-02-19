
//Node
class Node<T> {
    //Node properties
    var val: T?
    var _next: Node<T>?
    
    //Initializer
    init(v: T) {
        val = v
    }
}

//Stack
struct Stack<T: Equatable>  {
    
    //properties
    var _top: Node<T>?
    var _iteratorPoint: Node<T>? //for iterator
    
    mutating func push(item: T) {
        var node = Node(v: item)
        node._next = _top
        _top = node
    }
    
    mutating func pop() -> T? {
        var tempNode = _top
        _top = _top?._next
        let popVal = tempNode?.val
        tempNode = nil
        return popVal
    }
    
    func peek() -> T? {
        return _top?.val
    }
    
    func search(item: T) -> Int {
        var _curItem = _top
        var pos = 0
        if _curItem?.val == item {
            return pos
        }
        while let x = _curItem?._next {
            pos += 1
            if x.val == item {
                return pos
            }
            _curItem = x
        }
        return -1
    }
    
    //Print all the elements in given stack
    static func printElements(stack: Stack) {
        var arr: [T] = []
        for x in stack {
            arr.append(x)
        }
        print(arr)
    }
    
}

//Add Iterator
extension Stack: IteratorProtocol, Sequence {
    mutating func next() -> T? {
        if _iteratorPoint == nil {
            _iteratorPoint = _top
            return _iteratorPoint?.val
        } else {
            _iteratorPoint = _iteratorPoint?._next
            return _iteratorPoint?.val
        }
    }
}

//Create Stack
var stack = Stack<Int>()

//Input
var inputArr = Array(0...9)

//Add elements
for x in inputArr {
    stack.push(item: x)
}

print("\n---Print the stack elements---")
//Print via Iterator
Stack.printElements(stack: stack)

print("\n---Add 21---")
//
stack.push(item: 21)
print("\n---Print the stack elements after adding 21---")
//Print via Iterator
Stack.printElements(stack: stack)

print("\n---pop an item---")
//Pop the value and return
print(stack.pop())

//Check the value and return
print("\n---peek an item---")
print(stack.peek())

print("\n-------After a pop------")
//Print after popping one value

//Print via Iterator
Stack.printElements(stack: stack)

print("\n-------Printing again------")
//Print via Iterator
Stack.printElements(stack: stack)

print("\n-------Search 7-----")
print("pos of 7: ", stack.search(item: 7)) //somewhere
print("pos of 0: ", stack.search(item: 0)) //bottom
print("pos of 9: ", stack.search(item: 9)) //top
print("pos of 100: ", stack.search(item: 100)) //non-existant

