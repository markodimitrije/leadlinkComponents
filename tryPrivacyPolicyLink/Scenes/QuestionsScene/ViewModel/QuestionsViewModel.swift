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

protocol SaveBtnListening {
    func saveBtnTapped()
}

protocol QuestionsViewItemManaging: QuestionsViewItemSupplying, SaveBtnListening {}

class QuestionsViewModel : QuestionsViewItemManaging {
    
    private var code = ""
    
    init(code: String) {
        self.code = code
    }
    
    var viewItems: [QuestionPageViewProtocol] = []
    
    func getQuestionViewItems() -> [QuestionPageViewProtocol] {
        
        let groupItem = GroupViewItem()
        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: dropdownAnswer, code: code)
//        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: nil, code: code)
        //let textAreaItem = TextAreaWebViewItem(question: dropdownQuestion, answer: dropdownAnswer, code: code)
        let textAreaItem = TextAreaWebViewItem(question: dropdownQuestion, answer: nil, code: code)
        let saveButtonItem = SaveBtnViewItem()
        
        let items: [QuestionPageViewProtocol] = [groupItem, dropdownItem, textAreaItem, saveButtonItem]
        viewItems.append(contentsOf: items)
        
        hookUpSaveEvent()
        
        return viewItems
    }
    
    private func hookUpSaveEvent() {
        
        let saveBtnViewItem = viewItems.last(where: {$0 is SaveBtnViewItem}) as! SaveBtnViewItem
        let btn = saveBtnViewItem.getView().subviews.first! as! UIButton
        btn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        
    }
    
    @objc internal func saveBtnTapped() { print("saveBtnTapped. save answers")
        
        let itemsWithAnswer: [QuestionPageViewModelProtocol] = viewItems.filter {$0 is QuestionPageViewModelProtocol} as! [QuestionPageViewModelProtocol]
        let answers: [[String]] = itemsWithAnswer.compactMap {$0.getActualAnswer()}.map {$0.content}
        print("save answers:")
        print(answers)
    }
    
}
