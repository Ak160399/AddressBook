//
//  MapViewController.swift
//  AddressBook
//
//  Created by Arpit Singh on 16/05/21.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController {
    
    lazy var mapView = MKMapView(frame: view.frame)
    let locationManager = CLLocationManager()
    var bufferLoaction: CLLocationCoordinate2D?
    let myAnnotation: MKPointAnnotation = MKPointAnnotation()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.addSubview(mapView)
        locationManager.delegate = self
        mapView.delegate = self
    }
    
    fileprivate func showDeniedAlert() {
        let alert = UIAlertController(title: "GPS Permission denied", message: "please enable the access of your gps location from setting > Addressbook > Location", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            self.tabBarController?.selectedIndex = 1
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func checkForpermission() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse,.authorizedAlways :
            guard let currentLoction = locationManager.location else { return  }
            setMapIntialPoints(currentLocation: currentLoction)
            break
        case .notDetermined :
            locationManager.requestAlwaysAuthorization()
            break
        case .denied:
            showDeniedAlert()
            break
        case .restricted:
            showDeniedAlert()
            break
        @unknown default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func setMapIntialPoints(currentLocation: CLLocation) {
        mapView.showsScale = true
        mapView.isPitchEnabled = true
        mapView.showsCompass = true
        mapView.setCenter(currentLocation.coordinate, animated: true)
        mapView.camera.centerCoordinateDistance = 3000
        myAnnotation.coordinate = currentLocation.coordinate
        bufferLoaction? = currentLocation.coordinate
        myAnnotation.title = "Current Location"
        mapView.addAnnotation(myAnnotation)
        getTheAddress(point: currentLocation.coordinate)
    }
    
}
 //MARK:- Location Manager Delegate
extension MapViewController : CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkForpermission()
    }
}
//MARK:- Map Delegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView,viewFor annotation: MKAnnotation) -> MKAnnotationView? {
             let pinAnnotationView = MKPinAnnotationView(annotation: myAnnotation, reuseIdentifier: "PinDrop")
             pinAnnotationView.isDraggable = true
             pinAnnotationView.canShowCallout = true
             pinAnnotationView.animatesDrop = true
             return pinAnnotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let point = view.annotation?.coordinate,
              bufferLoaction?.latitude != point.latitude,
              bufferLoaction?.longitude != point.longitude
              else { return }
        bufferLoaction = point
        getTheAddress(point: point)
    }
    
    fileprivate func showErrorMessage(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //TODO:- Refactoring required
    fileprivate func getTheAddress(point: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: point.latitude, longitude: point.longitude)
        geocoder.reverseGeocodeLocation(location) { landmarks, error in
            if error != nil {
                self.showErrorMessage(error)
                return
            }

            if let landmark = landmarks?.first {
                // need to run in main thread for making UI Changes
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                let address = self.addressBuilder(landmark: landmark)
                self.myAnnotation.title = "Address"
                self.myAnnotation.subtitle = address
                let addressBook = AddressBook(address: address, latitude: point.latitude.magnitude, longitude: point.longitude.magnitude)
                ValueBroadCaster.shared.addToAddressbook(address: addressBook)
                }
            }
        }
    }
    
    fileprivate func addressBuilder(landmark: CLPlacemark) -> String {
        var address = ""
        if let name = landmark.name {
            address += name
        }
        if let streetname = landmark.thoroughfare {
            address += " \(streetname)"
        }
        if let streetnumber = landmark.subThoroughfare {
            address += " \(streetnumber)"
        }
        if let locailty = landmark.locality {
            address += " \(locailty)"
        }
        if let  district = landmark.subAdministrativeArea  {
            address += " \(district)"
        }
        if let pinCode = landmark.postalCode {
            address += " \(pinCode)"
        }
        if let country = landmark.country {
            address += " \(country)"
        }
       return address
    }
    
}



