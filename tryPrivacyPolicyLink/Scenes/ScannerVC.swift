//
//  ScannerVC.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class ScannerVC: UIViewController {
    
    private var code = "12"
    
    @IBAction func openNextVCbtnTapped(_ sender: UIButton) {
        let questionsVC = makeQuestionsViewController(code: code)
        self.navigationController?.pushViewController(questionsVC, animated: true)
    }
    
    private func makeQuestionsViewController(code: String) -> UIViewController {
        let viewmodel = QuestionsViewModelFactory().makeViewModel(code: code)
        let questionsVC = QuestionsViewControllerFactory().make(viewmodel: viewmodel)
        return questionsVC
    }
    
}
