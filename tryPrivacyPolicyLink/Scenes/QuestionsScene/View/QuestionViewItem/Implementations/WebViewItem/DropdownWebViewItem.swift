//
//  DropdownWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class DropdownWebViewItem: QuestionViewItem {
    private var question: Question
    private var answer: Answer?
    init(question: Question, answer: Answer?) {
        self.question = question
    }
    func getView() -> UIView {
        let inputText = "ddsacz\nddsacz\nddsacz\nddsacz\nddsacz\nddsacz"
        let placeholderText = "ddsacz\nddsacz\nddsacz\nddsacz\nddsacz\nddsacz"
        let view = CodeLabelAndTextViewDropdownFactory(headlineText: question.title, inputText: inputText, placeholderText: placeholderText, width: 414.0, delegate: nil).getView()
        view.backgroundColor = .green
        return view
    }
}
