//
//  SaveBtnViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class SaveBtnViewItem: QuestionPageGetViewProtocol {
    
    private var view: UIView
    
    init() {
        let saveBtnView = CodeButtonFactory(title: "Save", width: allowedWidth).getView()
        self.view = saveBtnView
    }
    
    func getView() -> UIView {
        return self.view
    }
}
