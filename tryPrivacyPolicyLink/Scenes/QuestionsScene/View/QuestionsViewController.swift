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
    private var items = [QuestionViewItem]()
    
    var viewmodel: QuestionsViewItemManaging!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = viewmodel.getQuestionViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
     
//        hookUpSaveEvent()
    }
    
//    private func hookUpSaveEvent() {
//        
//        let saveBtnViewItem = self.items.last(where: {$0 is SaveBtnViewItem}) as! SaveBtnViewItem
//        let btn = saveBtnViewItem.getView().subviews.first! as! UIButton
//        btn.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
//        
//        self.stackView.addArrangedSubview(saveBtnViewItem.getView())
//        
//    }
    
    
    
    @objc private func saveTapped() {
        print("saveBtnTapped")
        viewmodel.saveBtnTapped()
    }
    
    deinit {
        print("QuestionsViewController.is deinit")
    }
}
