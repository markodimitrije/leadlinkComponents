//
//  QuestionsViewController.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    var viewmodel: QuestionsViewItemSupplying!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        displayQuestions()
    }
        
    private func displayQuestions() {
        let items = viewmodel.getQuestionPageViewItems()
        let views = items.map({$0.getView()})
        _ = views.map(stackView.addArrangedSubview(_:))
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if let activeTextControl = stackView.findViews(subclassOf: UITextView.self).first(where: {$0.isFirstResponder}) {
                if shouldScrollDueToKeyboardAppearance(view: activeTextControl) {
                    self.scrollView.contentOffset.y += abs(keyboardSize.size.height)
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
    }
    
    fileprivate func shouldScrollDueToKeyboardAppearance(view: UIView) -> Bool {
        
        let viewInScrollViewPoint = view.superview!.convert(CGPoint(x: 0, y: view.frame.maxY), to: scrollView)
        
        if viewInScrollViewPoint.y >= scrollView.contentOffset.y + scrollView.frame.midY {
            return true
        } else {
            return false
        }
    }
    
}
