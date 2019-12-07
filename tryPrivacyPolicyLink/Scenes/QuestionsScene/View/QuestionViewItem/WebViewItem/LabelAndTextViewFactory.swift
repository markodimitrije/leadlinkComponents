//
//  CodeLabelAndTextView.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LabelAndTextViewFactory: GetViewProtocol {
    
    var myView: UIView!
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    init(labelFactory: CodeLabelFactory, textViewFactory: CodeTextViewFactory, heightGreaterOrEqual: CGFloat) {
        
        //textField
        let textView = (textViewFactory.getView()).findViews(subclassOf: UITextView.self).first!
        let textLabel = (labelFactory.getView()).findViews(subclassOf: UILabel.self).first!
        
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: heightGreaterOrEqual).isActive = true
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        myView = stackView
        
//        textView.leadingAnchor.constraint(equalTo: textView.superview!.leadingAnchor, constant: 8).isActive = true
//        textView.superview!.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 8).isActive = true
        
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
}

/* class LabelAndTextViewFactory: GetViewProtocol {
    
    var myView: UIView!
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    init(headlineText: String, inputText: String, placeholderText: String, heightGreaterOrEqual: CGFloat) {
        
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
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: heightGreaterOrEqual).isActive = true
        textView.makeRoundedBorder(color: .darkGray, cornerRadius: 5)
        textView.textContainerInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        
        textView.text = getText(inputText: inputText, placeholderText: placeholderText)
        textView.textColor = getTextColor(inputText: inputText, placeholderText: placeholderText)
        
        //Text Label
        let textLabel = UILabel()
        textLabel.backgroundColor = .yellow
        textLabel.numberOfLines = 0
        textLabel.text  = headlineText
        textLabel.textAlignment = .center

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        myView = stackView
        
        textView.leadingAnchor.constraint(equalTo: textView.superview!.leadingAnchor, constant: 8).isActive = true
        textView.superview!.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 8).isActive = true
        
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
} */

extension UIView {
    func makeRoundedBorder(color: UIColor, cornerRadius: CGFloat) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}
