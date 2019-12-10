//
//  CodeLabelAndTextView.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol TextAreaViewFactoryProtocol: GetViewProtocol {}

class TextAreaViewFactory: TextAreaViewFactoryProtocol {
    
    private let labelFactory: LabelFactory
    private let textViewFactory: TextViewFactory
    private var myView: UIView!
    
    weak var delegate: UITextViewDelegate?
    
    func getView() -> UIView {
        return myView
    }
    
    init(labelFactory: LabelFactory, textViewFactory: TextViewFactory) {
        self.labelFactory = labelFactory
        self.textViewFactory = textViewFactory
        loadView()
    }
    
    private func loadView() {
        
        let textLabel = labelFactory.getView()
        let textView = textViewFactory.getView()
        
        // set constraints to max width...
        textLabel.widthAnchor.constraint(equalToConstant: allowedWidth).isActive = true
        textView.widthAnchor.constraint(equalToConstant: allowedWidth).isActive = true
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200.0).isActive = true
        
        //Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8.0

        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        myView = stackView
    }
}
