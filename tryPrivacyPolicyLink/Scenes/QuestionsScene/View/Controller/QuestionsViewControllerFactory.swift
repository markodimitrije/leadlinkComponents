//
//  QuestionsViewControllerFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewControllerFactory {
    func make(viewmodel: QuestionsViewItemSupplying) -> QuestionsViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "QuestionsViewController") as! QuestionsViewController
        let viewmodel = viewmodel
        vc.viewmodel = viewmodel
        return vc
    }
}

class QuestionsViewModelFactory {
    func makeViewModel(code: String) -> QuestionsViewItemManaging {
        let viewmodel = QuestionsViewModel(code: code)
        return viewmodel
    }
}
