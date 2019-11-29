//
//  QuestionsViewController.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var viewmodel: QuestionsViewItemSupplying!
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = viewmodel.getQuestionViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
    }
}
