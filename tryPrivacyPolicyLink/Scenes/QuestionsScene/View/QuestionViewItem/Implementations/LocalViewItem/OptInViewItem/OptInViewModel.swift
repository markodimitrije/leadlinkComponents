//
//  OptInViewModel.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class OptInViewModel: NSObject, QuestionPageGetViewProtocol {
        
    private var myView: UIView!
    private let optIn: OptIn
    
    init(optIn: OptIn) {
        self.optIn = optIn
        super.init()
        loadView()
    }
    
    private func loadView() {
        self.myView = OptInViewFactory(optIn: optIn).getView()
    }
    
    func getView() -> UIView {
        return self.myView
    }
    
}

extension OptInViewModel: UITextViewDelegate {
     
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing.implement me")
//        if textView.text == question.description ?? "" {
//            self.deletePlaceholderAndSetTxtColorToBlack(textView: textView)
//        }
    }
}
