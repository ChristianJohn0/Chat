//
//  SampleData.swift
//  Chat
//
//  Created by Christian John on 2020-03-22.
//  Copyright © 2020 Christian John. All rights reserved.
//

import Foundation
import MessageKit

final internal class SampleData {
    static let shared = SampleData()
    
    let samuel = Sender(senderId: "0000001", displayName: "Samuel Laurence")
    let eric = Sender(senderId: "0000002", displayName: "Eric Gordon")
    
    lazy var senders = [samuel, eric]
    let lorem = Lorem()
    
    var currentSender: Sender {
        return samuel
    }
    
    func getMessages(count: Int) -> [MockMessage] {
        var messages: [MockMessage] = []

        for _ in 1...count {
            let randomSentence = lorem.sentence(nbWords: 8)
            let sender = senders[Int(arc4random_uniform(UInt32(senders.count)))]
            let uniqueID = NSUUID().uuidString
            let date = Date()
            messages.append(MockMessage(text: randomSentence, sender: sender, messageId: uniqueID, date: date))
        }
        return messages
    }
}

