//
//  CheckboxBtnsWithInputFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CheckboxBtnsWithInputViewFactory: GetViewProtocol {
   
    private var myView: UIView!
    private var singleCheckboxBtnViewModels: [SingleCheckboxBtnViewModel]!

    func getView() -> UIView {
        return myView
    }
    
    func getViewModels() -> [SingleCheckboxBtnViewModel] {
        return self.singleCheckboxBtnViewModels
    }
    
    init(questionInfo: PresentQuestionInfoProtocol, checkboxBtnsFactory: CheckboxBtnsFactory, textViewFactory: CodeTextViewFactory) {
        
        let checkboxBtnsViewModels: [SingleCheckboxBtnViewModel] = checkboxBtnsFactory.getViewModels()
        self.singleCheckboxBtnViewModels = checkboxBtnsViewModels
        
        let checkboxBtnsViewStackView = checkboxBtnsFactory.getView()
        var checkboxBtnsViews: [UIView] = checkboxBtnsViewStackView.subviews
        
        let lastCheckboxBtnView = checkboxBtnsViews.removeLast()

        let singleCheckboxBtnsView = CodeVerticalStacker(views: checkboxBtnsViews).getView()
        
        let textView = textViewFactory.getView()
        
        let lastCheckboxBtnWithInputView = CodeHorizontalStacker(views: [lastCheckboxBtnView, textView], distribution: .fillEqually).getView()
        
        self.myView = CodeVerticalStacker(views: [singleCheckboxBtnsView, lastCheckboxBtnWithInputView]).getView()
        
        lastCheckboxBtnWithInputView.leadingAnchor.constraint(equalTo: lastCheckboxBtnWithInputView.superview!.leadingAnchor).isActive = true
        lastCheckboxBtnWithInputView.superview!.trailingAnchor.constraint(equalTo: lastCheckboxBtnWithInputView.trailingAnchor).isActive = true
        
    }
    
    private func getNonOptionTextAnswer(question: Question, answer: Answer?) -> String {
        
        guard let options = question.settings.options else {
            return "" // fatal...
        }
        
        guard let answer = answer else {
            return question.description ?? ""
        }
        let contentNotContainedInOptions = answer.content.first(where: {!options.contains($0)})
        return contentNotContainedInOptions ?? ""
    }
    
}
