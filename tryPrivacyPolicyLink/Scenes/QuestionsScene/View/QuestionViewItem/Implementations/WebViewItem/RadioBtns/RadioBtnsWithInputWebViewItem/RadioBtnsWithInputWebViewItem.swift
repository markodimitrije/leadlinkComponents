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
    
    private var radioBtnViewModelAttachedToText: SingleRadioBtnViewModel {
        return singleRadioBtnViewModels.last!
    }
    private var nonTextRadioBtnViewModels: [SingleRadioBtnViewModel] {
        return singleRadioBtnViewModels.dropLast()
    }
    private var textView: UITextView {
        return view.locateClosestChild(ofType: UITextView.self)!
    }
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
        super.init()
        loadView()
    }
    
    private func loadView() {
        
        let radioBtnsFactory = RadioBtnsWithInputFactory(question: question, answer: answer, delegate: self, textViewDelegate: self)
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
    
    
}

extension RadioBtnsWithInputWebViewItem: BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        setSelectedRadioBtnAndClearOthers(sender: sender)
        setTextViewTextToPlaceholderText()
        setTextViewUnfocused()
    }
    
    private func setSelectedRadioBtnAndClearOthers(sender: UIButton) {
        singleRadioBtnViewModels[sender.tag].isOn = !singleRadioBtnViewModels[sender.tag].isOn
        print("sve ostale setuj na false")
        let toDisable = singleRadioBtnViewModels.filter {$0.getView().tag != sender.tag}
        _ = toDisable.map {$0.isOn = false}
    }
    
    private func setTextViewTextToPlaceholderText() {
        textView.text = question.description ?? ""
        textView.textColor = .lightGray
    }
    
    private func setTextViewUnfocused() {
        textView.resignFirstResponder()
    }
    
}

extension RadioBtnsWithInputWebViewItem: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != question.description ?? "" { print("setuj odg. btn, sve ostale reset")
            textView.textColor = .black
            radioBtnViewModelAttachedToText.isOn = true
            _ = nonTextRadioBtnViewModels.map {$0.isOn = false}
        } else if textView.text == "" {
            _ = singleRadioBtnViewModels.map {$0.isOn = false}
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == question.description ?? "" {
            textView.text = ""
        }
    }
}
