import Foundation

var primes: [Int] = []

//simple prime func // best for single no.
func isPrime(num: Int) -> Bool {
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

//Check 1 prime
let date1 = Date()
print(isPrime(num: 67280421310721))
print("time taken to check ths prime: ", Date().timeIntervalSince1970 - date1.timeIntervalSince1970)

//Get all primes under given number.
let date = Date()
primesUnder(n: 200000)
print("time taken: ", Date().timeIntervalSince1970 - date.timeIntervalSince1970)

