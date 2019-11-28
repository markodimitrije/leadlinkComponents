//
//  CheckboxOptionProtocol.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 28/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol CheckboxOptionProtocol {
    func getCheckboxImage() -> UIImage
    func setCheckboxImage(_ image: UIImage)
    func getText() -> String
    func setText(_ text: String)
}

class CheckboxOptionView: ViewProtocol, CheckboxOptionProtocol {
    
    var view: UIView
    
    init(factory: CodeSingleCheckmarkViewFactory) {
        self.view = factory.getView()
    }
    
    func getCheckboxImage() -> UIImage {
        let btnImageView = view.subviews.first(where: {$0 is UIImageView}) as! UIImageView
        return btnImageView.image!
    }
    
    func setCheckboxImage(_ image: UIImage) {
        let btnImageView: UIImageView = view.subviews.first(where: {$0 is UIImageView})! as! UIImageView
        btnImageView.image = image
    }
    
    func getText() -> String {
        let textLabel = view.subviews.first(where: {$0 is UILabel}) as! UILabel
        return textLabel.text ?? ""
    }
    
    func setText(_ text: String) {
        let textLabel = view.subviews.first(where: {$0 is UILabel}) as! UILabel
        textLabel.text = text
    }
    
}
