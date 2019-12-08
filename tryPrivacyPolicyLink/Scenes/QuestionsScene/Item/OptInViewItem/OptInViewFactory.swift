//
//  OptInViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

//class OptInViewFactory: GetViewProtocol {
//
//    private var textView: UITextView!
//    private var myView: UIView!
//    private let optIn: OptIn
//
//    func getView() -> UIView {
//        return self.myView
//    }
//
//    init(optIn: OptIn) {
//        self.optIn = optIn
//        loadView()
//    }
//
//    private func loadView() {
//        self.myView = CodeTextViewFactory(inputText: "", placeholderText: "").getView()
//        self.textView = self.myView.subviews.first(where: {$0 is UITextView}) as? UITextView
//        configureTxtViewWithHyperlinkText(tag: 4, optIn: optIn)
//    }
//
//    func configureTxtViewWithHyperlinkText(tag: Int, optIn: OptIn) {
//
//        textView.isUserInteractionEnabled = true
//        textView.isEditable = false
//
//        let hyperlink = optIn.privacyPolicy
//        let url = optIn.url
//
//        let text = optIn.text + " " + optIn.privacyPolicy
//
//        textView.hyperLink(originalText: text,
//                           hyperLink: hyperlink,
//                           urlString: url)
//    }
//
//}

class OptInViewFactory: GetViewProtocol {
    
    private var textView: UITextView!
    private var myView: UIView!
    private let optIn: OptIn
    
    func getView() -> UIView {
        return self.myView
    }
    
    init(optIn: OptIn, titleWithHiperlinkViewFactory: TitleWithHiperlinkViewFactory) {
        self.optIn = optIn
        self.myView = titleWithHiperlinkViewFactory.getView()
    }
    
}

class TitleWithHiperlinkViewFactory: GetViewProtocol {
    
    private var textView: UITextView!
    private var myView: UIView
    
    func getView() -> UIView {
        return self.myView
    }
    
    init(title: String, hiperlinkText: String, urlString: String) {
        self.myView = CodeTextViewFactory(inputText: "", placeholderText: "").getView()
        self.textView = self.myView.subviews.first(where: {$0 is UITextView}) as? UITextView
        configureTxtViewWithHyperlinkText(title: title, hiperlinkText: hiperlinkText, urlString: urlString)
    }
    
    func configureTxtViewWithHyperlinkText(title: String, hiperlinkText: String, urlString: String) {

        textView.isUserInteractionEnabled = true
        textView.isEditable = false

        textView.hyperLink(originalText: title + " " + hiperlinkText,
                           hyperLink: hiperlinkText,
                           urlString: urlString)
    }
}








