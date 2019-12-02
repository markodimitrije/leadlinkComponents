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
    
    init(question: Question, answer: Answer?, delegate: BtnTapListening?) {
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer, delegate: delegate)
        let radioBtnsViewModels: [SingleRadioBtnViewModel] = radioBtnsFactory.getViewModels()
        let radioBtnsViewStackView = radioBtnsFactory.getView()
        var radioBtnsViews: [UIView] = radioBtnsViewStackView.subviews
        
        let lastRadioBtnView = radioBtnsViews.removeLast()
        let bigBtn = (lastRadioBtnView.subviews.filter {$0 is UIButton} as! [UIButton]).last!
        let bigBtnConstraint = bigBtn.constraints.first(where: {$0.identifier == "width"})!
        bigBtnConstraint.isActive = false
        
        let singleRadioBtnsView = CodeVerticalStacker(views: radioBtnsViews).getView()
        let lastRadioBtnWithInputView = CodeHorizontalStacker(views: [lastRadioBtnView, getTemporaryTextView(width: 50)], width: 414.0).getView()
        //let lastRadioBtnWithInputView = CodeHorizontalStacker(views: [lastRadioBtnView], width: 414.0).getView()
//        let lastRadioBtnWithInputView = lastRadioBtnView
        
        self.singleRadioBtnViewModels = radioBtnsViewModels
        self.myView = CodeVerticalStacker(views: [singleRadioBtnsView, lastRadioBtnWithInputView]).getView()
        
    }
    
    private func getTemporaryTextView(width: CGFloat) -> UITextView {
        let textView             = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Helvetica", size: CGFloat.init(24))
        //textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        
        textView.text = "dfjkbadf"
        textView.textColor = .red
        return textView
    }
    
}
