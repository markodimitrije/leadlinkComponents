//
//  RadioBtnsWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 01/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsWebViewItem: NSObject, QuestionPageViewModelProtocol, BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        print("RadioBtnsWebViewItem.btnTapped - IMPLEMENT ME, sender.tag = \(sender.tag)")
        singleFactories[sender.tag].isOn = !singleFactories[sender.tag].isOn
    }
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    private var singleFactories = [CodeSingleRadioBtnViewFactory]()
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
        super.init()
        loadView()
    }
    
    private func loadView() {
        let titles = question.settings.options ?? [ ]
        let selected = answer?.content.map {titles.contains($0)} ?? titles.map {_ in return false}
        let singleFactories = titles.enumerated().map { (index, title) -> CodeSingleRadioBtnViewFactory in
            let radioBtnFactory = CodeSingleRadioBtnViewFactory(tag: index,
                                                                isOn: selected[index],
                                                                titleText: title,
                                                                width: 414.0,
                                                                delegate: self)
            return radioBtnFactory
        }
        self.singleFactories = singleFactories
        let singleViews = singleFactories.map {$0.getView()}
        let verticalStackerFactory = CodeVerticalStacker(views: singleViews)
        self.view = verticalStackerFactory.getView()
    }
    
    func getView() -> UIView {
        return self.view
    }
    
    func getActualAnswer() -> Answer? { // hard-coded
        return nil
//        let text = (view.subviews.first(where: {$0 is UITextView}) as! UITextView).text
//        let result = (text != self.question.description ?? "") ? text : ""
//        if answer != nil {
//            answer?.content = [result ?? ""]
//        } else {
//            answer = Answer(question: question, code: code, content: [result ?? ""], optionIds: nil)
//        }
//        return answer
    }
}
