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
    private let myView: UIView
    func getView() -> UIView {
        return self.myView
    }
    
    func getActualAnswer() -> Answer? {
        return nil
    }
    init(questionInfo: PresentQuestionInfoProtocol) {
        let factory = TermsSwitchBtnViewFactory(questionInfo: questionInfo)
        self.myView = factory.getView()
    }
    
}

class TermsSwitchBtnViewFactory: GetViewProtocol {
    private let myView: UIView
    func getView() -> UIView {
        return self.myView
    }

    init(questionInfo: PresentQuestionInfoProtocol) {
        let options = questionInfo.getQuestion().settings.options!
        let titleWithHiperlinkViewFactory =
            TitleWithHiperlinkViewFactory(title: options.first!,
                                          hiperlinkText: options.last!,
                                          urlString: "https://navus.e-materials.com/assets/PDFs/Privacy-and-Cookies-Policy-Navus-16062018.pdf")
        let textsView = titleWithHiperlinkViewFactory.getView()
        //self.myView = titleWithHiperlinkViewFactory.getView()
        let switchBtn = UISwitch()
        let stackView = CodeHorizontalStacker(views: [textsView, switchBtn], distribution: .fill).getView()
        self.myView = stackView
        
    }
}
