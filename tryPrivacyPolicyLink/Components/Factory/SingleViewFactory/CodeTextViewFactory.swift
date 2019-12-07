//
//  CodeTextViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol CodeTextViewFactoryProtocol: GetViewProtocol {}

class CodeTextViewFactory: CodeTextViewFactoryProtocol {
    
    private var myView: UIView
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    init(inputText: String, placeholderText: String, width: CGFloat) {
        
        func getTextColor(inputText: String, placeholderText: String) -> UIColor {
            if inputText == "" { return .lightGray }
            return (inputText != placeholderText) ? .black : .lightGray
        }
        
        func getText(inputText: String, placeholderText: String) -> String {
            if inputText == "" || inputText == placeholderText {
                return placeholderText
            }
            return inputText
        }
        
        //textField
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
        textView.makeRoundedBorder(color: .darkGray, cornerRadius: 5.0)
        
        textView.text = getText(inputText: inputText, placeholderText: placeholderText)
        textView.textColor = getTextColor(inputText: inputText, placeholderText: placeholderText)

        //Stack View
        let stackView = UIStackView()
        stackView.addArrangedSubview(textView)

        myView = stackView
        
        textView.widthAnchor.constraint(greaterThanOrEqualToConstant: width/2).isActive = true
        textView.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
        textView.textContainerInset = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        
    }

}


