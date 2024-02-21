import Foundation

class Prime {
    
    var primes: [Int] = []
    
    //simple prime func // best for single no.
    @objc dynamic func isPrime(num: Int) -> Bool {
        if num < 2 {
            return false
        }
        if num == 2 {
            return true
        }
        
        //floor is okay, ceil is not required but for 3. range becomes (2...1)
        let sqrtNum = Int(ceil(sqrt(Double(num))))
        for i in 2...sqrtNum {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    //best for generating list by makng use of only primes generated already
    func isPrimeN(num: Int) -> Bool {
        if num < 2 {
            return false
        }
        if num == 2 {
            return true
        }
        
        let sqrtNum = Int(ceil(sqrt(Double(num))))
        for val in primes {
            if val > sqrtNum {
                return true
            }
            if num % val == 0 {
                return false
            }
        }
        return true
    }
    
    //Generate all prime numbers under the given limit
    func primesUnder(n: Int) {
        for i in 2..<n {
            if isPrimeN(num: i) {
                primes.append(i)
            }
        }
        print("for under:", n)
        print("all primes:", primes)
        print("primes count: ", primes.count)
    }
    
    func run() {
        //Check 1 prime
        print(isPrime(num: 67280421310721))
        //
        let date = Date()
        primesUnder(n: 100)
        print("time taken: ", Date().timeIntervalSince1970 - date.timeIntervalSince1970)
    }
    
    
}

extension Prime {
    
    @objc func tracked_isPrime(num: Int) -> Bool {
        //Check 1 prime
        let date1 = Date()
        defer {
            print("swizzle: time taken: ", Date().timeIntervalSince1970 - date1.timeIntervalSince1970)
        }
        return tracked_isPrime(num: num)
    }
       
    static func swizzle() {
        let originalSelector = #selector(Prime.isPrime(num:))
        let swizzledSelector = #selector(Prime.tracked_isPrime(num:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
                 
}

//Swizzle can be ignored, it is just for printing the time taken and to test swizzling functionality
//Initiate Swizzle
Prime.swizzle()

//Run test
let p = Prime()
p.run()
