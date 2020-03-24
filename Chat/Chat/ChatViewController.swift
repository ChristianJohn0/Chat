//
//  ChatViewController.swift
//  Chat
//
//  Created by Christian John on 2020-03-22.
//  Copyright © 2020 Christian John. All rights reserved.
//

import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
    var messages: [MockMessage] = []
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMessagesCollectionView()
        configureMessageInputBar()
        messages = SampleData.shared.getMessages(count: 20)
    }
    
    func configureMessagesCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.backgroundColor = .systemBackground
        
        scrollsToBottomOnKeyboardBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false
        
        messagesCollectionView.addSubview(refreshControl)
//        refreshControl.addTarget(self, action: #selector(loadMoreMessages), for: .valueChanged)
    }
    
    func configureMessageInputBar() {
        messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = .systemBlue
        messageInputBar.sendButton.tintColor = .systemBlue
    }
}

extension ChatViewController: MessagesDataSource {

    func currentSender() -> SenderType {
        return SampleData.shared.currentSender
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessageInputBarDelegate {}
