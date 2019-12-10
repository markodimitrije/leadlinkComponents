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
        
        let labelFactory = LabelFactory(text: question.title)
        let textViewFactory = TextViewFactory(inputText: inputText,
                                                  placeholderText: placeholderText)
        
        let factory = TextAreaViewFactory(labelFactory: labelFactory, textViewFactory: textViewFactory)
        
        self.viewmodel = TextAreaViewModel(questionInfo: questionInfo, textAreaViewFactory: factory)
    }
}
