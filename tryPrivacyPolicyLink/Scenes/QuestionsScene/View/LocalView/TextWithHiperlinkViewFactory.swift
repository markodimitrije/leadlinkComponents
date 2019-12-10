//
//  TextWithHiperlinkViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 09/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class TextWithHiperlinkViewFactory: GetViewProtocol {
    
    private var textView: UITextView!
    private var myView: UIView
    
    func getView() -> UIView {
        return self.myView
    }
    
    init(text: String, hiperlinkText: String, urlString: String) {
        self.myView = TextViewFactory(inputText: "", placeholderText: "").getView()
        self.textView = self.myView.subviews.first(where: {$0 is UITextView}) as? UITextView
        configureTxtViewWithHyperlinkText(text: text, hiperlinkText: hiperlinkText, urlString: urlString)
    }
    
    func configureTxtViewWithHyperlinkText(text: String, hiperlinkText: String, urlString: String) {

        textView.isUserInteractionEnabled = true
        textView.isEditable = false

        textView.hyperLink(originalText: text + " " + hiperlinkText,
                           hyperLink: hiperlinkText,
                           urlString: urlString)
    }
}
