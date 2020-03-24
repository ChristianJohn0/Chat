//
//  Lorem.swift
//  Chat
//
//  Created by Christian John on 2020-03-22.
//  Copyright © 2020 Christian John. All rights reserved.
//

import Foundation
public class Lorem {
    private static let wordList = [
        "alias", "consequatur", "aut", "perferendis", "sit", "voluptatem",
        "accusantium", "doloremque", "aperiam", "eaque", "ipsa", "quae", "ab",
        "illo", "inventore", "veritatis", "et", "quasi", "architecto",
        "beatae", "vitae", "dicta", "sunt", "explicabo", "aspernatur", "aut",
        "odit", "aut", "fugit", "sed", "quia", "consequuntur", "magni",
        "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt",
        "neque", "dolorem", "ipsum", "quia", "dolor", "sit", "amet",
        "consectetur", "adipisci", "velit", "sed", "quia", "non", "numquam",
        "eius", "modi", "tempora", "incidunt", "ut", "labore", "et", "dolore",
        "magnam", "aliquam", "quaerat", "voluptatem", "ut", "enim", "ad",
        "minima", "veniam", "quis", "nostrum", "exercitationem", "ullam",
        "corporis", "nemo", "enim", "ipsam", "voluptatem", "quia", "voluptas",
        "sit", "suscipit", "laboriosam", "nisi", "ut", "aliquid", "ex", "ea",
        "commodi", "consequatur", "quis", "autem", "vel", "eum", "iure",
        "reprehenderit", "qui", "in", "ea", "voluptate", "velit", "esse",
        "quam", "nihil", "molestiae", "et", "iusto", "odio", "dignissimos",
        "ducimus", "qui", "blanditiis", "praesentium", "laudantium", "totam",
        "rem", "voluptatum", "deleniti", "atque", "corrupti", "quos",
        "dolores", "et", "quas", "molestias", "excepturi", "sint",
        "occaecati", "cupiditate", "non", "provident", "sed", "ut",
        "perspiciatis", "unde", "omnis", "iste", "natus", "error",
        "similique", "sunt", "in", "culpa", "qui", "officia", "deserunt",
        "mollitia", "animi", "id", "est", "laborum", "et", "dolorum", "fuga",
        "et", "harum", "quidem", "rerum", "facilis", "est", "et", "expedita",
        "distinctio", "nam", "libero", "tempore", "cum", "soluta", "nobis",
        "est", "eligendi", "optio", "cumque", "nihil", "impedit", "quo",
        "porro", "quisquam", "est", "qui", "minus", "id", "quod", "maxime",
        "placeat", "facere", "possimus", "omnis", "voluptas", "assumenda",
        "est", "omnis", "dolor", "repellendus", "temporibus", "autem",
        "quibusdam", "et", "aut", "consequatur", "vel", "illum", "qui",
        "dolorem", "eum", "fugiat", "quo", "voluptas", "nulla", "pariatur",
        "at", "vero", "eos", "et", "accusamus", "officiis", "debitis", "aut",
        "rerum", "necessitatibus", "saepe", "eveniet", "ut", "et",
        "voluptates", "repudiandae", "sint", "et", "molestiae", "non",
        "recusandae", "itaque", "earum", "rerum", "hic", "tenetur", "a",
        "sapiente", "delectus", "ut", "aut", "reiciendis", "voluptatibus",
        "maiores", "doloribus", "asperiores", "repellat"
    ]
    
    /**
     Return a random word.
     
     - returns: Returns a random word.
     */
    public func word() -> String {
        return Lorem.wordList.random()!
    }

    /**
     Return an array of `count` words.
     
     - parameter count: The number of words to return.
     
     - returns: Returns an array of `count` words.
     */
    public func words(nbWords: Int = 3) -> [String] {
        return Lorem.wordList.random(nbWords)
    }

    /**
     Return a string of `count` words.
     
     - parameter count: The number of words the string should contain.
     
     - returns: Returns a string of `count` words.
     */
    public func words(nbWords: Int = 3) -> String {
        return words(nbWords: nbWords).joined(separator: " ")
    }

    /**
     Generate a sentence of `nbWords` words.
     - parameter nbWords:  The number of words the sentence should contain.
     - parameter variable: If `true`, the number of words will vary between
     +/- 40% of `nbWords`.
     - returns:
     */
    public func sentence(nbWords: Int = 6) -> String {
        if nbWords <= 0 {
            return ""
        }
        
        let result: String = self.words(nbWords: nbWords)
        
        return result.firstCapitalized + "."
    }
}

extension String {
    var firstCapitalized: String {
        var string = self
        string.replaceSubrange(string.startIndex...string.startIndex, with: String(string[string.startIndex]).capitalized)
        return string
    }
}

public extension Array {
    /**
     Shuffle the array in-place using the Fisher-Yates algorithm.
     */
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if j != i {
                self.swapAt(i, j)
            }
        }
    }
    
    /**
     Return a shuffled version of the array using the Fisher-Yates
     algorithm.
     
     - returns: Returns a shuffled version of the array.
     */
    func shuffled() -> [Element] {
        var list = self
        list.shuffle()
        
        return list
    }
    
    /**
     Return a random element from the array.
     - returns: Returns a random element from the array or `nil` if the
     array is empty.
     */
    func random() -> Element? {
        return (count > 0) ? self.shuffled()[0] : nil
    }
    
    /**
     Return a random subset of `cnt` elements from the array.
     - returns: Returns a random subset of `cnt` elements from the array.
     */
    func random(_ count: Int = 1) -> [Element] {
        let result = shuffled()
        
        return (count > result.count) ? result : Array(result[0..<count])
    }
}
