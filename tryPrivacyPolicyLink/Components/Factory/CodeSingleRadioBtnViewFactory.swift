//
//  CodeSingleRadioBtnViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 28/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeSingleRadioBtnViewFactory: MakeViewProtocol {
   
    var myView: UIView!
    
    func getView() -> UIView {
        return myView
    }
    
    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat) {
        
        let imageView               = UIView()
        imageView.backgroundColor   = .blue
        imageView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60.0).isActive = true

        //Text Label
        let textLabel               = UILabel()
        textLabel.backgroundColor   = .yellow
        let labelWidth = width - 68.0
        textLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        textLabel.numberOfLines = 0
        textLabel.text  = headlineText
        textLabel.textAlignment = .center

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
}
