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
        
//        let labelFactory = LabelFactory(text: question.title)
//        let textViewFactory = TextViewFactory(inputText: questionInfo.getAnswer()?.content.first ?? "", placeholderText: question.description ?? "")
        
        let labelFactory = LabelFactory(text: question.title, width: allowedWidth - 8.0)
        let textViewFactory = TextViewFactory(inputText: questionInfo.getAnswer()?.content.first ?? "", placeholderText: question.description ?? "", width: allowedWidth - 8.0)

//        let viewFactory = LabelAndTextViewDropdownFactory(labelFactory: labelFactory,
//                                                          textViewFactory: textViewFactory)
        
        let viewFactory = LabelAndTextViewDropdownFactory(labelFactory: labelFactory,
        textViewFactory: textViewFactory)
        
        let borderLayout = BorderLayout(cornerRadius: 5.0, borderWidth: 1.0, borderColor: .orange)
        let embededFactory = WrapIntoBorderFactory(embededViewFactory: viewFactory, insets: UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0), borderLayout: borderLayout)
        
        //let dropdownItem = DropdownViewModel(presentQuestionInfo: questionInfo, viewFactory: viewFactory)
        let dropdownItem = DropdownViewModel(presentQuestionInfo: questionInfo, viewFactory: embededFactory)
        
        self.viewmodel = dropdownItem
    }
    
}
