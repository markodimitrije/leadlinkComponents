//
//  TextAreaViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 01/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

// textView cija je sirina od width/2 - koliko mu je dozvolio 2.element
// textView cija je sirina: width (kao superview)

import UIKit

class TextAreaViewModel: NSObject, QuestionPageViewModelProtocol {
    
    private var question: Question
    private var answer: Answer?
    private var code: String
    
    private var view: UIView!
    
    init(questionInfo: PresentQuestionInfoProtocol, labelAndTextViewFactory: GetViewProtocol) {
        self.question = questionInfo.getQuestion()
        self.answer = questionInfo.getAnswer()
        self.code = questionInfo.getCode()
        super.init()
        self.view = labelAndTextViewFactory.getView()
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

extension TextAreaViewModel: UITextViewDelegate {
     
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
