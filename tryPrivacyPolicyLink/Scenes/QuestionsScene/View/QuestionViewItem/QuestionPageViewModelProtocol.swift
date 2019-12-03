//
//  QuestionPageGetViewProtocol.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol QuestionPageGetViewProtocol {
    func getView() -> UIView
}

protocol ActualAnswerProtocol {
    func getActualAnswer() -> Answer?
}

protocol QuestionPageViewModelProtocol: QuestionPageGetViewProtocol, ActualAnswerProtocol {}
