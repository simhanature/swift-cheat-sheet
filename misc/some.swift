//
import Foundation

protocol Animal {
    func cprint()
}

extension Animal {
    func cprint() {
        print("animal")
    }
}

class Dog: Animal {
    func cprint() {
        print("It's Dog")
    }
}

class Cat: Animal {
    func cprint() {
        print("It's Cat")
    }
}

var a: [some Animal] = [Cat(), Cat()]
for x in a {
    x.cprint()
}

var b: [some Animal] = [Dog(), Dog()]
for x in b {
    x.cprint()
}

var c: [some Animal] = Array(repeating: Dog(), count: 3)
c = Array(repeating: Dog(), count: 3) //Not allowed

var d: [some Animal] = [Dog(), Cat()] //Not allowed

var e: [Animal] = [Dog(), Cat()] //allowed


for x in b {
    x.cprint()
}

