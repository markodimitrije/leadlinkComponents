//
//  QuestionsViewControllerFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewControllerFactory {
    func make() -> QuestionsViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "QuestionsViewController") as! QuestionsViewController
        let viewmodel = makeViewModel()
        vc.viewmodel = viewmodel
        return vc
    }
    
    private func makeViewModel() -> QuestionsViewItemSupplying {
        let viewmodel = QuestionsViewModel()
        return viewmodel
    }
}
