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
        
//        let groupViewFactory = GroupViewFactory(text: longTitle)
//        let groupItem = GroupViewItem(viewFactory: groupViewFactory)
        
        let dropdownQuestionInfo = PresentQuestionInfo(question: dropdownQuestion, answer: dropdownAnswer, code: code)
        let dropdownItem = DropdownViewModelFactory(questionInfo: dropdownQuestionInfo).getViewModel()
        //let dropdownItem = DropdownViewModel(question: dropdownQuestion, answer: dropdownAnswer, code: code)
//        let dropdownItem = DropdownViewModel(question: dropdownQuestion, answer: nil, code: code)
        
        let textAreaInfo = PresentQuestionInfo(question: dropdownQuestion, answer: nil, code: code)
        let textAreaItem = TextAreaViewModelFactory(questionInfo: textAreaInfo).getViewModel()
        //let textAreaItem = TextAreaViewModel(question: dropdownQuestion, answer: dropdownAnswer, code: code)
        //let textAreaItem = TextAreaViewModel(question: dropdownQuestion, answer: nil, code: code)
        
        let radioBtnsQuestionInfo = PresentQuestionInfo(question: radioQuestion, answer: radioAnswer, code: code)
        let radioBtnsItem = RadioBtnsViewModelFactory(questionInfo: radioBtnsQuestionInfo).getViewModel()
//        let radioBtnsItem = RadioBtnsViewModel(question: radioQuestion, answer: nil, code: code)
//        let radioBtnsItem = RadioBtnsViewModel(question: radioQuestion, answer: radioAnswer, code: code)
        
//        let checkboxBtnsViewModel = CheckboxBtnsViewModel(question: checkboxQuestion, answer: nil, code: code)
        let checkboxInfo = PresentQuestionInfo(question: checkboxQuestion, answer: checkboxAnswer, code: code)
        let checkboxBtnsViewModel = CheckboxBtnsViewModelFactory(questionInfo: checkboxInfo).getViewModel()
//        let checkboxBtnsViewModel = CheckboxBtnsViewModel(question: checkboxQuestion, answer: checkboxAnswer, code: code)
        
        let radioQuestionInfo = PresentQuestionInfo(question: radioWithInputQuestion, answer: radioWithInputAnswer, code: code)
        let radioBtnsWithInputViewModel = RadioBtnsWithInputViewModelFactory(questionInfo: radioQuestionInfo).getViewModel()
        //let radioBtnsWithInputViewModel = RadioBtnsWithInputViewModel(question: radioWithInputQuestion, answer: nil, code: code)
        //let radioBtnsWithInputViewModel = RadioBtnsWithInputViewModel(question: radioWithInputQuestion, answer: radioWithInputAnswer, code: code)
        
//        let checkboxBtnsWithInputViewModel = CheckboxBtnsWithInputViewModel(question: checkboxWithInputQuestion, answer: nil, code: code)
        let questionInfo = PresentQuestionInfo(question: checkboxWithInputQuestion, answer: checkboxWithInputAnswer, code: code)
        let checkboxBtnsWithInputViewModel = CheckboxBtnsWithInputViewModelFactory(questionInfo: questionInfo).getViewModel()
        
        // MARK:- OPT-IN
        let titleWithHiperlinkViewFactory = TitleWithHiperlinkViewFactory(title: optIn.text, hiperlinkText: optIn.privacyPolicy, urlString: optIn.url)
        let optInViewFactory = OptInViewFactory(optIn: optIn, titleWithHiperlinkViewFactory: titleWithHiperlinkViewFactory)
        let optInViewItem = OptInViewItem(optInViewFactory: optInViewFactory)
        
        // MARK:- TERMS
        
        let termsInfo = PresentQuestionInfo(question: termsQuestion, answer: termsAnswer, code: code)
        let termsSwitchItem = TermsSwitchBtnViewModelFactory(questionInfo: termsInfo).getViewModel()
        
        // MARK:- SAVE
        let saveButtonItem = SaveBtnViewItem()
        
        let items: [QuestionPageGetViewProtocol] = [radioBtnsWithInputViewModel, checkboxBtnsWithInputViewModel, dropdownItem, textAreaItem, radioBtnsItem, checkboxBtnsViewModel, optInViewItem, termsSwitchItem, saveButtonItem]
        
//        let items: [QuestionPageGetViewProtocol] = [checkboxBtnsWithInputViewModel, textAreaItem, dropdownItem, saveButtonItem]
        
//        let items: [QuestionPageGetViewProtocol] = [checkboxBtnsWithInputViewModel, saveButtonItem]
        
//        let items: [QuestionPageGetViewProtocol] = [groupItem, dropdownItem, textAreaItem, radioBtnsItem, saveButtonItem]
        //let items: [QuestionPageGetViewProtocol] = [radioBtnsItem, checkboxBtnsViewModel, saveButtonItem]
//        let items: [QuestionPageGetViewProtocol] = [radioBtnsWithInputViewModel, saveButtonItem]
//        let items: [QuestionPageGetViewProtocol] = [radioBtnsItem, checkboxBtnsWithInputViewModel, saveButtonItem]
//        let items: [QuestionPageGetViewProtocol] = [optInViewItem, saveButtonItem]
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
    case radioBtn = "radio"//"radioBtn" OK OK OK OK OK OK OK OK OK OK OK OK
    case checkbox = "checkbox" OK OK OK OK OK OK OK OK OK OK OK OK
    case radioBtnWithInput = "radioBtnWithInput" OK OK OK OK OK OK OK OK OK OK OK OK
    case checkboxSingleWithInput = "checkbox_single_with_input" OK OK OK OK OK OK OK OK OK OK OK OK
    case checkboxMultipleWithInput = "checkbox_with_input" OK OK OK OK OK OK OK OK OK OK OK OK
    case switchBtn = "switchBtn"
    case textField = "text"//"textField" OK OK OK OK OK OK OK OK OK OK OK OK
    case textArea = "textarea"           OK OK OK OK OK OK OK OK OK OK OK OK
    case dropdown = "dropdown"// case textWithOptions = "textWithOptions"  OK OK OK OK OK OK OK OK OK OK OK OK
    case termsSwitchBtn = "termsSwitchBtn"
}

*/
