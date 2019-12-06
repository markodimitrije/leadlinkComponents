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
        //self.view = LabelAndTextViewDropdownFactory(headlineText: question.title, inputText: inputText, placeholderText: placeholderText, width: 398.0, delegate: self).getView()
        let labelFactory = CodeLabelFactory(text: question.title)
        let textViewFactory = CodeTextViewFactory(inputText: inputText, placeholderText: placeholderText)

//        self.view = LabelAndTextViewDropdownFactory(labelFactory: labelFactory, textViewFactory: textViewFactory).getView()
//        view.backgroundColor = .green
        
        let embededViewFactory = LabelAndTextViewDropdownFactory(labelFactory: labelFactory, textViewFactory: textViewFactory)
        let insets = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        let borderLayout = BorderLayout(cornerRadius: 10.0, borderWidth: 1.0, borderColor: .green)

        self.view = WrapIntoBorderFactory(embededViewFactory: embededViewFactory, insets: insets, borderLayout: borderLayout).getView()
        
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
