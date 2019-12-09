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
        
    }
    
}

extension UIView {
    func makeRoundedBorder(color: UIColor, cornerRadius: CGFloat) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}
