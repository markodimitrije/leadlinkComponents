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
        
        //init(presentQuestionInfo: PresentQuestionInfoProtocol, viewFactory: DropdownFactoryProtocol
        let radioBtnsWithInputFactory = RadioBtnsWithInputFactory(question: question, answer: answer, delegate: nil, textViewDelegate: nil)
        let viewmodel = RadioBtnsWithInputViewModel(questionInfo: questionInfo,
                                                    radioBtnsWithInputViewFactory: radioBtnsWithInputFactory)
        
//        let labelFactory = CodeLabelFactory(text: question.title)
//        let textViewFactory = CodeTextViewFactory(inputText: questionInfo.getAnswer()?.content.first ?? "", placeholderText: question.description ?? "", delegate: nil)
//
//        let embededViewFactory = RadioBtnsWithInputFactory(question: <#T##Question#>, answer: <#T##Answer?#>, delegate: <#T##BtnTapListening?#>, textViewDelegate: <#T##UITextViewDelegate?#>)
//
//        let dropdownItem = DropdownViewModel(presentQuestionInfo: questionInfo, viewFactory: embededViewFactory)
//
        self.viewmodel = viewmodel
    }
    
}

