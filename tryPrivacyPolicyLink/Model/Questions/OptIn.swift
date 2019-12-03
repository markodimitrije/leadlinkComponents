//
//  OptIn.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

public struct OptIn: Codable {
    var text: String
    var url: String
    var privacyPolicy: String
}
