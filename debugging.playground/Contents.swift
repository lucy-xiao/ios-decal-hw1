//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
/*   words[] is already recognized as an optional with "words: [String?], therefore you don't need to
tell the program that it will be optional */
/* Also, should all these functions be class func because in the execution functions at the bottom of the code, you're doing Foo.isAnagram(), therefore isAnagram() should be a class func? */

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    class func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
    
//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
/* You cannot pass an immutable variable, i,  into the for loop. "let" makes "i" immutable.
"let" should be changed to "var" You should return a boolean true, not nil because the function returns Bool! and if the words aren't not requal to reversed words, then the function should return true. */
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters : [Character : Int] = [:]
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
/* countLetters is used before being initialized in line 65 and we get an error. We should initialize countLetters in line 53 to an empty dictionary. */

//: **Do not** change anything below.
//: You should be able to call the methods as is.

Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)
