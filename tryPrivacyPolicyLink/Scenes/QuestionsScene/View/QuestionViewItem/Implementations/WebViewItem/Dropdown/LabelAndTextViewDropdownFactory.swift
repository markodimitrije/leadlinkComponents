//
//  LabelAndTextViewDropdownFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 27/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LabelAndTextViewDropdownFactory {
    
    private let labelFactory: CodeLabelFactory
    private let textViewFactory: CodeTextViewFactory
    private var myView: UIView!
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    init(labelFactory: CodeLabelFactory, textViewFactory: CodeTextViewFactory) {
        self.labelFactory = labelFactory
        self.textViewFactory = textViewFactory
        loadView()
    }
    
    private func loadView() {
        
        //Text Label
        let textLabel = labelFactory.getView()
        
        //textField
        let textView = textViewFactory.getView()
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        myView = stackView
    }
    
    /*
    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat, delegate: UITextViewDelegate?) {
        
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
        
        //Text Label
        let textLabel               = UILabel()
        textLabel.backgroundColor   = .yellow
        textLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        textLabel.numberOfLines = 0
        textLabel.text  = headlineText
        textLabel.textAlignment = .center
        
        //textField
        let textView             = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        textView.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true
        
        textView.text = getText(inputText: inputText, placeholderText: placeholderText)
        textView.textColor = getTextColor(inputText: inputText, placeholderText: placeholderText)
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        textView.delegate = delegate
        myView = stackView
        
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
    
    
//
//    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat, delegate: UITextViewDelegate?) {
//
//        func getTextColor(inputText: String, placeholderText: String) -> UIColor {
//            if inputText == "" { return .lightGray }
//            return (inputText != placeholderText) ? .black : .lightGray
//        }
//
//        func getText(inputText: String, placeholderText: String) -> String {
//            if inputText == "" || inputText == placeholderText {
//                return placeholderText
//            }
//            return inputText
//        }
//
//        //Text Label
//        let textLabel               = UILabel()
//        textLabel.backgroundColor   = .yellow
//        textLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
//        textLabel.numberOfLines = 0
//        textLabel.text  = headlineText
//        textLabel.textAlignment = .center
//
//        //textField
//        let textView             = UITextView()
//        textView.isScrollEnabled = false
//        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
//        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
//        textView.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true
//
//        textView.text = getText(inputText: inputText, placeholderText: placeholderText)
//        textView.textColor = getTextColor(inputText: inputText, placeholderText: placeholderText)
//
//        //Stack View
//        let stackView   = UIStackView()
//        stackView.axis  = .vertical
//        stackView.distribution  = .equalSpacing
//        stackView.alignment = .center
//        stackView.spacing   = 8.0
//
//        stackView.addArrangedSubview(textLabel)
//        stackView.addArrangedSubview(textView)
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        textView.delegate = delegate
//        myView = stackView
//
//        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
//    }
    */
}