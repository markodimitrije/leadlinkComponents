//
//  DropdownViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class DropdownViewModel: NSObject, QuestionPageViewModelProtocol {
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    
    init(presentQuestionInfo: PresentQuestionInfoProtocol, viewFactory: DropdownFactoryProtocol) {
        self.question = presentQuestionInfo.getQuestion()
        self.answer = presentQuestionInfo.getAnswer()
        self.code = presentQuestionInfo.getCode()
        self.view = viewFactory.getView()
        super.init()
        self.view.findViews(subclassOf: UITextView.self).first!.delegate = self
    }
    
    func getView() -> UIView {
        return self.view
    }
    
    func getActualAnswer() -> Answer? {
        let text = view.findViews(subclassOf: UITextView.self).first!.text
        let result = (text != self.question.description ?? "") ? text : ""
        if answer != nil {
            answer?.content = [result ?? ""]
        } else {
            answer = Answer(question: question, code: code, content: [result ?? ""], optionIds: nil)
        }
        return answer
    }
}

extension DropdownViewModel: UITextViewDelegate {
     
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
