//
//  CheckboxBtnsWithInputFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CheckboxBtnsWithInputFactory: GetViewProtocol {
   
    private var myView: UIView!
    private var singleCheckboxBtnViewModels: [SingleCheckboxBtnViewModel]!

    func getView() -> UIView {
        return myView
    }
    
    func getViewModels() -> [SingleCheckboxBtnViewModel] {
        return self.singleCheckboxBtnViewModels
    }
    
    init(question: Question, answer: Answer?, delegate: BtnTapListening?, textViewDelegate: UITextViewDelegate?) {
        
        let checkboxBtnsFactory = CheckboxBtnsFactory(question: question, answer: answer, delegate: delegate)
        let checkboxBtnsViewModels: [SingleCheckboxBtnViewModel] = checkboxBtnsFactory.getViewModels()
        self.singleCheckboxBtnViewModels = checkboxBtnsViewModels
        
        let checkboxBtnsViewStackView = checkboxBtnsFactory.getView()
        var checkboxBtnsViews: [UIView] = checkboxBtnsViewStackView.subviews
        
        let lastCheckboxBtnView = checkboxBtnsViews.removeLast()
//        let bigBtn = (lastCheckboxBtnView.subviews.filter {$0 is UIButton} as! [UIButton]).last!
//        let bigBtnConstraint = bigBtn.constraints.first(where: {$0.identifier == "width"})!
//        bigBtnConstraint.isActive = false
        
        let singleCheckboxBtnsView = CodeVerticalStacker(views: checkboxBtnsViews).getView()
        
        let inialText = getNonOptionTextAnswer(question: question, answer: answer)
        let isPlaceholderText = inialText == question.description ?? ""
        
        let textView = StackViewContainingTextViewFactory(text: inialText, isPlaceholderText: isPlaceholderText, delegate: textViewDelegate).getView()
        
        let lastCheckboxBtnWithInputView = CodeHorizontalStacker(views: [lastCheckboxBtnView, textView], width: 398.0).getView()
        
//        lastCheckboxBtnWithInputView.widthAnchor.constraint(equalToConstant: 414.0).isActive = true
        
        self.myView = CodeVerticalStacker(views: [singleCheckboxBtnsView, lastCheckboxBtnWithInputView]).getView()
        
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
