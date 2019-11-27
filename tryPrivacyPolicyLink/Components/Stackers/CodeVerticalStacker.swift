//
//  CodeVerticalStacker.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeVerticalStacker {
    
    var myView: UIView!
    
    init(views: [UIView]) {

        //Stack View
        let stackView   = UIStackView(arrangedSubviews: views)
        stackView.axis  = .vertical
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;

        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
}






