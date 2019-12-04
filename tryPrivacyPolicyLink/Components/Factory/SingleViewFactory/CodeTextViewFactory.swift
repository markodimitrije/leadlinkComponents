//
//  CodeTextViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeTextViewFactory {
    
    private var myView: UIView
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    //init(text: String, width: CGFloat) {
    init(inputText: String, placeholderText: String, width: CGFloat, delegate: UITextViewDelegate?) {
        
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
        let textView             = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
//        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
//        textView.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true
        
        textView.text = getText(inputText: inputText, placeholderText: placeholderText)
        textView.textColor = getTextColor(inputText: inputText, placeholderText: placeholderText)

        //Stack View
        let stackView   = UIStackView()
        stackView.addArrangedSubview(textView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        textView.delegate = delegate
        myView = stackView
        
    }

}


