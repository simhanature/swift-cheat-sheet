//Allow T to be Equatable so that you can identify the nodes
//This is made to be Binary Tree
class Node<T: Equatable>: Any {
    
    //Variables
    var val: T
    var left: Node<T>?
    var right: Node<T>?
    var count: Int = 0
    
    var parent: Node<T>? {
        didSet {
            parent?.incrementCount()
        }
    }
    
    var hasChildren: Bool {
        return right != nil || left != nil
    }
    
    //Constructor
    init(val: T) {
        self.val = val
    }
    
    //Get the height
    public func height() -> Int {
        if left == nil && right == nil  {
            return 1
        } else {
            let lH = left?.height() ?? 0
            let rH = right?.height() ?? 0
            return max(lH, rH) + 1
        }
    }
    
    //
    public func incrementCount() {
        count += 1
        parent?.incrementCount()
    }
    
    // Add - Remove - Find
    func add(node: Node<T>) {
        if left == nil {
            left = node
            left?.parent = self
        } else if right == nil {
            right = node
            right?.parent = self
        } else {
            if right?.count ?? 0  < left?.count ?? 0{
                right?.add(node: node)
            } else {
                left?.add(node: node)
            }
        }
    }
    
    private func execNodeRemoval(node: Node<T>) {
        let parent = node.parent
        if parent?.left == node {
            parent?.left = nil
        } else {
            parent?.right = nil
        }
        node.parent = nil
    }
    
    //Swap nodes bu value
    private func swapNodes(node1: Node<T>, node2: Node<T>) {
        (node1.val, node2.val) = (node2.val, node1.val)
    }
    
    //
    private func checkAndRemove(myNode: Node<T>) -> Node<T> {
        if !myNode.hasChildren {
            execNodeRemoval(node: myNode)
            return myNode
        } else {
            var swapNode = myNode.left ?? myNode.right
            swapNodes(node1: swapNode!, node2: myNode)
            checkAndRemove(myNode: swapNode!)
        }
        return myNode
    }
    
    //Remove the node
    func remove(node: Node<T>) -> Node<T>? {
        if let myNode = find(node: node) {
            return checkAndRemove(myNode: myNode)
        }
       return nil
    }

    //find the node
    func find(node: Node<T>) -> Node<T>? {
        if node.val == self.val {
            return self
        } else {
            if let lNode = left?.find(node: node) {
                return lNode
            }
            else if let rNode = right?.find(node: node) {
                return rNode
            } else {
                return nil
            }
        }
    }
    
    ///Make Printable
    public func printableVal() -> String {
        if let x = val as? Int {
            return String(x)
        } else {
            return "undefined"
        }
    }

    //print by levels
    func printByLevels(node: Node<T>, level: Int, elems: inout [String]) {
        if level == 0 {
            elems.append(node.printableVal() + "<=" + (node.parent?.printableVal() ?? "root"))
        } else if level > 0 {
            if let lLeft = node.left {
                self.printByLevels(node: lLeft, level: level - 1, elems: &elems)
            }
            if let lRight = node.right {
                self.printByLevels(node: lRight, level: level - 1, elems: &elems)
            }
        }
    }
    
    ///Print path for element
    func printPath() {
        var path: String = String((self.val as? Int) ?? 0)
        var par = self.parent
        while par != nil {
            path += "<-" + String((par?.val as? Int) ?? 0)
            par = par?.parent
        }
        print("Path of \(self.val): \(path)")
    }
    
    ///Print tree as readable
    func printByBreadth() {
        for x in 0..<self.height() {
            var elems: [String] = []
            tree.printByLevels(node: tree, level: x, elems: &elems)
            print("level: \(x)")
            print("elements: \(elems)")
        }
    }
    
    ///Generate Tree from Array
    func generate(arr: [T]) {
        for x in arr {
            var node: Node<T> = Node(val: x)
            add(node: node)
        }
    }
    
}

//Make it Equatable
extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
            && lhs.left == rhs.left
            && lhs.right == rhs.right
    }
}


//generate elements
var inputArr = Array((0...31))

//construct tree
let tree = Node(val: inputArr.removeFirst())
tree.generate(arr: inputArr)

//print tree height and count
print("height: ", tree.height())
print("count: ", tree.count)

//print tree
tree.printByBreadth()

//Find and print path of a node
let myNode = tree.find(node: Node(val: 14))
myNode?.printPath()
let removedNode = tree.remove(node: Node(val: 14))
print("removed Node: ", removedNode?.printableVal()) //Returned node value is not correct. need to check
myNode?.printPath()
tree.printByBreadth()

