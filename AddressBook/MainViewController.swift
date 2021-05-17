//
//  ViewController.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit
import SwiftUI
class MainViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }

    fileprivate func extractedFunc() {
        // Do any additional setup after loading the view.
        tabBar.isTranslucent = true
        tabBar.barTintColor = .primaryRed
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .mainRed
        viewControllers = [makeMapViewController(),makeTabelViewController(),makeCollectionViewController()]
    }
        
   fileprivate func makeMapViewController() -> MapViewController {
        let mapviewController = MapViewController()
        mapviewController.tabBarItem = UITabBarItem(title: "Map", image: UIImage.init(systemName: "map.fill"), tag: 0)
        return mapviewController
    }
    
   fileprivate func makeTabelViewController() -> TableViewController {
        let tableviewController = TableViewController()
        tableviewController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.dash"), tag: 1)
        return tableviewController
    }
    
   fileprivate func makeCollectionViewController() -> CollectionViewController {
        let collectionviewController = CollectionViewController()
        collectionviewController.tabBarItem = UITabBarItem(title: "Address", image: UIImage.init(systemName: "book.fill"), tag: 2)
        return collectionviewController
    }
    
    
}

struct prieview : PreviewProvider {
    
    static var previews: some View {
        Group {
            ViewControllerRepresentation()
                
                
        }
      }
    
    struct ViewControllerRepresentation: UIViewControllerRepresentable {

      func makeUIViewController(
        context: UIViewControllerRepresentableContext
        <ViewControllerRepresentation>) -> MainViewController {
               return MainViewController()
      }

      func updateUIViewController(_ uiViewController: MainViewController,
        context: UIViewControllerRepresentableContext
        <ViewControllerRepresentation>) {

      }

    }
}
