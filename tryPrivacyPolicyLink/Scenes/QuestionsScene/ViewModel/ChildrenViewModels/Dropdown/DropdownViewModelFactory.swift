//
//  DropdownViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol DropdownViewModelFactoryProtocol: GetViewModelProtocol {}

class DropdownViewModelFactory: DropdownViewModelFactoryProtocol {
    
    private let viewmodel: DropdownViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return viewmodel
    }
    
    init(questionInfo: PresentQuestionInfoProtocol) {
        let question = questionInfo.getQuestion()
        
        let labelFactory = CodeLabelFactory(text: question.title)
        let textViewFactory = CodeTextViewFactory(inputText: questionInfo.getAnswer()?.content.first ?? "", placeholderText: question.description ?? "")

        let viewFactory = LabelAndTextViewDropdownFactory(labelFactory: labelFactory,
                                                          textViewFactory: textViewFactory)
        
        let dropdownItem = DropdownViewModel(presentQuestionInfo: questionInfo, viewFactory: viewFactory)
        
        self.viewmodel = dropdownItem
    }
    
}
