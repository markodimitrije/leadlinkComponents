//
//  ScrollViewController.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

var screenWidth = CGFloat(0)

class ScrollViewController: UIViewController {
    
    let textViewDelegate = MyTextViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.bounds.width
        
//        insertColorViewAndLabel()
//        insertLabelAndTextFieldView()
        insertCodeLabelAndTextView()
//        insertCodeSingleCheckmarkView()
//        insertCodeMultipleCheckmarkView()
//        insertHorizontalLabelTextFieldViews()
    }
    
    private func insertView() {
//        let frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: self.view.bounds.width, height: 500.0))
//        let childView = LabelAndTextField.init(frame: frame)
        let childView = LabelAndTextField()
        childView.backgroundColor = .red
        childView.update(headlineText: "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d", inputTxt: "sc dsa fdcx ads  ads d", placeholderTxt: "sc dsa fdcx ads  ads d")
        self.view.addSubview(childView)
//        childView.sizeToFit()
    }
    
    private func insertColorViewAndLabel() {
    
        let childView = CodeViewAndLabel(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
//        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
        self.view.addSubview(childView)

        }
    
    private func insertLabelAndTextFieldView() {
        
            let childView = CodeLabelAndTextField(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
    //        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
            self.view.addSubview(childView)
            }
    
    private func insertCodeLabelAndTextView() {
    
        let childView = CodeLabelAndTextView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: textViewDelegate).myView!
        self.view.addSubview(childView)
    }
    
    
    private func insertCodeSingleCheckmarkView() {
        
        let childView = CodeSingleCheckmarkView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        self.view.addSubview(childView)
    }
    
    private func insertCodeMultipleCheckmarkView() {
        
        let checkmarkA = CodeSingleCheckmarkView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkB = CodeSingleCheckmarkView(headlineText: inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkC = CodeSingleCheckmarkView(headlineText: inputText+inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarkA, checkmarkB, checkmarkC]).myView!
        
        self.view.addSubview(multipleCheckbox)
    }

    private func insertHorizontalLabelTextFieldViews() {
        let viewA = CodeLabelAndTextField(headlineText: "adc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc ds", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        let viewB = CodeLabelAndTextField(headlineText: "cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let viewC = CodeLabelAndTextField(headlineText: "cds dsx z cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let stacker = CodeHorizontalStacker(views: [viewA, viewB, viewC], width: screenWidth).myView!
        self.view.addSubview(stacker)
    }
    
}


let headlineText = "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d"
let inputText = "sc dsa fdcx ads  ads d"
let placeholderText = "sc dsa fdcx ads  ads d"


class MyTextViewDelegate: NSObject, UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
        }
    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = placeholderText
//            textView.textColor = .lightGray
//        }
//    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != placeholderText || textView.text != "" {
            textView.textColor = .black
        }
    }
}
