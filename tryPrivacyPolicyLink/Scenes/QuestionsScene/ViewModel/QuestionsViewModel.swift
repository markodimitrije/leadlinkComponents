//
//  QuestionsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol QuestionsViewItemSupplying {
    func getQuestionPageViewItems() -> [QuestionPageGetViewProtocol]
}

protocol BtnTapListening {
    func btnTapped(_ sender: UIButton)
}

protocol QuestionsViewItemManaging: QuestionsViewItemSupplying, BtnTapListening {}

class QuestionsViewModel : QuestionsViewItemManaging {
    
    private var code = ""
    
    init(code: String) {
        self.code = code
    }
    
    var viewItems: [QuestionPageGetViewProtocol] = []
    
    // particular questionViewmodel ima i view (getView) i model (answer)
    func getQuestionPageViewItems() -> [QuestionPageGetViewProtocol] {
        
        //let groupItem = GroupViewItem()
        
        //let dropdownItem = DropdownViewModel(question: dropdownQuestion, answer: dropdownAnswer, code: code)
//        let dropdownItem = DropdownViewModel(question: dropdownQuestion, answer: nil, code: code)
        
        //let textAreaItem = TextAreaViewModel(question: dropdownQuestion, answer: dropdownAnswer, code: code)
        //let textAreaItem = TextAreaViewModel(question: dropdownQuestion, answer: nil, code: code)
        
//        let radioBtnsItem = RadioBtnsViewModel(question: radioQuestion, answer: nil, code: code)
//        let radioBtnsItem = RadioBtnsViewModel(question: radioQuestion, answer: radioAnswer, code: code)
        
//        let checkboxBtnsViewModel = CheckboxBtnsViewModel(question: checkboxQuestion, answer: nil, code: code)
//        let checkboxBtnsViewModel = CheckboxBtnsViewModel(question: checkboxQuestion, answer: checkboxAnswer, code: code)
        
//        let radioBtnsWithInputViewModel = RadioBtnsWithInputViewModel(question: radioWithInputQuestion, answer: nil, code: code)
//        let radioBtnsWithInputItem = RadioBtnsWithInputViewModel(question: radioWithInputQuestion, answer: radioWithInputAnswer, code: code)
        
//        let checkboxBtnsWithInputViewModel = CheckboxBtnsWithInputViewModel(question: checkboxWithInputQuestion, answer: nil, code: code)
        //let checkboxBtnsWithInputViewModel = CheckboxBtnsWithInputViewModel(question: checkboxWithInputQuestion, answer: checkboxWithInputAnswer, code: code)
        
        let optInViewModel = OptInViewModel(optIn: optIn)
        
        let saveButtonItem = SaveBtnViewItem()
        
        //let items: [QuestionPageGetViewProtocol] = [groupItem, dropdownItem, textAreaItem, radioBtnsItem, saveButtonItem]
        //let items: [QuestionPageGetViewProtocol] = [radioBtnsItem, checkboxBtnsViewModel, saveButtonItem]
        //let items: [QuestionPageGetViewProtocol] = [radioBtnsWithInputViewModel, saveButtonItem]
        //let items: [QuestionPageGetViewProtocol] = [checkboxBtnsWithInputViewModel, saveButtonItem]
        let items: [QuestionPageGetViewProtocol] = [optInViewModel, saveButtonItem]
        viewItems.append(contentsOf: items)
        
        hookUpSaveEvent()
        
        return viewItems
    }
    
    private func hookUpSaveEvent() {
        
        let saveBtnViewItem = viewItems.last(where: {$0 is SaveBtnViewItem}) as! SaveBtnViewItem
        let btn = saveBtnViewItem.getView().subviews.first! as! UIButton
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
    }
    
    @objc internal func btnTapped(_ sender: UIButton) { print("saveBtnTapped. save answers")
        
        let itemsWithAnswer: [QuestionPageViewModelProtocol] = viewItems.filter {$0 is QuestionPageViewModelProtocol} as! [QuestionPageViewModelProtocol]
        let answers: [[String]] = itemsWithAnswer.compactMap {$0.getActualAnswer()}.map {$0.content}
        print("save answers:")
        print(answers)
    }
    
}

/*
to do:
    case radioBtn = "radio"//"radioBtn"
    case checkbox = "checkbox"
    case radioBtnWithInput = "radioBtnWithInput"
    case checkboxSingleWithInput = "checkbox_single_with_input"
    case checkboxMultipleWithInput = "checkbox_with_input"
    case switchBtn = "switchBtn"
    case textField = "text"//"textField" OK OK OK OK OK OK OK OK OK OK OK OK
    case textArea = "textarea"           OK OK OK OK OK OK OK OK OK OK OK OK
    case dropdown = "dropdown"// case textWithOptions = "textWithOptions"  OK OK OK OK OK OK OK OK OK OK OK OK
    case termsSwitchBtn = "termsSwitchBtn"
}

*/
