//
//  RadioBtnsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 01/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsViewModel: NSObject, QuestionPageViewModelProtocol, BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        setSelectedRadioBtnAndClearOthers(sender: sender)
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
        
        let radioBtnsFactory = RadioBtnsFactory(question: question, answer: answer, delegate: self)
        
        self.singleRadioBtnViewModels = radioBtnsFactory.getViewModels()
        self.view = radioBtnsFactory.getView()
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
    
    private func setSelectedRadioBtnAndClearOthers(sender: UIButton) {
        //        print("RadioBtnsViewModel.btnTapped - IMPLEMENT ME, sender.tag = \(sender.tag)")
        singleRadioBtnViewModels[sender.tag].isOn = !singleRadioBtnViewModels[sender.tag].isOn
        print("sve ostale setuj na false")
        let toDisable = singleRadioBtnViewModels.filter {$0.getView().tag != sender.tag}
        _ = toDisable.map {$0.isOn = false}
    }
}
