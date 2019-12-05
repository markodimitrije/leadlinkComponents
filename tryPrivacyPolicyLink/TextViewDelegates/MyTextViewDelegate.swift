//
//  MyTextViewDelegate.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 27/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class MyTextViewDelegate: NSObject, UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
        } else {
            print("dssjbddjbds")
        }
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != placeholderText || textView.text != "" {
            textView.textColor = .black
        }
    }
}

let placeholderText = "implement me"
