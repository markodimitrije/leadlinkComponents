//
//  LabelWithTextFieldCell.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LabelWithTextFieldCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    func update(title: String, text: String) {
        self.titleLabel.text = title
        self.textView.text = text
    }
}
