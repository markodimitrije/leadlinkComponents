//
//  GlobalVarsData.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import Foundation

let dropdownQuestion = Question(id: 1,
                                campaign_id: 7520,
                                title: longTitle,
                                type: "dropdown",
                                group: "Personal info",
                                required: false,
                                description: longDescription,
                                order: 1, element_id: nil,
                                settings: QuestionSettings(options: ["A","B","C","D","E"]))

let dropdownAnswer = Answer(question: dropdownQuestion, code: "12", content:  [longTitle], optionIds: nil)

let longTitle = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachas WWWW"

let longDescription = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasAAAA"
