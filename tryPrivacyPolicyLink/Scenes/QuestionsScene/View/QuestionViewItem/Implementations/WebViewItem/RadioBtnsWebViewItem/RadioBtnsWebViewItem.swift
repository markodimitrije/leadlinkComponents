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
//        print("RadioBtnsWebViewItem.btnTapped - IMPLEMENT ME, sender.tag = \(sender.tag)")
        singleRadioBtnViewModels[sender.tag].isOn = !singleRadioBtnViewModels[sender.tag].isOn
        print("sve ostale setuj na false")
        let toDisable = singleRadioBtnViewModels.filter {$0.getView().tag != sender.tag}
        _ = toDisable.map {$0.isOn = false}
    }
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    private var singleRadioBtnViewModels = [SingleRadioBtnViewModel]()
    
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
        
        let singleRadioBtnViewModels = titles.enumerated().map { (index, title) -> SingleRadioBtnViewModel in
            let radioBtnFactory = SingleRadioBtnViewFactory(tag: index,
                                                                isOn: selected[index],
                                                                titleText: title,
                                                                width: 414.0,
                                                                delegate: self)
            let radioBtnViewModel = SingleRadioBtnViewModel(viewFactory: radioBtnFactory, isOn: selected[index])
            return radioBtnViewModel
        }
        self.singleRadioBtnViewModels = singleRadioBtnViewModels
        let singleViews = singleRadioBtnViewModels.map {$0.getView()}
        let verticalStackerFactory = CodeVerticalStacker(views: singleViews)
        self.view = verticalStackerFactory.getView()
    }
    
    func getView() -> UIView {
        return self.view
    }
    
    func getActualAnswer() -> Answer? { // single selection - not tested !!

        guard let questionOptions = question.settings.options else { // glupo, resi mnogo ranije...
            return nil
        }

        let selectedViewModels = singleRadioBtnViewModels.filter {$0.isOn}
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
    
//    func getActualAnswer() -> Answer? { // multiple selection
//
//        guard let questionOptions = question.settings.options else { // glupo, resi mnogo ranije...
//            return nil
//        }
//
//        let selectedViewModels = singleRadioBtnViewModel.filter {$0.isOn}
//        let selectedTags = selectedViewModels.map {$0.getView().tag}
//        let content = selectedTags.map {questionOptions[$0]}
//
//        if answer != nil {
//            answer!.content = content
//            answer!.optionIds = selectedTags
//        } else {
//            answer = Answer(question: question, code: code, content: content, optionIds: selectedTags)
//        }
//        return answer
//    }
}
