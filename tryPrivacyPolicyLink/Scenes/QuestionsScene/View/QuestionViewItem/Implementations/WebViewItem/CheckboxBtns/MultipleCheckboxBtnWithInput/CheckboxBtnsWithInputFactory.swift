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
    
    init(questionInfo: PresentQuestionInfoProtocol, checkboxBtnsFactory: CheckboxBtnsFactory, textViewFactory: CodeTextViewFactory) {
        
//        let question: Question = questionInfo.getQuestion()
//        let answer: Answer? = questionInfo.getAnswer()
        
        let checkboxBtnsViewModels: [SingleCheckboxBtnViewModel] = checkboxBtnsFactory.getViewModels()
        self.singleCheckboxBtnViewModels = checkboxBtnsViewModels
        
        let checkboxBtnsViewStackView = checkboxBtnsFactory.getView()
        var checkboxBtnsViews: [UIView] = checkboxBtnsViewStackView.subviews
        
        let lastCheckboxBtnView = checkboxBtnsViews.removeLast()

        let singleCheckboxBtnsView = CodeVerticalStacker(views: checkboxBtnsViews).getView()
        
//        let inialText = getNonOptionTextAnswer(question: question, answer: answer)
//        let isPlaceholderText = inialText == question.description ?? ""
//
//        let textView = StackViewContainingTextViewFactory(text: inialText,
//                                                          isPlaceholderText: isPlaceholderText).getView()
        let textView = textViewFactory.getView()
        
        let lastCheckboxBtnWithInputView = CodeHorizontalStacker(views: [lastCheckboxBtnView, textView],
                                                                 width: 398.0).getView()
        
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
