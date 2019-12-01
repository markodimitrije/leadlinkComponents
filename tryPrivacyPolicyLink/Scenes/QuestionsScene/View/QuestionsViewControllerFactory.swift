//
//  QuestionsViewControllerFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewControllerFactory {
    func make(code: String) -> QuestionsViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "QuestionsViewController") as! QuestionsViewController
        let viewmodel = makeViewModel(code: code)
        vc.viewmodel = viewmodel
        return vc
    }
    
    private func makeViewModel(code: String) -> QuestionsViewItemManaging {
        let viewmodel = QuestionsViewModel(code: code)
        return viewmodel
    }
}
