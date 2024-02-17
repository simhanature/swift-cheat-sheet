import Foundation

class Node<T> {
    
    var val: T?
    var _tail: Node<T>?
    var _head: Node<T>?
    var _next: Node<T>?
    var _prev: Node<T>?
    var _iteratorPoint: Node<T>?
    
    init(v: T) {
        val = v
    }
    
    func add(item: T) {
        var node = Node(v: item)
        if _head == nil {
            _head = node
            _tail = node
        } else {
            _tail?._prev = node
            node._next = _tail
            _tail = node
        }
    }
    
    func pop() -> T? {
        let popValue = _head?.val
        _head = _head?._prev
        return popValue
    }
    
    func peak() -> T? {
        return _head?.val
    }
    
    func printVal() -> String? {
        return String(val as? Int ?? 0)
    }
}

//Add Iterator
extension Node: IteratorProtocol, Sequence {
    func next() -> T? {
        if _iteratorPoint == nil {
            _iteratorPoint = _head
            return _head?.val
        } else {
            _iteratorPoint = _iteratorPoint?._prev
            return _iteratorPoint?.val
        }
    }
}

//Input via Array
var inputArr = Array(0...9)
let queue = Node(v: 0)
for x in inputArr {
   queue.add(item: x)
}
print("---------")

//Print via Iterator
for x in queue {
    print("x: ", x)
}
