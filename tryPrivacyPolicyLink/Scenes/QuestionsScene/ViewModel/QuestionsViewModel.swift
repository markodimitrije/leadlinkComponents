//
//  QuestionsViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

protocol QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionViewItem]
}

class QuestionsViewModel: QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionViewItem] {
        var viewItems: [QuestionViewItem] = []
        let groupItem = GroupViewItem()
        let dropdownItem = DropdownWebViewItem(question: dropdownQuestion, answer: nil)
        viewItems.append(groupItem)
        viewItems.append(dropdownItem)
        return viewItems
    }
}
