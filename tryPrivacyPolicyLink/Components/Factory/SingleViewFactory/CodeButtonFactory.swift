//
//  CodeButtonFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeButtonFactory {
    
    private var myView: UIView
    
    func getView() -> UIView {
        return myView
    }
    
    init(title: String, width: CGFloat) {
        
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: width*0.9).isActive = true
        
        button.backgroundColor = .green
        button.setTitle(title, for: .normal)
        button.isUserInteractionEnabled = true
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(button)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        //textView.delegate = delegate
        myView = stackView
    }
    
}


