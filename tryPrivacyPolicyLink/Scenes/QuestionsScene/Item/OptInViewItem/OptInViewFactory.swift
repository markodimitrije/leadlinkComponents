//
//  OptInViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class OptInViewFactory: GetViewProtocol {
    
    private var textView: UITextView!
    private var myView: UIView!
    private let optIn: OptIn
    
    func getView() -> UIView {
        return self.myView
    }
    
    init(optIn: OptIn, titleWithHiperlinkViewFactory: TextWithHiperlinkViewFactory) {
        self.optIn = optIn
        self.myView = titleWithHiperlinkViewFactory.getView()
    }
    
}
