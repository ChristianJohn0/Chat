//
//  ChatSwiftUIViewController.swift
//  Chat
//
//  Created by Christian John on 2020-03-22.
//  Copyright © 2020 Christian John. All rights reserved.
//

import SwiftUI

struct ChatSwiftUIViewController: UIViewControllerRepresentable {
    let chatViewController = ChatViewController()
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<ChatSwiftUIViewController>) -> UIViewController {
        return chatViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ChatSwiftUIViewController>) {
        
    }
}

struct ChatSwiftUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        ChatSwiftUIViewController()
    }
}
