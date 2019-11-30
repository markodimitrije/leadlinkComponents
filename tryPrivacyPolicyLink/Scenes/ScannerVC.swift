//
//  ScannerVC.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class ScannerVC: UIViewController {
    
    @IBAction func openNextVCbtnTapped(_ sender: UIButton) {
        let questionsVC = QuestionsViewControllerFactory().make()
        self.navigationController?.pushViewController(questionsVC, animated: true)
    }
    
}
