
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
class Stack<T>  {
    
    //properties
    var _top: Node<T>?
    var _iteratorPoint: Node<T>? //for iterator
    
    func push(item: T) {
        var node = Node(v: item)
        node._next = _top
        _top = node
    }
    
    func pop() -> T? {
        var tempNode = _top
        _top = _top?._next
        let popVal = tempNode?.val
        tempNode = nil
        return popVal
    }
    
    func peek() -> T? {
        return _top?.val
    }
    
}

//Add Iterator
extension Stack: IteratorProtocol, Sequence {
    func next() -> T? {
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

print("---Print the stack elements---")
//Print via Iterator
for x in stack {
    print(x)
}
print("---Add 21---")
//
stack.push(item: 21)

print("---pop an item---")
//Pop the value and return
print(stack.pop())

//Check the value and return
print("---peek an item---")
print(stack.peek())

print("-------After a pop------")
//Print after popping one value
for x in stack {
    print(x)
}

print("-------Printing again------")
for x in stack {
    print(x)
}
