//
//  LabelTextViewProtocol.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 28/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol LabelTextViewProtocol {
    func getTitle() -> String
    func setTitle(_ text: String)
    func getText() -> String
    func setText(_ text: String)
}

class LabelTextView: HasViewPropertyProtocol, LabelTextViewProtocol {
    
    var view: UIView
    
    init(factory: TextAreaViewFactory) {
        self.view = factory.getView()
    }
    
    func getTitle() -> String {
        let textLabel = view.subviews.first(where: {$0 is UILabel}) as! UILabel
        return textLabel.text ?? ""
    }
    
    func setTitle(_ text: String) {
        let textLabel = view.subviews.first(where: {$0 is UILabel}) as! UILabel
        textLabel.text = text
    }
    
    func getText() -> String {
        let textView = view.subviews.first(where: {$0 is UITextView}) as! UITextView
        return textView.text ?? ""
    }
    
    func setText(_ text: String) {
        let textView = view.subviews.first(where: {$0 is UITextView}) as! UITextView
        textView.text = text
    }
}
