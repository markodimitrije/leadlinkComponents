//
//  LabelAndTextViewDropdownFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 27/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol DropdownFactoryProtocol: GetViewProtocol {}

//class LabelAndTextViewDropdownFactory: GetViewProtocol {
class LabelAndTextViewDropdownFactory:  DropdownFactoryProtocol {
    
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
        
        // set constraints to max width...
        textLabel.widthAnchor.constraint(equalToConstant: allowedWidth).isActive = true
        textView.widthAnchor.constraint(equalToConstant: allowedWidth).isActive = true
        
        
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

