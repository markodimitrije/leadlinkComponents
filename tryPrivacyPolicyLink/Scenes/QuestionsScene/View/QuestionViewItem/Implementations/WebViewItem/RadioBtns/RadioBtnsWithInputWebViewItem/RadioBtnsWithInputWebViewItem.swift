//
//  RadioBtnsWithInputWebViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsWithInputWebViewItem: NSObject, QuestionPageViewModelProtocol {
    
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
    
//    private func loadView() {
//
//        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer, delegate: self)
//
//        self.singleRadioBtnViewModels = radioBtnsFactory.getViewModels()
//        self.view = radioBtnsFactory.getView()
//    }
    
    private func loadView() {
        
        let radioBtnsFactory = RadioBtnsWithInputFactory(question: question, answer: answer, delegate: self)
        self.singleRadioBtnViewModels = radioBtnsFactory.getViewModels()
        self.view = radioBtnsFactory.getView()

        
        
        
//        let titles = question.settings.options ?? [ ]
//
//        let selected = titles.map {(answer?.content ?? [ ]).contains($0)}
//
//        var singleRadioBtnViewModels = titles.enumerated().map { (index, title) -> SingleRadioBtnViewModel in
//            let radioBtnFactory = SingleRadioBtnViewFactory(tag: index,
//                                                            isOn: selected[index],
//                                                            titleText: title,
//                                                            width: 414.0,
//                                                            delegate: self)
//            let radioBtnViewModel = SingleRadioBtnViewModel(viewFactory: radioBtnFactory, isOn: selected[index])
//            return radioBtnViewModel
//        }
//
//        let lastRadioBtnViewModel = singleRadioBtnViewModels.removeLast()
//        let singleTextView = UITextView()//SingleTextViewFactory().getView
//
//        let radioBtnWithTextView = CodeHorizontalStacker(views: [lastRadioBtnViewModel.getView(), singleTextView], width: 414.0)
//
//        let allRadioBtnViewModels = singleRadioBtnViewModels + [lastRadioBtnViewModel]
//
//        let singleRadioBtnViews = singleRadioBtnViewModels.map {$0.getView()}
//        let verticalStackerFactory = CodeVerticalStacker(views: singleRadioBtnViews)
//
//
//        self.view = verticalStackerFactory.getView()
//
//        self.singleRadioBtnViewModels = allRadioBtnViewModels
        
        
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
    
    
}

extension RadioBtnsWithInputWebViewItem: BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        setSelectedRadioBtnAndClearOthers(sender: sender)
    }
    
    private func setSelectedRadioBtnAndClearOthers(sender: UIButton) {
        singleRadioBtnViewModels[sender.tag].isOn = !singleRadioBtnViewModels[sender.tag].isOn
        print("sve ostale setuj na false")
        let toDisable = singleRadioBtnViewModels.filter {$0.getView().tag != sender.tag}
        _ = toDisable.map {$0.isOn = false}
    }
    
}

extension RadioBtnsWithInputWebViewItem: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != question.description ?? "" {
            print("setuj odg. btn")
        } else {
            print("reset odg. btn")
        }
    }
}
