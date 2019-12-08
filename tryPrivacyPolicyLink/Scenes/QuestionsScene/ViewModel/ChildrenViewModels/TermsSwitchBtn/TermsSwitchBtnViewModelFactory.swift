//
//  TermsSwitchBtnViewModelFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 08/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol TermsSwitchBtnViewModelFactoryProtocol: GetViewModelProtocol {}

class TermsSwitchBtnViewModelFactory: TermsSwitchBtnViewModelFactoryProtocol {
    private let viewmodel: TermsSwitchBtnViewModel
    func getViewModel() -> QuestionPageViewModelProtocol {
        return self.viewmodel
    }
    init(questionInfo: PresentQuestionInfoProtocol) {
        self.viewmodel = TermsSwitchBtnViewModel(questionInfo: questionInfo)
    }
}

class TermsSwitchBtnViewModel: QuestionPageViewModelProtocol {
    private let question: Question
    private var answer: Answer?
    private let code: String
    private let myView: UIView
    func getView() -> UIView {
        return self.myView
    }
    
    func getActualAnswer() -> Answer? {
        let switchBtn = myView.findViews(subclassOf: UISwitch.self).first!
        let content = ["\(switchBtn.isOn)"]
        if answer != nil {
            answer?.content = content
        } else {
            answer = Answer(question: question, code: code, content: content, optionIds: nil)
        }
        return answer
    }
    init(questionInfo: PresentQuestionInfoProtocol) {
        self.question = questionInfo.getQuestion()
        self.answer = questionInfo.getAnswer()
        self.code = questionInfo.getCode()
        let isOn = !(self.answer?.content.isEmpty ?? true)
        let factory = TermsSwitchBtnViewFactory(questionInfo: questionInfo, isOn: isOn)
        self.myView = factory.getView()
    }
    
}

class TermsSwitchBtnViewFactory: GetViewProtocol {
    private let myView: UIView
    func getView() -> UIView {
        return self.myView
    }

    init(questionInfo: PresentQuestionInfoProtocol, isOn: Bool) {
        let options = questionInfo.getQuestion().settings.options!
        let titleWithHiperlinkViewFactory =
            TitleWithHiperlinkViewFactory(title: options.first!,
                                          hiperlinkText: options.last!,
                                          urlString: navusTermsUrl)
        let textsView = titleWithHiperlinkViewFactory.getView()
        let switchBtn = UISwitch()
        switchBtn.isOn = isOn
        let stackView = CodeHorizontalStacker(views: [textsView, switchBtn], distribution: .fill).getView()
        self.myView = stackView
        
    }
}
