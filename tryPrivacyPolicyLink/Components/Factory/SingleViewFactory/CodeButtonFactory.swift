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
        
        //Button
        let rect = CGRect(origin: CGPoint.zero, size: CGSize.init(width: 0.8*width, height: 280))
        let button = UIButton(frame: rect)
        button.backgroundColor = .green
        button.setTitle(title, for: .normal)
        button.isUserInteractionEnabled = true
        
        myView = button
        
    }
    
}


