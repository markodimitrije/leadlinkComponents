//
//  PresentQuestionInfoProtocol.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

protocol PresentQuestionInfoProtocol {
    func getQuestion() -> Question
    func getAnswer() -> Answer?
    func getCode() -> String
}
