//
//  RadioBtnsFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 02/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class RadioBtnsFactory: GetViewProtocol {
   
    private var myView: UIView!
    private var singleRadioBtnViewModels: [SingleRadioBtnViewModel]!
    
    func getView() -> UIView {
        return myView
    }
    
    func getViewModels() -> [SingleRadioBtnViewModel] {
        return self.singleRadioBtnViewModels
    }
    
    init(question: Question, answer: Answer?) {
        
        let titles = question.settings.options ?? [ ]
        
        let selected = titles.map {(answer?.content ?? [ ]).contains($0)}
        
        let singleRadioBtnViewModels = titles.enumerated().map { (index, title) -> SingleRadioBtnViewModel in
//            let onOffImages = [RadioBtnImage().onImage!, RadioBtnImage().offImage!]
//            let radioBtnFactory = RadioBtnFactory(tag: index, isOn: selected[index], onAndOffImages: onOffImages)
//            let extendedBtnFactory = ExtendedRadioBtnFactory(tag: index, titleText: title)
//            let viewFactory = SingleRadioBtnViewFactory(radioBtnFactory: radioBtnFactory, extendedRadioBtnFactory: extendedBtnFactory)
            let radioBtnFactory = SingleRadioBtnViewFactory(tag: index,
                                                            isOn: selected[index],
                                                            titleText: title)
            let radioBtnViewModel = SingleRadioBtnViewModel(viewFactory: radioBtnFactory, isOn: selected[index])
            return radioBtnViewModel
        }
        self.singleRadioBtnViewModels = singleRadioBtnViewModels
        let singleViews = singleRadioBtnViewModels.map {$0.getView()}
        let verticalStackerFactory = CodeVerticalStacker(views: singleViews)
        
        self.myView = verticalStackerFactory.getView()
        
    }
    
}
