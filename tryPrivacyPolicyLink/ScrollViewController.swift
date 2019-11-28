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
    
    private var textViewDelegate: MyTextViewDelegate!
    private var dropDownDelegate: UITextViewDelegate!
    
    var subviews = [UIView]()
     
    override func viewDidLoad() { super.viewDidLoad()
        
        hookUpDelegates()
        screenWidth = self.view.bounds.width
        
//        insertColorViewAndLabel()
//        insertLabelAndTextFieldView()
//        insertCodeLabelAndTextView()
//        insertCodeLabelAndTextViewDropdown()
//        insertTwoCheckboxGroupViews()
        insertMultipleObjects()
//        insertCodeSingleCheckmarkView()
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
    
        let childView = CodeViewAndLabelFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
//        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
        self.view.addSubview(childView)

    }
    
    private func insertLabelAndTextFieldView() {
        
            let childView = CodeLabelAndTextField(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
    //        childView.update(headlineText: headlineText, inputTxt: inputText, placeholderTxt: placeholderText)
            self.view.addSubview(childView)
            }
    
    private func insertCodeLabelAndTextView() {
    
        let childView = CodeLabelAndTextViewFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: textViewDelegate).myView!
        self.view.addSubview(childView)
    }
    
    private func insertCodeLabelAndTextViewDropdown() {
    
        let childView = CodeLabelAndTextViewDropdownFactory(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth, delegate: self).myView!
        
        childView.tag = 0 // questionId
        
        subviews.append(childView)
        
        self.view.addSubview(childView)
    
    }
    
    private func insertTwoCheckboxGroupViews() {
        
        let checkmarkA = CodeSingleCheckmarkView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkB = CodeSingleCheckmarkView(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkC = CodeSingleCheckmarkView(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkD = CodeSingleCheckmarkView(headlineText: inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkE = CodeSingleCheckmarkView(headlineText: inputText+inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        
        let checkmarksViewABC = CodeVerticalStacker(views: [checkmarkA, checkmarkB, checkmarkC]).myView!
        let checkmarksViewDE = CodeVerticalStacker(views: [checkmarkD, checkmarkE]).myView!

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarksViewDE, checkmarksViewABC]).myView!
        
        self.view.addSubview(multipleCheckbox)
        
    }
    
    
    private func insertMultipleObjects() {
       
        let viewA = CodeLabelAndTextField(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        let viewB = CodeLabelAndTextField(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        
// moras posebne views, ne moze da se isti (viewA, viewB) ubace u novi stackView (viewCD); moraju posebni viewC i viewD !!!
        let viewC = CodeLabelAndTextField(headlineText: largeHeadlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        let viewD = CodeLabelAndTextField(headlineText: headlineText, inputText: largeInputText, placeholderText: placeholderText, width: self.view.bounds.width).myView!
        
        let viewAB = CodeVerticalStacker(views: [viewA, viewB]).myView!
        let viewCD = CodeVerticalStacker(views: [viewC, viewD]).myView!
        
        //let compositeView = CodeVerticalStacker(views: [viewAB, viewCD]).myView!
        let compositeView = UILabel()
        compositeView.numberOfLines = 0
        compositeView.text = largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText + largeHeadlineText

        print("compositeView.frame = \(compositeView.frame)")
        //self.view.addSubview(compositeView)
        //self.view.addSubview(compositeView)
        self.stackView.addArrangedSubview(compositeView)
//
//        print("self.stackView.frame = \(stackView.frame)")
//        print("self.scrollView.frame = \(scrollView.frame)")
//        print("compositeView.frame.AGAIN = \(compositeView.frame)")
        
    }
    
    private func insertCodeSingleCheckmarkView() {
        
        let childView = CodeSingleCheckmarkView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        self.view.addSubview(childView)
    }
    
    private func insertCodeMultipleCheckmarkView() {
        
        let checkmarkA = CodeSingleCheckmarkView(headlineText: headlineText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkB = CodeSingleCheckmarkView(headlineText: inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!
        let checkmarkC = CodeSingleCheckmarkView(headlineText: inputText+inputText+inputText, inputText: inputText, placeholderText: placeholderText, width: screenWidth).myView!

        let multipleCheckbox = CodeVerticalStacker(views: [checkmarkA, checkmarkB, checkmarkC]).myView!
        
        self.view.addSubview(multipleCheckbox)
    }

    private func insertHorizontalLabelTextFieldViews() {
        let viewA = CodeLabelAndTextField(headlineText: "adc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc dsadc ds", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        let viewB = CodeLabelAndTextField(headlineText: "cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let viewC = CodeLabelAndTextField(headlineText: "cds dsx z cdhzdbhz", inputText: "acdzx", placeholderText: "dsc", width: self.view.bounds.width).myView!
        
        let stacker = CodeHorizontalStacker(views: [viewA, viewB, viewC], width: screenWidth).myView!
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
