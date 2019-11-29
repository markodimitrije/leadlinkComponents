//
//  Question.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

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
