//
//  RadioBtnsWithInputFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsWithInputViewFactory: GetViewProtocol {
   
    private var myView: UIView!
    private var singleRadioBtnViewModels: [SingleRadioBtnViewModel]!
    
    func getView() -> UIView {
        return myView
    }
    
    func getViewModels() -> [SingleRadioBtnViewModel] {
        return self.singleRadioBtnViewModels
    }
    
    init(radioBtnsFactory: RadioBtnsFactory, textViewFactory: CodeTextViewFactory) {
        
        let radioBtnsViewModels: [SingleRadioBtnViewModel] = radioBtnsFactory.getViewModels()
        let radioBtnsViewStackView = radioBtnsFactory.getView()
        var radioBtnsViews: [UIView] = radioBtnsViewStackView.subviews
        
        let lastRadioBtnView = radioBtnsViews.removeLast()
        let singleRadioBtnsView = CodeVerticalStacker(views: radioBtnsViews).getView()
        
        let textView = textViewFactory.getView()
        
        let lastRadioBtnWithInputView = CodeHorizontalStacker(views: [lastRadioBtnView, textView], distribution: .fillEqually).getView()
        
        self.singleRadioBtnViewModels = radioBtnsViewModels
        self.myView = CodeVerticalStacker(views: [singleRadioBtnsView, lastRadioBtnWithInputView]).getView()
        
        lastRadioBtnWithInputView.leadingAnchor.constraint(equalTo: lastRadioBtnWithInputView.superview!.leadingAnchor).isActive = true
        lastRadioBtnWithInputView.superview!.trailingAnchor.constraint(equalTo: lastRadioBtnWithInputView.trailingAnchor).isActive = true
        
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
