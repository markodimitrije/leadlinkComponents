//
//  CodeLabelAndTextFieldFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeLabelAndTextFieldFactory: MakeViewProtocol {
    
    var resultView: LabelAndTextField!
    var myView: UIView!
    
    func getView() -> UIView {
        return myView
    }
    
    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat) {
        
        //textField
        let textField               = UITextField()
        textField.backgroundColor   = .cyan
        textField.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        textField.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true

        //Text Label
        let textLabel               = UILabel()
        textLabel.backgroundColor   = .yellow
        textLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
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
        stackView.addArrangedSubview(textField)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
}
