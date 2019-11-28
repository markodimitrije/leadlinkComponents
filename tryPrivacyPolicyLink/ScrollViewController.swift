//
//  ScrollViewController.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

var screenWidth = CGFloat(0)

class ScrollViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        //let view = subviews.first(where: {$0.tag == 1}) as!
        guard let labelTextView = subviews.first(where: {$0.view.tag == 1}) as? LabelTextViewProtocol else {
            print("o-o, nemam expected item !!")
            return
        }
        print("labelTextView.getText() = \(labelTextView.getText())")
    }
    
    private var textViewDelegate: MyTextViewDelegate!
    private var dropDownDelegate: UITextViewDelegate!
    
    //var subviews = [UIView]()
    var subviews = [ViewProtocol]()
     
    override func viewDidLoad() { super.viewDidLoad()
        
        hookUpDelegates()
        screenWidth = self.view.bounds.width
        
//        insertColorViewAndLabel()
//        insertLabelAndTextFieldView()
//        insertCodeLabelAndTextView()
        insertCodeLabelAndTextViewImproved()
//        insertCodeLabelAndTextViewDropdown()
//        insertTwoCheckboxGroupViews()
//        insertMultipleObjects()
//        insertCodeSingleCheckmarkView()
//        insertSingleCheckboxGroupImproved()
//        insertCodeMultipleCheckmarkView()
//        insertHorizontalLabelTextFieldViews()
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
//        subviews.first { view -> Bool in
//            view.tag == 0
//        }.map { view in
//            let textView = view.subviews.first { view -> Bool in
//                view is UITextView
//            }
//            (textView as! UITextView).text = (textView as! UITextView).text + (textView as! UITextView).text + (textView as! UITextView).text
//        }
    }
    
    private func hookUpDelegates() {
        textViewDelegate = MyTextViewDelegate()
        dropDownDelegate = self
    }
    
    private func insertView() {
//        let frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: self.view.bounds.width, height: 500.0))
//        let childView = LabelAndTextField.init(frame: frame)
        let childView = LabelAndTextField()
        childView.backgroundColor = .red
        childView.update(headlineText: "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d", inputTxt: "sc dsa fdcx ads  ads d", placeholderTxt: "sc dsa fdcx ads  ads d")
        self.view.addSubview(childView)
    }
    
    private func insertColorViewAndLabel() {
    
        let childView = CodeViewAndLabelFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).getView()
//        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
        self.view.addSubview(childView)

    }
    
    private func insertLabelAndTextFieldView() {
        
            let childView = CodeLabelAndTextFieldFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
    //        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
            self.view.addSubview(childView)
            }
    
    private func insertCodeLabelAndTextView() {
    
        let childView = CodeLabelAndTextViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: textViewDelegate).myView!
        self.view.addSubview(childView)
    }
    
    private func insertCodeLabelAndTextViewImproved() {
    
        let factoryA = CodeLabelAndTextViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: textViewDelegate)
        let labelTextViewA = LabelTextView(factory: factoryA)
        
        labelTextViewA.view.tag = 1
        
        subviews.append(labelTextViewA)
        
        self.view.addSubview(labelTextViewA.view)

    }
    
    
    
    private func insertCodeLabelAndTextViewDropdown() {
    
//        let childView = CodeLabelAndTextViewDropdownFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: self).getView()
//
//        childView.tag = 0 // questionId
//
//        subviews.append(childView)
//
//        self.view.addSubview(childView)
    
    }
    
    private func insertTwoCheckboxGroupViews() {
        
        let checkmarkA = CodeSingleCheckmarkViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkB = CodeSingleCheckmarkViewFactory(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkC = CodeSingleCheckmarkViewFactory(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkD = CodeSingleCheckmarkViewFactory(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkE = CodeSingleCheckmarkViewFactory(headlineText: inputText+inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        
        let checkmarksViewABC = CodeVerticalStacker(views: [checkmarkA, checkmarkB, checkmarkC]).getView()
        let checkmarksViewDE = CodeVerticalStacker(views: [checkmarkD, checkmarkE]).getView()

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarksViewDE, checkmarksViewABC]).getView()
        
        self.view.addSubview(multipleCheckbox)
        
    }
    
    private func insertSingleCheckboxGroupImproved() {
        
        let checkboxFactoryA = CodeSingleCheckmarkViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth)
        let checkOptionA = CheckboxOptionView(factory: checkboxFactoryA).view
        
        let checkboxFactoryBC = CodeSingleCheckmarkViewFactory(headlineText: headlineText + headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth)
        
        let checkOptionB = CheckboxOptionView(factory: checkboxFactoryBC).view
        let checkOptionC = CheckboxOptionView(factory: checkboxFactoryBC).view
        
        let checkmarksViewABC = CodeVerticalStacker(views: [checkOptionA, checkOptionB, checkOptionC]).getView()

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarksViewABC]).getView()
        
        self.view.addSubview(multipleCheckbox)
        
    }
    
    private func insertMultipleObjects() {
       
        let viewA = CodeLabelAndTextFieldFactory(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        let viewB = CodeLabelAndTextFieldFactory(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        
// moras posebne views, ne moze da se isti (viewA, viewB) ubace u novi stackView (viewCD); moraju posebni viewC i viewD !!!
        let viewC = CodeLabelAndTextFieldFactory(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        let viewD = CodeLabelAndTextFieldFactory(headlineText: headlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        
        let viewAB = CodeVerticalStacker(views: [viewA, viewB]).getView()
        let viewCD = CodeVerticalStacker(views: [viewC, viewD]).getView()
        
        let compositeView = CodeVerticalStacker(views: [viewAB, viewCD]).getView()
        self.stackView.addArrangedSubview(compositeView)
        
    }
    
    private func insertCodeSingleCheckmarkView() {
        
        let childView = CodeSingleCheckmarkViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        self.view.addSubview(childView)
    }
    
    private func insertCodeMultipleCheckmarkView() {
        
        let checkmarkA = CodeSingleCheckmarkViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkB = CodeSingleCheckmarkViewFactory(headlineText: inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkC = CodeSingleCheckmarkViewFactory(headlineText: inputText+inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarkA, checkmarkB, checkmarkC]).getView()
        
        self.view.addSubview(multipleCheckbox)
    }

    private func insertHorizontalLabelTextFieldViews() {
        let viewA = CodeLabelAndTextFieldFactory(headlineText: "adc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc ds", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        let viewB = CodeLabelAndTextFieldFactory(headlineText: "cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let viewC = CodeLabelAndTextFieldFactory(headlineText: "cds dsx z cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let stacker = CodeHorizontalStacker(views: [viewA, viewB, viewC], width: screenWidth).getView()
        self.view.addSubview(stacker)
    }
    
}


let headlineText = "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d"
let inputText = "sc dsa fdcx ads  ads d sc dsa fdcx ads  ads d"
let placeholderText = "sc dsa fdcx ads  ads d"




let largeHeadlineText = "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads AAA"

let largeInputText = "sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads d sc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads dsc dsa fdcx ads  ads AAA"

protocol QuestionViewProvidingProtocol {
    var myView: UIView {get set}
}
