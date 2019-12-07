//
//  OptInViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class OptInViewItem: NSObject, QuestionPageGetViewProtocol {
        
    private var myView: UIView!

    init(optInViewFactory: OptInViewFactory) {
        self.myView = optInViewFactory.getView()
    }
    
    func getView() -> UIView {
        return self.myView
    }
    
}
