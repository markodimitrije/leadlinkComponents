//
//  Answer.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

//public struct Answer {
//    var campaignId = 0
//    var questionId = 0
//    var code = ""
//    var id = ""
//    var content = [String]()
//    var optionIds: [Int]?
//    var questionType = ""
//}


public struct Answer: Codable {
    var campaignId = 0
    var questionId = 0
    var code = ""
    var id = ""
    var content = [String]()
    var optionIds: [Int]?
    var questionType = ""
    
    var isEmpty: Bool {
        return content.isEmpty || (content.first! == "")
    }
    
    var compositeId: String {
        return "\(campaignId)" + "\(questionId)" + code
    }
    
    init(question: Question, code: String, content: [String], optionIds: [Int]?) {
        self.campaignId = question.campaign_id
        self.questionId = question.id
        self.code = code
        self.id = "\(campaignId)" + "\(questionId)" + code
        self.content = content
        self.optionIds = optionIds
        self.questionType = question.type
    }
    
    init(question: PresentQuestion, code: String, content: [String], optionIds: [Int]?) {
        self.campaignId = question.campaignId
        self.questionId = question.id
        self.code = code
        self.id = "\(campaignId)" + "\(questionId)" + code
        self.content = content
        self.optionIds = optionIds
        self.questionType = question.type.rawValue
    }
    
    static func emptyContent(question: PresentQuestion) -> Answer {
        return Answer.init(question: question,
                           code: "",
                           content: [],
                           optionIds: [])
    }
    
    func toWebReportJson() -> [String: String] {
        var res = [String: String]()
        res["question_id"] = "\(self.questionId)"
        res["content"] = concatanateIfMultipleOptionsIn(content: content)
        return res
    }
    
    private func concatanateIfMultipleOptionsIn(content: [String]) -> String {
        if content.count == 1 {
            return content.first!
        } else {
            return content.joined(separator: ", ")
        }
    }
    
}

extension Answer: Hashable {
    public static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.compositeId == rhs.compositeId
    }
    public func hash(into hasher: inout Hasher) {
        let value = Int(self.compositeId) ?? 0
        hasher.combine(value)
    }
}
