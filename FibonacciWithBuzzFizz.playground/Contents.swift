import Foundation

func isPrime(_ input: Int) -> Bool {
    if input <= 1 {
        return false
    } else if input == 2 {
        return true
    }
    
    for i in 2...Int(sqrt(Double(input))) {
        if input % i == 0 {
            return false
        }
    }
    
    return true
}

/**
 @brief Returns an array of strings depending on the fibonacci sequence being Buzz, Fizz, FizzBuzz, BuzzFizz, or the number.
 @description The order in which the logic is layed out in the question is...
 * "Buzz" when F(n) is divisible by 3.
 * "Fizz" when F(n) is divisible by 5.
 * "FizzBuzz" when F(n) is divisible by 15.
 * "BuzzFizz" when F(n) is prime.
 * the value F(n) otherwise.
 
 @param input is the fibonacci number (ie F0 = 0, F2 = 1, etc.)
 @return An array of strings which will return the appropriate string specified in the description
 */
func fibonacciAndFizzBuzz(_ input: Int) -> [String] {
    // Technically 0%3 return 0 so return Buzz
    if input == 0 {
        return ["Buzz"]
    }
    
    // Since 1%3 != 0, 1%5 != 0 and 1 is not a prime, then the number is returned
    var ret: [String] = ["Buzz", "1"]
    if input == 1 {
        return ret
    }
    
    var a = 0
    var b = 1
    
    for _ in 1..<input {
        let t = a
        a = b
        b = t+b
        
        let isModule3True = (b%3 == 0)
        let isModule5True = (b%5 == 0)
        
        if isModule3True && isModule5True {
            ret.append("FizzBuzz")
        }
        else if isModule3True {
            ret.append("Buzz")
        } else if isModule5True {
            ret.append("Fizz")
        } else if isPrime(b) {
            ret.append("BuzzFizz")
        } else {
            ret.append("\(b)")
        }
    }
    
    return ret
}

var comparisonArray = ["Buzz", "1", "1", "BuzzFizz", "Buzz"]
// Normally unit tests would be put in a different file with proper test cases for checking the conditions.
if fibonacciAndFizzBuzz(4) == comparisonArray {
    //XCTAssert
    print("passed")
} else {
    print("Failed")
}

comparisonArray = ["Buzz", "1", "1", "BuzzFizz", "Buzz", "Fizz", "8", "BuzzFizz", "Buzz", "34", "Fizz", "BuzzFizz", "Buzz", "BuzzFizz", "377", "Fizz", "Buzz", "BuzzFizz", "2584", "4181", "FizzBuzz"]
if fibonacciAndFizzBuzz(20) == comparisonArray{
    print("passed")
} else {
    print("failed")
}