//
//  Answer.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

public struct Answer {
    var campaignId = 0
    var questionId = 0
    var code = ""
    var id = ""
    var content = [String]()
    var optionIds: [Int]?
    var questionType = ""
}
