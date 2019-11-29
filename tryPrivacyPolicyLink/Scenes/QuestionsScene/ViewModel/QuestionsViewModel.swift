//
//  QuestionsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionViewItem]
}

protocol SaveBtnListening {
    func saveBtnTapped()
}

protocol QuestionsViewItemManaging: QuestionsViewItemSupplying, SaveBtnListening {}

class QuestionsViewModel: QuestionsViewItemManaging {
    
    var viewItems: [QuestionViewItem] = []
    
    func getQuestionViewItems() -> [QuestionViewItem] {
        
        let groupItem = GroupViewItem()
        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: nil)
        let saveButtonItem = SaveBtnViewItem()
        
        viewItems.append(groupItem)
        viewItems.append(dropdownItem)
        viewItems.append(saveButtonItem)
        
        return viewItems
    }
    
    func saveBtnTapped() { // javice ti vc
        print("saveBtnTapped. save answers")
    }
    
}
