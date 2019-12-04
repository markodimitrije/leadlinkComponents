
//
//  StackViewContainingTextViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 04/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class StackViewContainingTextViewFactory: GetViewProtocol {
    
    private var myView: UIView!
    
    func getView() -> UIView {
        return self.myView
    }
    
    init(text: String, isPlaceholderText: Bool, delegate: UITextViewDelegate?) {
        
        let textView = UITextView()
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.backgroundColor = .purple
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
        textView.text = text
        textView.textColor = isPlaceholderText ? .lightGray : .black
        textView.delegate = delegate

        self.myView = UIStackView(arrangedSubviews: [textView])
    }
}
