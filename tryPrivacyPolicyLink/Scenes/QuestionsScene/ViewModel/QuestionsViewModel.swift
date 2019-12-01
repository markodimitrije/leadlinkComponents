//
//  QuestionsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionViewItemProtocol]
}

protocol SaveBtnListening {
    func saveBtnTapped()
}

protocol QuestionsViewItemManaging: QuestionsViewItemSupplying, SaveBtnListening {}

class QuestionsViewModel : QuestionsViewItemManaging {
    
    var viewItems: [QuestionViewItemProtocol] = []
    
    func getQuestionViewItems() -> [QuestionViewItemProtocol] {
        
        let groupItem = GroupViewItem()
        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: dropdownAnswer)
//        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: nil)
        let saveButtonItem = SaveBtnViewItem()
        
        let items: [QuestionViewItemProtocol] = [groupItem, dropdownItem, saveButtonItem]
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
        
        let itemsWithAnswer: [QuestionItemProtocol] = viewItems.filter {$0 is QuestionItemProtocol} as! [QuestionItemProtocol]
        //let answers: [[String]] = itemsWithAnswer.map {$0.getActualAnswer()}
        let answers: [[String]] = itemsWithAnswer.compactMap {$0.getActualAnswer()}.map {$0.content}
        print("save answers:")
        print(answers)
    }
    
}
