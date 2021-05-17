//
//  Fontbook.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

extension UIFont {
    enum HelveticaWeight {
        case Bold,regular,light
    }
    
    static func Helvetica(size: CGFloat,weight: HelveticaWeight) -> UIFont {
    switch weight {
    case .Bold: do {
        guard let font = UIFont(name: "Helvetica-Bold", size: size) else {return UIFont.systemFont(ofSize: size, weight: .bold) }
                        return font
                   }
    case .regular : do {
        guard let font = UIFont(name: "Helvetica", size: size) else {return UIFont.systemFont(ofSize: size) }
                        return font

        }
     case .light : do {
        guard let font = UIFont(name: "Helvetica-Light", size: size) else {return UIFont.systemFont(ofSize: size) }
                        return font

        }
     }
   }
}
