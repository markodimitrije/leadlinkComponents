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
    init(text: String, width: CGFloat, delegate: UITextViewDelegate?) {
        
        //textView
        let textView             = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        textView.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true
        
        textView.textColor = .black
        textView.text = text

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(textView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        textView.delegate = delegate
        myView = stackView
        
    }

}


