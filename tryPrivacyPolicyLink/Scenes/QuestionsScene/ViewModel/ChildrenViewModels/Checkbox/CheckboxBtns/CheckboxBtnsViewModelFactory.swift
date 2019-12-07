//
//  CheckboxBtnsViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 07/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

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
