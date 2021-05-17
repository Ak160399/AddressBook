//
//  ValueBroadCaster.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import Foundation
class ValueBroadCaster {
  public static let shared = ValueBroadCaster()
  private var addressList = [AddressBook]()

    func addToAddressbook(address: AddressBook)  {
        addressList.append(address)
    }
        
    func getAddressList() -> [AddressBook] {
        return addressList
    }
}
