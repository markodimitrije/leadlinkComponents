//
//  CheckboxBtnsWithInputViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol CheckboxBtnsWithInput_ViewModel_FactoryProtocol: GetViewModelProtocol {}

class CheckboxBtnsWithInputViewModelFactory: CheckboxBtnsWithInput_ViewModel_FactoryProtocol {
    
    private let viewmodel: CheckboxBtnsWithInputViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let radioBtnsFactory = CheckboxBtnsFactory(question: question, answer: answer)
        let textViewFactory = CodeTextViewFactory(inputText: answer?.content.first ?? "", placeholderText: question.description ?? "", delegate: nil)
        
//        let radioBtnsWithInputFactory =
            //= CheckboxBtnsWithInputFactory(delegate: nil,
              //                          textViewDelegate: nil,
//        CheckboxBtnsWithInputFactory(radioBtnsFactory: radioBtnsFactory,
//                                     textViewFactory: textViewFactory)
        let radioBtnsWithInputFactory = CheckboxBtnsWithInputFactory(question: question, answer: answer)
        
//        let viewmodel = CheckboxBtnsWithInputViewModel(questionInfo: questionInfo,
//                                                       radioBtnsWithInputViewFactory: radioBtnsWithInputFactory)
        let viewmodel = CheckboxBtnsWithInputViewModel(question: question, answer: answer, code: "12")
        
        self.viewmodel = viewmodel
    }
    
}


