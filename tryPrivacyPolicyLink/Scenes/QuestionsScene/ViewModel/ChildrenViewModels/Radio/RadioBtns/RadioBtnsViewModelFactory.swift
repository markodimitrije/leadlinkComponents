//
//  RadioBtnsViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 07/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

protocol RadioBtns_ViewModel_FactoryProtocol: GetViewModelProtocol {}

class RadioBtnsViewModelFactory: RadioBtns_ViewModel_FactoryProtocol {
    
    private let viewmodel: RadioBtnsViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        let answer = questionInfo.getAnswer()
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer)
        
        let viewmodel = RadioBtnsViewModel(questionInfo: questionInfo, radioBtnsFactory: radioBtnsFactory)
        
        self.viewmodel = viewmodel
    }
}
