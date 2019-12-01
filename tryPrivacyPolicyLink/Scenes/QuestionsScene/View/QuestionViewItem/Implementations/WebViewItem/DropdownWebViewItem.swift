//
//  DropdownWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

//class DropdownWebViewItem: QuestionViewItemProtocol {
//
//    private var question: Question
//    private var answer: Answer?
//
//    init(question: Question, answer: Answer?) {
//        self.question = question
//        self.answer = answer
//    }
//
//    func getView() -> UIView {
//        let inputText = answer?.content.first ?? ""
//        let placeholderText = self.question.description ?? ""
//        let view = CodeLabelAndTextViewDropdownFactory(headlineText: question.title, inputText: inputText, placeholderText: placeholderText, width: 414.0, delegate: nil).getView()
//        view.backgroundColor = .green
//        return view
//    }
//}

class DropdownWebViewItem: QuestionItemProtocol {
    
    private var question: Question
    private var answer: Answer?
    
    private var view: UIView!
    
    init(question: Question, answer: Answer?) {
        self.question = question
        self.answer = answer
        loadView()
    }
    
    private func loadView() {
        let inputText = answer?.content.first ?? ""
        let placeholderText = self.question.description ?? ""
        self.view = CodeLabelAndTextViewDropdownFactory(headlineText: question.title, inputText: inputText, placeholderText: placeholderText, width: 414.0, delegate: nil).getView()
        view.backgroundColor = .green
    }
    
    func getView() -> UIView {
        return self.view
    }
    
//    func getActualAnswer() -> [String] {
//        let text = (view.subviews.first(where: {$0 is UITextView}) as! UITextView).text
//        let result = (text != self.question.description ?? "") ? text : ""
//        return [result ?? ""]
//    }
    func getActualAnswer() -> Answer? {
        let text = (view.subviews.first(where: {$0 is UITextView}) as! UITextView).text
        let result = (text != self.question.description ?? "") ? text : ""
        answer?.content = [result ?? ""]
        return answer
    }
}
