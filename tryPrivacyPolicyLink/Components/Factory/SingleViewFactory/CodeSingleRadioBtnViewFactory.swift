//
//  CodeSingleRadioBtnViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 28/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class CodeSingleRadioBtnViewFactory: GetViewProtocol {
   
    var myView: UIView!
    
    private var _isOn: Bool = false
    private var button: UIButton!
    
    private var radioBtnOnImg = RadioBtnImage.init().onImage
    private var radioBtnOffImg = RadioBtnImage.init().offImage
    
    private var delegate: BtnTapListening?
    
    var isOn: Bool {
        get {
            return _isOn
        }
        set {
            _isOn = newValue
            let img = _isOn ? radioBtnOnImg : radioBtnOffImg
            button.setBackgroundImage(img, for: .normal)
        }
    }
    
    func getView() -> UIView {
        return myView
    }
    
    init(tag: Int, isOn: Bool, titleText: String, width: CGFloat, delegate: BtnTapListening?) {
        
        self.delegate = delegate
        
        let radioButton               = UIButton()
        radioButton.backgroundColor   = .blue
        let img = isOn ? radioBtnOnImg : radioBtnOffImg
        radioButton.setBackgroundImage(img, for: .normal)
        
        radioButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        radioButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        self._isOn = isOn
        
        //Big Button (View size)
        let button               = UIButton()
        button.backgroundColor   = .yellow
        
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
        
        self.button = radioButton
        //self.button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        _ = [radioButton, button].map {
            $0.addTarget(delegate, action: #selector(RadioBtnsWebViewItem.btnTapped), for: .touchUpInside)
        }
        
        myView = stackView
        
        _ = [radioButton, button, myView].map {
            $0.tag = tag
        }

    }
    
}

//class CodeSingleRadioBtnViewFactory: GetViewProtocol {
//
//    var myView: UIView!
//
//    func getView() -> UIView {
//        return myView
//    }
//
//    init(headlineText: String, inputText: String, placeholderText: String, width: CGFloat) {
//
//        let imageView               = UIView()
//        imageView.backgroundColor   = .blue
//        imageView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
//
//        //Text Label
//        let textLabel               = UILabel()
//        textLabel.backgroundColor   = .yellow
//        let labelWidth = width - 68.0
//        textLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//        textLabel.numberOfLines = 0
//        textLabel.text  = headlineText
//        textLabel.textAlignment = .center
//
//        //Stack View
//        let stackView   = UIStackView()
//        stackView.axis  = .horizontal
//        stackView.distribution  = .fill
//        stackView.alignment = .center
//        stackView.spacing   = 8.0
//
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(textLabel)
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false;
//
//        myView = stackView
//        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
//    }
//}
