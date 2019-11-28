//
//  MakeViewProtocol.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 28/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol MakeViewProtocol {
    func getView() -> UIView
}

protocol ViewProtocol {
    var view: UIView {get}
}
