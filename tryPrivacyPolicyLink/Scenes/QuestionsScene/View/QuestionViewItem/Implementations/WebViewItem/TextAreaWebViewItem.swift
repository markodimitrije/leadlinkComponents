//
//  TextAreaWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 01/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class TextAreaWebViewItem: NSObject, QuestionPageViewModelProtocol {
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
        super.init()
        loadView()
    }
    
    private func loadView() {
        let inputText = answer?.content.first ?? ""
        let placeholderText = self.question.description ?? ""
        self.view = CodeLabelAndTextViewFactory(headlineText: question.title, inputText: inputText, placeholderText: placeholderText, width: 414.0, delegate: self).getView()
        view.backgroundColor = .red
    }
    
    func getView() -> UIView {
        return self.view
    }
    
    func getActualAnswer() -> Answer? {
        let text = (view.subviews.first(where: {$0 is UITextView}) as! UITextView).text
        let result = (text != self.question.description ?? "") ? text : ""
        if answer != nil {
            answer?.content = [result ?? ""]
        } else {
            answer = Answer(question: question, code: code, content: [result ?? ""], optionIds: nil)
        }
        return answer
    }
}

extension TextAreaWebViewItem: UITextViewDelegate {
     
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == question.description ?? "" {
            self.deletePlaceholderAndSetTxtColorToBlack(textView: textView)
        }
    }
    private func deletePlaceholderAndSetTxtColorToBlack(textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
}
