//
//  WrapIntoBorderFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 05/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class WrapIntoBorderFactory: GetViewProtocol {
    
    private let embededView: UIView
    private let insets: UIEdgeInsets
    private let borderLayout: BorderLayoutProtocol
    
    private var myView: UIView!
    func getView() -> UIView {
        return self.myView
    }
    
    init(embededViewFactory: GetViewProtocol, insets: UIEdgeInsets, borderLayout: BorderLayoutProtocol) {
        self.embededView = embededViewFactory.getView()
        self.insets = insets
        self.borderLayout = borderLayout
        self.loadView()
    }
    
    private func loadView() {
        let view = UIView.init()
        view.addSubview(self.embededView)
        setConstraintsBetweenWraperAndEmbededView(view: view)
        drawWraperViewBorder(view: view, borderLayout: borderLayout)
        self.myView = view
    }
    
    private func setConstraintsBetweenWraperAndEmbededView(view: UIView) {
        
        self.embededView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        self.embededView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        
        view.bottomAnchor.constraint(equalTo: self.embededView.bottomAnchor, constant: insets.bottom).isActive = true
        view.trailingAnchor.constraint(equalTo: self.embededView.trailingAnchor, constant: insets.right).isActive = true
    }
    
    private func drawWraperViewBorder(view: UIView, borderLayout: BorderLayoutProtocol) {
        view.layer.cornerRadius = self.borderLayout.cornerRadius
        view.layer.borderColor = self.borderLayout.borderColor.cgColor
        view.layer.borderWidth = self.borderLayout.borderWidth
    }
}

protocol BorderLayoutProtocol {
    var cornerRadius: CGFloat {get set}
    var borderWidth: CGFloat {get set}
    var borderColor: UIColor {get set}
}

struct BorderLayout: BorderLayoutProtocol {
    
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: UIColor
    
    init(cornerRadius: CGFloat = 5.0, borderWidth: CGFloat = 1.0, borderColor: UIColor = .darkGray) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}
