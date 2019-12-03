//
//  CheckboxBtnsWithInputViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CheckboxBtnsWithInputViewModel: NSObject, QuestionPageViewModelProtocol {
    
    private var question: Question
    private var answer: Answer?
    private var code: String = ""
    
    private var view: UIView!
    private var singleCheckboxBtnViewModels = [SingleCheckboxBtnViewModel]()
    
    private var checkboxBtnViewModelAttachedToText: SingleCheckboxBtnViewModel {
        return singleCheckboxBtnViewModels.last!
    }
    
    private var textView: UITextView {
        return view.locateClosestChild(ofType: UITextView.self)!
    }
    
    func getView() -> UIView {
        return self.view
    }
    func getActualAnswer() -> Answer? { // single selection - not tested !!

        guard let questionOptions = question.settings.options else { // glupo, resi mnogo ranije...
            return nil
        }

        let selectedViewModels = singleCheckboxBtnViewModels.filter {$0.isOn}
        let selectedTags = selectedViewModels.map {$0.getView().tag}
        var content = selectedTags.map {questionOptions[$0]}
        
        if checkboxBtnViewModelAttachedToText.isOn && textView.text != question.description {
            content.append(textView.text)
        } else {
            let questionOptions = question.settings.options!
            content.removeAll(where: {!questionOptions.contains($0)})
        }

        if answer != nil {
            answer!.content = content
            answer!.optionIds = selectedTags
        } else {
            answer = Answer(question: question, code: code, content: content, optionIds: selectedTags)
        }
        return answer
    }
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
        super.init()
        loadView()
    }
    
    private func loadView() {
        
        let checkboxBtnsFactory = CheckboxBtnsWithInputFactory(question: question, answer: answer, delegate: self, textViewDelegate: self)
        self.singleCheckboxBtnViewModels = checkboxBtnsFactory.getViewModels()
        self.view = checkboxBtnsFactory.getView()
    }

}

extension CheckboxBtnsWithInputViewModel: BtnTapListening {
    
    @objc func btnTapped(_ sender: UIButton) {
        
        toggleSelectedCheckboxBtn(sender: sender)
        
        if isSelectedCheckboxBtnAttachedToTextView(sender: sender) {
            manageTextViewIfAttachedCheckmarkIsTapped(sender: sender)
        } else {
            setTextViewUnfocused()
        }
    }
    
    private func toggleSelectedCheckboxBtn(sender: UIButton) {
        singleCheckboxBtnViewModels[sender.tag].isOn = !singleCheckboxBtnViewModels[sender.tag].isOn
    }
    
    private func isSelectedCheckboxBtnAttachedToTextView(sender: UIButton) -> Bool {
        return sender.tag == checkboxBtnViewModelAttachedToText.getView().tag
    }
    
    private func manageTextViewIfAttachedCheckmarkIsTapped(sender: UIButton) {
        if !checkboxBtnViewModelAttachedToText.isOn {
            textView.text = ""
            self.textView.resignFirstResponder()
        } else if !textView.isFirstResponder {
            delay(0.01) {
                self.textView.becomeFirstResponder()
            }
        }
    }
    
    private func setTextViewUnfocused() {
        textView.resignFirstResponder()
    }
    
}

extension CheckboxBtnsWithInputViewModel: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != question.description ?? "" { //print("setuj odg. btn, sve ostale reset")
            textView.textColor = .black
            checkboxBtnViewModelAttachedToText.isOn = true
        } else if textView.text == "" {
            _ = singleCheckboxBtnViewModels.map {$0.isOn = false}
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == question.description ?? "" {
            textView.text = ""
        }
    }
}
