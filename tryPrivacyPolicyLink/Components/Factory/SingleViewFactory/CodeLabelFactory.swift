//
//  CodeLabelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol LabelFactoryProtocol: GetViewProtocol {}

//class CodeLabelFactory: GroupViewFactoryProtocol {
class CodeLabelFactory: LabelFactoryProtocol {
    
    private var myView: UIView
    
    func getView() -> UIView {
        return myView
    }
    
    init(text: String) {
        
        //Text Label
        let textLabel = UILabel()
        textLabel.backgroundColor = .blue
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.textAlignment = .left

        //Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8.0

        stackView.addArrangedSubview(textLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        myView = stackView
        
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
}

