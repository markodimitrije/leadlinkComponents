//
//  LabelAndPhoneTextField.swift
//  LeadLinkApp
//
//  Created by Marko Dimitrijevic on 06/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LabelAndPhoneTextField: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            formatBorder()
            textField.delegate = self
        }
    }
    
    private var headlineTxt: String? {
        get {
            return headlineLbl?.text
        }
        set {
            headlineLbl?.text = newValue
        }
    }
    private var inputTxt: String? {
        get {
            return textField?.text
        }
        set {
            textField?.text = newValue ?? ""
        }
    }
    private var placeholderTxt: String? {
        get {
            return textField?.placeholder
        }
        set {
            textField?.placeholder = newValue ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib() // ne zaboravi OVO !
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    convenience init(frame: CGRect, headlineText: String?, inputTxt: String?) {
        self.init(frame: frame)
        self.headlineTxt = headlineText // prerano za postavljanje outlet-a !!
        self.inputTxt = inputTxt // prerano za postavljanje outlet-a !!
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LabelAndPhoneTextField", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(view)
        
    }
    
    private func formatBorder() {
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
    }
    
    // MARK:- API
    
    func update(headlineText: String?, inputTxt: String?, placeholderTxt: String?) {
        self.headlineTxt = headlineText
        self.inputTxt = inputTxt
        self.placeholderTxt = placeholderTxt
    }
    
}


