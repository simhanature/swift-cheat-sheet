//Allow T to be Equatable so that you can identify the nodes
//This node is made to serve the purpose as Binary Tree
class Node<T: Equatable>: Any {
    
    //Variables
    var val: T
    var left: Node<T>?
    var right: Node<T>?
    var count: Int = 0
    
    //parent node reference
    var parent: Node<T>? {
        didSet {
            parent?.incrementCount()
        }
    }
    
    //check if node has 1 or more childred
    var hasChildren: Bool {
        return right != nil || left != nil
    }
    
    //Constructor
    init(val: T) {
        self.val = val
    }
    
    //Get the height to the node's position
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
    
    //Helper functions
    //Swap nodes by value
    private func swapNodes(node1: Node<T>, node2: Node<T>) {
        (node1.val, node2.val) = (node2.val, node1.val)
    }
    
    //Mark: Remove
    private func execNodeRemoval(node: Node<T>) {
        let parent = node.parent
        if parent?.left == node {
            parent?.left = nil
        } else {
            parent?.right = nil
        }
        node.parent = nil
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
    
    //Mark: find a node
    func find(node: Node<T>) -> Node<T>? {
        if node == self {
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
    
    //Mark: Print
    //Add printable
    public func printableVal() -> String {
        if let x = val as? Int {
            return String(x)
        } else {
            return "undefined"
        }
    }
    
    //Print path for this element
    func printPath() {
        var path: String = String((self.val as? Int) ?? 0)
        var par = self.parent
        while par != nil {
            path += " <- " + String((par?.val as? Int) ?? 0)
            par = par?.parent
        }
        print("Path of \(self.val): \(path)")
    }
    
    
    
    //Mark: Depth first traversal
    //#1. Preorder
    func getPreorder(node: Node, elems: inout [String]) {
        elems.append(node.printableVal())
        if let leftNode = node.left{
            getPreorder(node: leftNode, elems: &elems)
        }
        if let rightNode = node.right{
            getPreorder(node: rightNode, elems: &elems)
        }
    }
    
    func printPreorder() {
        var elems = [String]()
        getPreorder(node: self, elems: &elems)
        print("preorder:", elems)
    }
    
    //#2. Inorder
    func getInorder(node: Node, elems: inout [String]) {
        if let leftNode = node.left{
            getInorder(node: leftNode, elems: &elems)
        }
        elems.append(node.printableVal())
        if let rightNode = node.right{
            getInorder(node: rightNode, elems: &elems)
        }
    }
    
    func printInorder() {
        var elems = [String]()
        getInorder(node: self, elems: &elems)
        print("inorder:", elems)
    }
    
    //#3. Postorder
    func getPostorder(node: Node, elems: inout [String]) {
        if let leftNode = node.left{
            getPostorder(node: leftNode, elems: &elems)
        }
        if let rightNode = node.right{
            getPostorder(node: rightNode, elems: &elems)
        }
        elems.append(node.printableVal())
    }
    
    func printPostorder() {
        var elems = [String]()
        getPostorder(node: self, elems: &elems)
        print("postorder:", elems)
    }

    //Mark: traversal by breadth
    func getByLevels(level: Int, elems: inout [String]) {
        if level == 0 {
            elems.append(self.printableVal() + " <= " + (self.parent?.printableVal() ?? "root"))
        } else if level > 0 {
            if let lLeft = self.left {
                lLeft.getByLevels(level: level - 1, elems: &elems)
            }
            if let lRight = self.right {
                lRight.getByLevels(level: level - 1, elems: &elems)
            }
        }
    }
    
    ///Print tree as readable
    func printByBreadth() {
        for x in 0..<self.height() {
            var elems: [String] = []
            self.getByLevels(level: x, elems: &elems)
            print("level: \(x)")
            print("elements: \(elems)")
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

struct BinaryTree<T: Equatable> {
    
    var root: Node<T>?
    
    ///Generate Tree from Array
    mutating func generate(arr: [T]) {
        var arr = arr
        guard arr.count > 0 else {
            return
        }
        self.root = Node(val: arr.removeFirst())
        for x in arr {
            self.root?.add(node: Node(val: x))
        }
    }
    
    ///Print tree as readable
    func printByBreadth() {
        root?.printByBreadth()
    }
    
    func printPreorder() {
        root?.printPreorder()
    }
    
    func printInorder() {
        root?.printInorder()
    }
    
    func printPostorder() {
        root?.printPostorder()
    }
    
}

//generate elements
var inputArr = Array((0...31))

//construct tree
var tree = BinaryTree<Int>()
tree.generate(arr: inputArr)

print("\r\n---By breadth traversal-------")
//By breadth traversal
tree.printByBreadth()

print("\r\n---By depth traversal-------")
//By depth traversal
tree.printPreorder()
tree.printInorder()
tree.printPostorder()
