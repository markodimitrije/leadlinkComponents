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
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer)
        let textViewFactory = CodeTextViewFactory(inputText: answer?.content.first ?? "", placeholderText: question.description ?? "")
        
        let mainFactory = RadioBtnsWithInputViewFactory(radioBtnsFactory: radioBtnsFactory,
                                                        textViewFactory: textViewFactory)
        
        let viewmodel = RadioBtnsWithInputViewModel(questionInfo: questionInfo,
                                                    radioBtnsWithInputViewFactory: mainFactory)
        
        self.viewmodel = viewmodel
    }
    
}
