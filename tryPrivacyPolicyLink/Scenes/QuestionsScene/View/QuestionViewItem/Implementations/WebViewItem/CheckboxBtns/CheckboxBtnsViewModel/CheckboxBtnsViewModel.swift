//
//  CheckboxBtnsWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CheckboxBtnsViewModel: NSObject, QuestionPageViewModelProtocol, BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        singleCheckboxBtnViewModel[sender.tag].isOn = !singleCheckboxBtnViewModel[sender.tag].isOn
    }
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    private var singleCheckboxBtnViewModel = [SingleCheckboxBtnViewModel]()
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
        super.init()
        loadView()
    }
    
    private func loadView() {
        let titles = question.settings.options ?? [ ]
        
        let selected = titles.map {(answer?.content ?? [ ]).contains($0)}
        
        let singleCheckboxBtnViewModel = titles.enumerated().map { (index, title) -> SingleCheckboxBtnViewModel in
            let checkboxBtnFactory = SingleCheckboxBtnViewFactory(tag: index,
                                                               isOn: selected[index],
                                                               titleText: title,
                                                               width: 414.0,
                                                               delegate: self)
            let checkboxBtnViewModel = SingleCheckboxBtnViewModel(viewFactory: checkboxBtnFactory, isOn: selected[index])
            return checkboxBtnViewModel
        }
        self.singleCheckboxBtnViewModel = singleCheckboxBtnViewModel
        let singleViews = singleCheckboxBtnViewModel.map {$0.getView()}
        let verticalStackerFactory = CodeVerticalStacker(views: singleViews)
        self.view = verticalStackerFactory.getView()
    }
    
    func getView() -> UIView {
        return self.view
    }
    
    func getActualAnswer() -> Answer? { // multiple selection
        
        guard let questionOptions = question.settings.options else { // glupo, resi mnogo ranije...
            return nil
        }
        
        let selectedViewModels = singleCheckboxBtnViewModel.filter {$0.isOn}
        let selectedTags = selectedViewModels.map {$0.getView().tag}
        let content = selectedTags.map {questionOptions[$0]}
            
        if answer != nil {
            answer!.content = content
            answer!.optionIds = selectedTags
        } else {
            answer = Answer(question: question, code: code, content: content, optionIds: selectedTags)
        }
        return answer
    }
}
