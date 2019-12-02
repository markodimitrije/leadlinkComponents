//
//  SingleCheckboxBtnViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class SingleCheckboxBtnViewFactory: GetViewProtocol {
   
    var myView: UIView!

    private var checkboxBtnOnImg = CheckboxBtnImage().onImage
    private var checkboxBtnOffImg = CheckboxBtnImage().offImage
    
    func getView() -> UIView {
        return myView
    }
    
    private func hookUpButtonTapEventWithMultipleCheckboxInstance(btns: [UIButton],
                                                                  delegate: BtnTapListening?) {
        _ = btns.map {
            $0.addTarget(delegate, action: #selector(CheckboxBtnsWebViewItem.btnTapped), for: .touchUpInside)
        }
    }
    
    init(tag: Int, isOn: Bool, titleText: String, width: CGFloat, delegate: BtnTapListening?) {
        
        let radioButton               = UIButton()
        radioButton.backgroundColor   = .blue
        let img = isOn ? checkboxBtnOnImg : checkboxBtnOffImg
        radioButton.setBackgroundImage(img, for: .normal)
        
        radioButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        radioButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        //Big Button (View size)
        let button               = UIButton()
        button.backgroundColor   = .orange
        
        //Text Label
        button.titleLabel!.numberOfLines = 0
        button.setTitleColor(.black, for: .normal)
        button.setTitle(titleText, for: .normal)
        button.titleLabel!.textAlignment = .center
        
        let labelWidth = width - 68.0
        button.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        button.heightAnchor.constraint(equalTo: button.titleLabel!.heightAnchor, multiplier: 1.0).isActive = true
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(radioButton)
        stackView.addArrangedSubview(button)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        myView = stackView
        
        _ = [radioButton, button, myView].map {
            $0.tag = tag
        }
        
        hookUpButtonTapEventWithMultipleCheckboxInstance(btns:  [radioButton, button], delegate: delegate)

    }
    
}

