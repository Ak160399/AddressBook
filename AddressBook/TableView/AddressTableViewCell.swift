//
//  TabelViewCell.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
  private  let containerView = UIView()
  private   let addressLable: UILabel = {
       let address = UILabel()
      address.numberOfLines = 0
       return address
    }()
    
  private  let coordinatesLabel: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = UIFont.Helvetica(size: 11, weight: .light)
        return lable
    }()
    
  private  let icons: UIImageView = {
        let image = UIImageView()
        image.tintColor = .mainRed
        image.image = UIImage.init(systemName: "location.fill")
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addcontrainer()
        addicon()
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
        containerView
        .addTopAnchor(equal: contentView.topAnchor,constant: 10)
        .addBottomAnchor(equal: contentView.bottomAnchor,constant: -10)
        .addLeftAnchor(equal: contentView.leftAnchor,constant: 10)
        .addRightAnchor(equal: contentView.rightAnchor,constant: -10)
    }
    
    
    fileprivate func addicon() {
        containerView.addSubview(icons)
        icons
        .addTopAnchor(equal: containerView.topAnchor,constant: 15)
        .addRightAnchor(equal: containerView.rightAnchor,constant: -15)
        .addHeightAnchor(constant: 30)
        .addWidthAnchor(constant: 30)
    }
    
    fileprivate func addAddressLabel() {
        containerView.addSubview(addressLable)
        addressLable
        .addTopAnchor(equal: containerView.topAnchor,constant: 15)
        .addLeftAnchor(equal: containerView.leftAnchor,constant: 15)
        .addRightAnchor(equal: icons.leftAnchor,constant: -5)
    }

    fileprivate func addcoorinateLabel() {
        containerView.addSubview(coordinatesLabel)
        coordinatesLabel
        .addBottomAnchor(equal: containerView.bottomAnchor,constant: -15)
        .addLeftAnchor(equal: containerView.leftAnchor,constant: 15)
        .addRightAnchor(equal: containerView.rightAnchor,constant: -5)
        .addTopAnchor(equal: addressLable.bottomAnchor,constant: 5)
    }

}

extension AddressTableViewCell {
    fileprivate func setAddress(text: String ){
        let fortext = [NSAttributedString.Key.font : UIFont.Helvetica(size: 15, weight: .Bold) ,NSAttributedString.Key.foregroundColor : UIColor.white]
        let titelText = [NSAttributedString.Key.font : UIFont.Helvetica(size: 14, weight: .regular) ,NSAttributedString.Key.foregroundColor : UIColor.white]
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
