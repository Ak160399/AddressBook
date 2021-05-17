//
//  ColllectionViewController.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

class CollectionViewController: UIViewController {
   
    private let cellID = "AddressBookCellID"
    lazy var collectionView : UICollectionView = {
       let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
       collection.backgroundColor = .secondaryRed
       return collection
    }()
    // Dummy data
    var addressList = [AddressBook(address: "nice to have you mate", latitude: 30004.5,longitude: 222222)] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AddressCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let list = ValueBroadCaster.shared.getAddressList()
        if list.count > 0 {
            addressList = list
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
          super.viewWillTransition(to: size, with: coordinator)
          collectionView.reloadData()
      }
    
}
//MARK:- Collection view DataSource , delegate
extension CollectionViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? AddressCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setData(addressBook: addressList[indexPath.item])
        return cell
    }
    
    //TODO:- Refactoring required
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemValue = addressList[indexPath.item]
        let width = view.frame.width / 2 - 10
        let availableSize = CGSize(width: width - 40, height: 1000)
        // height need for address
        var height = NSString(string: itemValue.address).boundingRect(with: availableSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.Helvetica(size: 15, weight: .Bold)], context: .none).height
        // add height need for corridnates
        let cooridnates = " \(itemValue.latitude) , \(itemValue.longitude)"
        height += NSString(string: cooridnates).boundingRect(with: availableSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.Helvetica(size: 12, weight: .regular)], context: .none).height
        //add height need for constaint padding
        height += 90
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 35, left: 5, bottom: 0, right: 5)
    }
    
}
