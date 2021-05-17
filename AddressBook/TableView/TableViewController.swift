//
//  TableViewController.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit

class TableViewController: UIViewController {
        
    lazy var tabelView = UITableView(frame: view.frame)
    private let cellID = "AddressBookCellID"
    // Dummy data
    var addressList = [AddressBook(address: "nice to have you mate",latitude: 0.0,longitude: 0.7)] {
        didSet {
            tabelView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.addSubview(tabelView)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.backgroundColor = .secondaryRed
        tabelView.separatorStyle = .none
        tabelView.register(AddressTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let list = ValueBroadCaster.shared.getAddressList()
        if list.count > 0 {
            addressList = list
        }
    }
}
//MARK:- Table View DataSource and Delegate
extension TableViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AddressTableViewCell
        else { return UITableViewCell() }
        cell.setData(addressBook: addressList[indexPath.row])
        return cell
    }
    
 
}
