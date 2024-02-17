
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
    var _current: Node<T>?
    var _iteratorPoint: Node<T>? //for iterator
    
    func add(item: T) {
        var node = Node(v: item)
        node._next = _current
        _current = node
    }
    
    func pop() -> T? {
        var tempNode = _current
        _current = _current?._next
        let popVal = tempNode?.val
        tempNode = nil
        return popVal
    }
    
    func peak() -> T? {
        return _current?.val
    }
}

//Add Iterator
extension Stack: IteratorProtocol, Sequence {
    func next() -> T? {
        if _iteratorPoint == nil {
            _iteratorPoint = _current
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
    stack.add(item: x)
}

print("---Print the stack elements---")
//Print via Iterator
for x in stack {
    print(x)
}
print("---Add 21---")
//
stack.add(item: 21)

print("---pop an item---")
//Pop the value and return
print(stack.pop())

//Check the value and return
print("---peak an item---")
print(stack.peak())

print("-------After a pop------")
//Print after popping one value
for x in stack {
    print(x)
}

print("-------Printing again------")
for x in stack {
    print(x)
}
