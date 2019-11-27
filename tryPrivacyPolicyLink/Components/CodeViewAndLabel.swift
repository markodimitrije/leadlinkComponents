//
//  CodeLabelAndTextField.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeViewAndLabel {
    
    var resultView: LabelAndTextField!
    var myView: UIView!
    
    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat) {
//
        let imageView               = UIView()
        imageView.backgroundColor   = .blue
        imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true

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

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
}
