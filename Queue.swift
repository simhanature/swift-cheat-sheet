//Node of queues
class Node<T> {
    
    //Properties
    var val: T?
    var _next: Node<T>?
    
    init(v: T) {
        val = v
    }
    
}

//Queue
struct Queue<T: Equatable> {
    
    //properties
    var _tail: Node<T>?
    var _head: Node<T>?
    var _iteratorPoint: Node<T>?
        
    mutating func enqueue(item: T) {
        let node = Node(v: item)
        if _head == nil {
            _head = node
            _tail = node
        } else {
            _tail?._next = node
            _tail = node
        }
    }
    
    mutating func dequeue() -> T? {
        let dequeueValue = _head?.val
        _head = _head?._next
        return dequeueValue
    }
    
    func peek() -> T? {
        return _head?.val
    }
    
    func search(item: T) -> Int {
        var pos = 0
        if item == _head?.val {
            return pos
        }
        
        var curItem = _head
        while let x = curItem?._next  {
            pos += 1
            if x.val == item {
                return pos
            }
            curItem = x
        }
        return -1
    }
    
    static func printElements(queue: Queue) {
        var elems: [T] = []
        for x in queue {
            elems.append(x)
        }
        print(elems)
    }

}

//enqueue iteration
extension Queue: IteratorProtocol, Sequence {
    mutating func next() -> T? {
        if _iteratorPoint == nil {
            _iteratorPoint = _head
            return _head?.val
        } else {
            _iteratorPoint = _iteratorPoint?._next
            return _iteratorPoint?.val
        }
    }
}

//Create Queue
var queue = Queue<Int>()
//Input values
var inputArr = Array(0...9)
for x in inputArr {
   queue.enqueue(item: x)
}

print("\n----Print Elements-----")
Queue.printElements(queue: queue)

print("\n---dequeue 3 elements-----")
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())

print("\n---do a peek-----")
print(queue.peek())

print("\n----Print Elements-----")
Queue.printElements(queue: queue)

print("\n----enqueue 3 Elements-----")
queue.enqueue(item: 101)
queue.enqueue(item: 102)
queue.enqueue(item: 103)

print("\n----Print Elements-----")
Queue.printElements(queue: queue)

print("\n---dequeue 3 elements-----")
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())

print("\n----Print Elements-----")
Queue.printElements(queue: queue)

print("\n----Search Element-----")
print("find 6: ", queue.search(item: 6)) //head
print("find 8: ", queue.search(item: 8)) //random
print("find 50: ", queue.search(item: 50)) //non-existent
print("find 103: ", queue.search(item: 103)) //tail
