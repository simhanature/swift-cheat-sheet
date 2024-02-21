
//Just an experiment to understand the protocols or associated types her
//Protocol & extensions

protocol ItemStoring {
    //On the abstract level, we can create associated type. It allows concrete class to associate the type required much later.
    associatedtype DataType3
    associatedtype DataType5

    var items: [DataType3] { get set}
    var items5: [DataType5] {get set}
    mutating func add(item: DataType3)
    mutating func add(item: DataType5)
}

//Can add a default implementatio for protocol using extension
extension ItemStoring {
    //Mutating keyword allows the changes to be done on the value types
    //Here it is required because a struct which is a value type confirms to it
    mutating func add(item: DataType3) {
        items.append(item)
    }
    mutating func add(item: DataType5) {
        items5.append(item)
    }
}

struct ItemDB: ItemStoring {
    typealias DataType3 = Int
    typealias DataType5 = Double

    var items5: [Double]
    var items: [Int]
    
}

var val = ItemDB(items5: [2.0], items: [2,3,4])
val.add(item: 5)
val.add(item: 4.5)
val.add(item: 6)
val.add(item: 9.854)
print(val)

protocol Cproto {
    associatedtype DataType
}

struct DT: Cproto {
    typealias DataType = Int
}

let dt = DT()
print(dt)
