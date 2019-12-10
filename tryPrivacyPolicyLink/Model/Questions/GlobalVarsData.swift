//
//  GlobalVarsData.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

let dropdownQuestion = Question(id: 1,
                                campaign_id: 7520,
                                title: longTitle,
                                type: "dropdown",
                                group: "Personal info",
                                required: false,
                                description: longDescription,
                                order: 1, element_id: nil,
                                settings: QuestionSettings(options: []))

let radioQuestion = Question(id: 1,
                            campaign_id: 7520,
                            title: longTitle,
                            type: "radio",
                            group: "Profesional Interest",
                            required: false,
                            description: longDescription,
                            order: 1, element_id: nil,
                            settings: QuestionSettings(options: ["OptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionA","OptionB","OptionC","OptionD","OptionE"]))

let radioWithInputQuestion = Question(id: 1,
                                    campaign_id: 7520,
                                    title: longTitle,
                                    type: "radioWithInput",
                                    group: "Profesional Interest",
                                    required: false,
                                    description: shortDescription,
                                    order: 1, element_id: nil,
                                    settings: QuestionSettings(options: ["OptionA","OptionB","OptionC"]))

let checkboxQuestion = Question(id: 1,
                                campaign_id: 7520,
                                title: longTitle,
                                type: "checkbox",
                                group: "Profesional Interest",
                                required: false,
                                description: longDescription,
                                order: 1, element_id: nil,
                                settings: QuestionSettings(options: ["OptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionA","OptionB","OptionC","OptionD","OptionE"]))

let checkboxWithInputQuestion = Question(id: 1,
                                        campaign_id: 7520,
                                        title: longTitle,
                                        type: "checkboxWithInput",
                                        group: "Profesional Interest",
                                        required: false,
                                        description: shortDescription,
                                        order: 1, element_id: nil,
                                        settings: QuestionSettings(options: ["OptionA","OptionB","OptionCCOptionCCOptionCC"]))

let dropdownAnswer = Answer(question: dropdownQuestion, code: "12", content:  [longTitle], optionIds: nil)
let radioAnswer = Answer(question: radioQuestion, code: "12", content: ["OptionC"], optionIds: [0,1,2])
let radioWithInputAnswer = Answer(question: radioQuestion, code: "12", content: ["OptionC", "dfjkbadfewsddasddfda dfjkbad answer"], optionIds: [2])

let checkboxAnswer = Answer(question: radioQuestion, code: "12", content: ["OptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionAOptionA","OptionB","OptionC"], optionIds: [0,1,2])

let checkboxWithInputAnswer = Answer(question: radioQuestion, code: "12", content: ["OptionCC", "dfjkbadfew sddasddfda dfjkbad answer"], optionIds: [2])
//let checkboxWithInputAnswer = Answer(question: radioQuestion, code: "12", content: ["OptionCC", "ans"], optionIds: [2])

//let longTitle = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachas WWWW"

let longTitle = "acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas WWWW"

//let longDescription = "acshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasacshghacsvhgsvdgdshhsdasdgahhvgsagdgsghdshachasAAAA"

let longDescription = "acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas acshgh acsvhgsvdgds dgsghdsh achas WWWW AAAA"

let shortDescription = "sdjkkjdsa jcajcdas dsjkjcjz"

let optIn = OptIn(text: "Für mehr können Sie unsere lesen\n(Pour plus vous pouvez lire notre",
                  url: "https://navus.e-materials.com/assets/PDFs/Privacy-and-Cookies-Policy-Navus-16062018.pdf",
                  privacyPolicy: "Datenschutz-Bestimmungen\nPolitique de Confidentialité")

let termsQuestion = Question(id: 100,
                             campaign_id: 122,
                             title: "",
                             type: "termsSwitchBtn",
                             group: "Terms",
                             required: true,
                             description: "whatever",
                             order: 14, element_id: nil,
                             settings: QuestionSettings(options: [
                                "Ich habe die gelesen und akzeptiere sie \n(J'ai lu et accepte le)",
                                "Begriffe & Bedingungen \n(Termes et Conditions)"]))
//let termsAnswer: Answer? = nil
let termsAnswer: Answer? = Answer(question: termsQuestion, code: "12", content: ["true"], optionIds: nil)

var allowedWidth: CGFloat {
    let myAllowedWidth = UIScreen.main.bounds.width - 16
    return myAllowedWidth
}

let navusTermsUrl = "https://navus.e-materials.com/assets/PDFs/Privacy-and-Cookies-Policy-Navus-16062018.pdf"
