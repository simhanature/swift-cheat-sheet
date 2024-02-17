
class Node<T> {
    
    var val: T?
    var _next: Node<T>?
    var _current: Node<T>?
    
    init(v: T) {
        val = v
    }
    
    func add(item: T) {
        var node = Node(v: item)
        node._next = _next
        _next = node
        _current = self
    }
    
    func pop() -> T? {
        let popVal = _next?.val
        _next = _next?._next
        return popVal
    }
    
    func peak() -> T? {
        return _next?.val
    }
    
}


extension Node: IteratorProtocol, Sequence {
    typealias Element = T
    func next() -> T? {
        _current = _current?._next
        return _current?.val
    }
}

var inputArr = Array(0...9)
var stack = Node<Int>(v: inputArr.removeFirst())
for x in inputArr {
    stack.add(item: x)
}
print(stack.pop())
print(stack.peak())
for x in stack {
    print(x)
}
print("------")
stack.add(item: 21)
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print("------")
for x in stack {
    print(x)
}


        

