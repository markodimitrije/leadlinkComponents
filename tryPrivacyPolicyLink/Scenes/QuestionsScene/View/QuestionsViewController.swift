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
    
    private var saveBtn: UIButton!
    private var items = [QuestionPageViewProtocol]()
    
    var viewmodel: QuestionsViewItemManaging!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestions()
    }
        
    private func displayQuestions() {
        self.items = viewmodel.getQuestionViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
    }
}
