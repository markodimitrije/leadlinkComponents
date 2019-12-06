//
//  PresentQuestionInfo.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

struct PresentQuestionInfo {
    
    private let question: Question
    private let answer: Answer?
    private let code: String
    
    init(question: Question, answer: Answer?, code: String) {
        self.question = question
        self.answer = answer
        self.code = code
    }
    
}

extension PresentQuestionInfo: PresentQuestionInfoProtocol {
    func getQuestion() -> Question {
        return self.question
    }
    func getAnswer() -> Answer? {
        return self.answer
    }
    func getCode() -> String {
        return self.code
    }
}
