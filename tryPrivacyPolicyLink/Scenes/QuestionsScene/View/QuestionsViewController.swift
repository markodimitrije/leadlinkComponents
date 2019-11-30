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
    
    var viewmodel: QuestionsViewItemManaging!
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = viewmodel.getQuestionViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
        
        hookUpSaveEvent(items: items)
    }
    
    private func hookUpSaveEvent(items: [QuestionViewItem]) {
        let stackView = items.first(where: {$0 is SaveBtnViewItem})!.getView() as! UIStackView
        self.saveBtn = stackView.subviews.first(where: {$0 is UIButton})! as? UIButton
        saveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
    }
    
    @objc private func saveBtnTapped() {
        viewmodel.saveBtnTapped()
    }
    
    deinit {
        print("QuestionsViewController.is deinit")
    }
}
