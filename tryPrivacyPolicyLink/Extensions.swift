//
//  Extensions.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 09/06/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

//extension UITextView {
//
//    func hyperLink(originalText: String, hyperLink: String, urlString: String) {
//
//        let style = NSMutableParagraphStyle()
//        style.alignment = .justified
//
//        let attributedOriginalText = NSMutableAttributedString(string: originalText)
//        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
//        let fullRange = NSMakeRange(0, attributedOriginalText.length)
//
//        attributedOriginalText.addAttribute(.link, value: urlString, range: linkRange)
//        attributedOriginalText.addAttribute(.paragraphStyle, value: style, range: fullRange)
//        attributedOriginalText.addAttribute(.foregroundColor, value: UIColor.black, range: fullRange)
//        attributedOriginalText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
//
//        self.linkTextAttributes = [
//            NSAttributedString.Key.foregroundColor : UIColor.blue,
//            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
//            ]
//
//        self.attributedText = attributedOriginalText
//    }
//
//}

extension UITextView {
    
//    func hyperLink(originalText: String, hyperLink: String, urlString: String) {
//
//        let style = NSMutableParagraphStyle()
//        style.alignment = .justified
//
//        let attributedOriginalText = NSMutableAttributedString(string: originalText)
//        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
//        let fullRange = NSMakeRange(0, attributedOriginalText.length)
//
//        attributedOriginalText.addAttribute(.link, value: urlString, range: linkRange)
//        attributedOriginalText.addAttribute(.paragraphStyle, value: style, range: fullRange)
//        attributedOriginalText.addAttribute(.foregroundColor, value: UIColor.black, range: fullRange)
//        attributedOriginalText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
//
//        self.linkTextAttributes = [
//            NSAttributedString.Key.foregroundColor : UIColor.blue,
//            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
//        ]
//
//        self.attributedText = attributedOriginalText
//    }
    
    func hyperLink(originalText: String, hyperLinkFirst: String, urlStringFirst: String,
                                         hyperLinkSecond: String, urlStringSecond: String) {
        
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        let linkRangeFirst = attributedOriginalText.mutableString.range(of: hyperLinkFirst)
        let linkRangeSecond = attributedOriginalText.mutableString.range(of: hyperLinkSecond)
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
        
        attributedOriginalText.addAttribute(.link, value: urlStringFirst, range: linkRangeFirst)
        attributedOriginalText.addAttribute(.link, value: urlStringSecond, range: linkRangeSecond)
        
        attributedOriginalText.addAttribute(.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(.foregroundColor, value: UIColor.black, range: fullRange)
        attributedOriginalText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        
        self.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
        ]
        
        self.attributedText = attributedOriginalText
    }
    
}




//UITextView * textTerm = [UITextView new];
//NSMutableAttributedString *attrRight = [[NSMutableAttributedString alloc] initWithString:@"Terms of Service"
//    attributes:@{ NSLinkAttributeName: [NSURL URLWithString:@"http://www.google.com"] }];
//NSMutableAttributedString *attrLeft = [[NSMutableAttributedString alloc] initWithString:@"Privacy Policy"
//    attributes:@{ NSLinkAttributeName: [NSURL URLWithString:@"http://www.google.com"] }];
//[attrRight appendAttributedString:attrLeft];
//textTerm.attributedText = attrRight;
//textTerm.editable = NO;
//textTerm.dataDetectorTypes = UIDataDetectorTypeAll;
//textTerm.linkTextAttributes = [UIColor whiteColor];
//textTerm.backgroundColor = [UIColor clearColor];
