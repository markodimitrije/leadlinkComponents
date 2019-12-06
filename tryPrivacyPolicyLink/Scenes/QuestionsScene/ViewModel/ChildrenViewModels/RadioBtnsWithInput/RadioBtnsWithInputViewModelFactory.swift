//
//  RadioBtnsWithInputViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol RadioBtnsWithInput_ViewModel_FactoryProtocol: GetViewModelProtocol {}

class RadioBtnsWithInputViewModelFactory: RadioBtnsWithInput_ViewModel_FactoryProtocol {
    
    private let viewmodel: RadioBtnsWithInputViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer, delegate: nil)
        let textViewFactory = CodeTextViewFactory(inputText: answer?.content.first ?? "", placeholderText: question.description ?? "")
        
        let radioBtnsWithInputFactory
            = RadioBtnsWithInputFactory(radioBtnsFactory: radioBtnsFactory,
                                        textViewFactory: textViewFactory)
        
        let viewmodel = RadioBtnsWithInputViewModel(questionInfo: questionInfo,
                                                    radioBtnsWithInputViewFactory: radioBtnsWithInputFactory)
        
        self.viewmodel = viewmodel
    }
    
}

protocol RadioBtns_ViewModel_FactoryProtocol: GetViewModelProtocol {}

class RadioBtnsViewModelFactory: RadioBtns_ViewModel_FactoryProtocol {
    
    private let viewmodel: RadioBtnsViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let radioBtnsFactory
            = RadioBtnsFactory(question: question, answer: answer, delegate: nil)
        
        let viewmodel = RadioBtnsViewModel(questionInfo: questionInfo, radioBtnsFactory: radioBtnsFactory)
        
        self.viewmodel = viewmodel
    }
}

protocol CheckboxBtns_ViewModel_FactoryProtocol: GetViewModelProtocol {}

class CheckboxBtnsViewModelFactory: CheckboxBtns_ViewModel_FactoryProtocol {
    
    private let viewmodel: CheckboxBtnsViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let checkboxBtnsFactory = CheckboxBtnsFactory(question: question, answer: answer)
        
        let viewmodel = CheckboxBtnsViewModel(questionInfo: questionInfo, checkboxBtnsFactory: checkboxBtnsFactory)
        
        self.viewmodel = viewmodel
    }
}
