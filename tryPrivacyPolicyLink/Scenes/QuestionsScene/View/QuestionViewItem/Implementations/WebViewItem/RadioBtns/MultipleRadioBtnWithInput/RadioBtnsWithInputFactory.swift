//
//  RadioBtnsWithInputFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsWithInputFactory: GetViewProtocol {
   
    private var myView: UIView!
    private var singleRadioBtnViewModels: [SingleRadioBtnViewModel]!

    private var radioBtnOnImg = RadioBtnImage.init().onImage
    private var radioBtnOffImg = RadioBtnImage.init().offImage
    
    func getView() -> UIView {
        return myView
    }
    
    func getViewModels() -> [SingleRadioBtnViewModel] {
        return self.singleRadioBtnViewModels
    }
    
    init(question: Question, answer: Answer?, delegate: BtnTapListening?, textViewDelegate: UITextViewDelegate?) {
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer, delegate: delegate)
        let radioBtnsViewModels: [SingleRadioBtnViewModel] = radioBtnsFactory.getViewModels()
        let radioBtnsViewStackView = radioBtnsFactory.getView()
        var radioBtnsViews: [UIView] = radioBtnsViewStackView.subviews
        
        let lastRadioBtnView = radioBtnsViews.removeLast()
        let bigBtn = (lastRadioBtnView.subviews.filter {$0 is UIButton} as! [UIButton]).last!
        let bigBtnConstraint = bigBtn.constraints.first(where: {$0.identifier == "width"})!
        bigBtnConstraint.isActive = false
        let singleRadioBtnsView = CodeVerticalStacker(views: radioBtnsViews).getView()
        
        let inialText = getNonOptionTextAnswer(question: question, answer: answer)
        let isPlaceholderText = inialText == question.description ?? ""
        
        let textView = StackViewContainingTextViewFactory(text: inialText, isPlaceholderText: isPlaceholderText, delegate: textViewDelegate).getView()
        
        let lastRadioBtnWithInputView = CodeHorizontalStacker(views: [lastRadioBtnView, textView], width: 414.0).getView()
        
        self.singleRadioBtnViewModels = radioBtnsViewModels
        self.myView = CodeVerticalStacker(views: [singleRadioBtnsView, lastRadioBtnWithInputView]).getView()
        
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
