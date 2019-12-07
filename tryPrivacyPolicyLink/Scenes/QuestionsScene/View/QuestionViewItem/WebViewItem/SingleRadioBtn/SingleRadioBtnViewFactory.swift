//
//  CodeSingleRadioBtnViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class SingleRadioBtnViewFactory: GetViewProtocol {
   
    var myView: UIView!

    private var radioBtnOnImg = RadioBtnImage.init().onImage
    private var radioBtnOffImg = RadioBtnImage.init().offImage
    
    func getView() -> UIView {
        return myView
    }
    
    init(tag: Int, isOn: Bool, titleText: String) {
        
        let radioButton               = UIButton()
        radioButton.backgroundColor   = .blue
        let img = isOn ? radioBtnOnImg : radioBtnOffImg
        radioButton.setBackgroundImage(img, for: .normal)
        
        radioButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        radioButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        //Big Button (View size)
        let button               = UIButton()
        button.backgroundColor   = .yellow
        
        //Text Label
        button.titleLabel!.numberOfLines = 0
        button.setTitleColor(.black, for: .normal)
        button.setTitle(titleText, for: .normal)
        button.contentHorizontalAlignment = .left
        
        button.heightAnchor.constraint(equalTo: button.titleLabel!.heightAnchor, multiplier: 1.0).isActive = true
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.addArrangedSubview(radioButton)
        stackView.addArrangedSubview(button)
        
        myView = stackView
        
        _ = [radioButton, button, myView].map {
            $0.tag = tag
        }

    }
    
}
