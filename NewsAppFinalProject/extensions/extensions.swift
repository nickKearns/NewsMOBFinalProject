//
//  extensions.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/13/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit


//Taken from a medium article
//https://medium.com/@nimjea/custom-label-effects-in-swift-4-69ec12ba2178
extension UILabel{
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -2.0,
            NSAttributedString.Key.font : font ?? UIFont.systemFontSize
            ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(   NSAttributedString.Key.underlineStyle,
                                             value: NSUnderlineStyle.single.rawValue,
                                             range: NSRange(location: 0,
                                                            length: attributedString.length))
            attributedText = attributedString
        }
    }
}
