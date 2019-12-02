//
//  QuestionsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionPageViewProtocol]
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
    
    var viewItems: [QuestionPageViewProtocol] = []
    
    // particular questionViewmodel ima i view (getView) i model (answer)
    func getQuestionViewItems() -> [QuestionPageViewProtocol] {
        
        //let groupItem = GroupViewItem()
        //let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: dropdownAnswer, code: code)
//        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: nil, code: code)
        //let textAreaItem = TextAreaWebViewItem(question: dropdownQuestion, answer: dropdownAnswer, code: code)
        //let textAreaItem = TextAreaWebViewItem(question: dropdownQuestion, answer: nil, code: code)
//        let radioBtnsItem = RadioBtnsWebViewItem(question: radioQuestion, answer: nil, code: code)
//        let radioBtnsItem = RadioBtnsWebViewItem(question: radioQuestion, answer: radioAnswer, code: code)
//        let checkboxBtnsItem = CheckboxBtnsWebViewItem(question: checkboxQuestion, answer: nil, code: code)
//        let checkboxBtnsItem = CheckboxBtnsWebViewItem(question: checkboxQuestion, answer: checkboxAnswer, code: code)
        let radioBtnsWithInputItem = RadioBtnsWithInputWebViewItem(question: radioWithInputQuestion, answer: nil, code: code)
//        let radioBtnsWithInputItem = RadioBtnsWithInputWebViewItem(question: radioWithInputQuestion, answer: radioWithInputAnswer, code: code)
        
        let saveButtonItem = SaveBtnViewItem()
        
        //let items: [QuestionPageViewProtocol] = [groupItem, dropdownItem, textAreaItem, radioBtnsItem, saveButtonItem]
        //let items: [QuestionPageViewProtocol] = [radioBtnsItem, checkboxBtnsItem, saveButtonItem]
        let items: [QuestionPageViewProtocol] = [radioBtnsWithInputItem, saveButtonItem]
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
