//
//  CollectionViewcell.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

class AddressCollectionViewCell: UICollectionViewCell {
    private  let containerView = UIView()
    private   let addressLable: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .center
         return label
      }()
      
    private  let coordinatesLabel: UILabel = {
          let lable = UILabel()
          lable.numberOfLines = 0
          return lable
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addcontrainer()
        addAddressLabel()
        addcoorinateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func addcontrainer(){
        contentView.addSubview(containerView)
        containerView.backgroundColor = .primaryRed
        containerView.layer.cornerRadius = 6
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .init(width: 0.0, height: 2.0)
        containerView
        .addTopAnchor(equal: contentView.topAnchor,constant: 10)
        .addBottomAnchor(equal: contentView.bottomAnchor,constant: -10)
        .addLeftAnchor(equal: contentView.leftAnchor,constant: 10)
        .addRightAnchor(equal: contentView.rightAnchor,constant: -10)
    }
    fileprivate func addAddressLabel() {
        containerView.addSubview(addressLable)
        addressLable
        .addTopAnchor(equal: containerView.topAnchor,constant: 15)
        .addLeftAnchor(equal: containerView.leftAnchor,constant: 10)
        .addRightAnchor(equal: containerView.rightAnchor,constant: -10)
    }

    fileprivate func addcoorinateLabel() {
        containerView.addSubview(coordinatesLabel)
        coordinatesLabel
        .addBottomAnchor(equal: containerView.bottomAnchor,constant: -15)
        .addLeftAnchor(equal: containerView.leftAnchor,constant: 10)
        .addRightAnchor(equal: containerView.rightAnchor,constant: -10)
        .addTopAnchor(equal: addressLable.bottomAnchor,constant: 5)
    }
    
}

extension AddressCollectionViewCell {
    
    fileprivate func setAddress(text: String ){
        let fortext = [NSAttributedString.Key.font : UIFont.Helvetica(size: 15, weight: .Bold) ,NSAttributedString.Key.foregroundColor : UIColor.white]
        let titelText = [NSAttributedString.Key.font : UIFont.Helvetica(size: 14, weight: .regular) ,NSAttributedString.Key.foregroundColor : UIColor.mainRed]
        let formate = NSMutableAttributedString()
        formate.append(NSAttributedString(string: "Address \n", attributes: titelText as [NSAttributedString.Key : Any]))
        formate.append(NSAttributedString(string: text, attributes: fortext))
        addressLable.attributedText = formate
      }
    
    fileprivate func setCorrdinate(text: String ){
        let maintext = [NSAttributedString.Key.font : UIFont.Helvetica(size: 12, weight: .regular) ,NSAttributedString.Key.foregroundColor : UIColor.white]
        let titelText = [NSAttributedString.Key.font : UIFont.Helvetica(size: 11, weight: .light) ,NSAttributedString.Key.foregroundColor : UIColor.white]
        let formate = NSMutableAttributedString()
        formate.append(NSAttributedString(string: "Coordinate: ", attributes: titelText as [NSAttributedString.Key : Any]))
        formate.append(NSAttributedString(string: text, attributes: maintext))
        coordinatesLabel.attributedText = formate
      }
    
    func setData(addressBook: AddressBook){
        setCorrdinate(text: " \(addressBook.longitude) , \(addressBook.latitude)")
        setAddress(text: addressBook.address)
    }
    
}
