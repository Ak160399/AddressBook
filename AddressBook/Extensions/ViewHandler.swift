//
//  ViewHandler.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

extension UIView {
    
    @discardableResult func addTopAnchor(equal: NSLayoutAnchor<NSLayoutYAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }
    
    @discardableResult func addBottomAnchor(equal: NSLayoutAnchor<NSLayoutYAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }
    
    @discardableResult  func addLeftAnchor(equal: NSLayoutAnchor<NSLayoutXAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }
    
    @discardableResult func addRightAnchor(equal: NSLayoutAnchor<NSLayoutXAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }

    @discardableResult func addXCenterAnchor(equal: NSLayoutAnchor<NSLayoutXAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }

    @discardableResult func addYCenterAnchor(equal: NSLayoutAnchor<NSLayoutYAxisAnchor>,constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: equal, constant: constant).isActive = true
        return self
    }

    @discardableResult func addHeightAnchor(constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult func addWidthAnchor(constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
}
