//
//  TextAreaViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 07/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class TextAreaViewModelFactory: NSObject, GetViewModelProtocol {
    
    private let viewmodel: TextAreaViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let inputText = answer?.content.first ?? ""
        let placeholderText = question.description ?? ""
        
        let labelFactory = CodeLabelFactory(text: question.title)
        let textViewFactory = CodeTextViewFactory(inputText: inputText,
                                                  placeholderText: placeholderText)
        
        let factory = LabelAndTextViewFactory(labelFactory: labelFactory, textViewFactory: textViewFactory, heightGreaterOrEqual: 200.0)
        
        self.viewmodel = TextAreaViewModel(questionInfo: questionInfo, labelAndTextViewFactory: factory)
    }
}
