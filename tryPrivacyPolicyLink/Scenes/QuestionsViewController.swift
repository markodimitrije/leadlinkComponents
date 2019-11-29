//
//  QuestionsViewController.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var viewmodel: QuestionsViewItemSupplying!
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = viewmodel.getQuestionViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
    }
}

class QuestionsViewControllerFactory {
    func make() -> QuestionsViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "QuestionsViewController") as! QuestionsViewController
        let viewmodel = makeViewModel()
        vc.viewmodel = viewmodel
        return vc
    }
    
    private func makeViewModel() -> QuestionsViewItemSupplying {
        let viewmodel = QuestionsViewModel()
        return viewmodel
    }
}



protocol QuestionsViewItemSupplying {
    func getQuestionViewItems() -> [QuestionViewItem]
}

protocol QuestionViewItem {
    func getView() -> UIView
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

class GroupViewItem: QuestionViewItem {
    func getView() -> UIView {
        
        let groupView = CodeLabelFactory(text: longTitle, width: 414.0).getView()
        return groupView
    }
}

class DropdownWebViewItem: QuestionViewItem {
    var question: Question
    var answer: Answer?
    init(question: Question, answer: Answer?) {
        self.question = question
    }
    func getView() -> UIView {
        let inputText = "ddsacz\nddsacz\nddsacz\nddsacz\nddsacz\nddsacz\n"
        let view = CodeLabelAndTextViewDropdownFactory(headlineText: question.title, inputText: inputText, placeholderText: question.description ?? "", width: 414.0, delegate: nil).getView()
        view.backgroundColor = .green
        return view
    }
}

struct Question {
    var id: Int
    var campaign_id: Int
    var title: String
    var type: String
    var group: String?
    var required: Bool
    var description: String?
    var order: Int
    var element_id: Int?
    var settings: QuestionSettings
}

public struct QuestionSettings {
    var options: [String]?
}

public struct Answer {
    var campaignId = 0
    var questionId = 0
    var code = ""
    var id = ""
    var content = [String]()
    var optionIds: [Int]?
    var questionType = ""
}

let dropdownQuestion = Question(id: 1, campaign_id: 7520,
                                title: longTitle,
                                type: "dropdown",
                                group: "Personal info",
                                required: false,
                                description: longDescription,
                                order: 1, element_id: nil,
                                settings: QuestionSettings(options: ["A","B","C","D","E"]))

let longTitle = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachas"

let longDescription = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasAAAA"
