//
//  ViewController.swift
//  GPesz
//
//  Created by Rhodri Thomas on 7/23/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let cityAndCountryCodeLabel = UILabel()
    let gpsLatitudeLabel = UILabel()
    let gpsLongitudeLabel = UILabel()
    let gpsTimeStampLabel = UILabel()
    let gpsRadiusOfUncertaintyVerticalLabel = UILabel()
    let gpsRadiusOfUncertaintyHorizontalLabel = UILabel()
    let gpsAltitudeLabel = UILabel()
    let gpsLogicalFloorOfBuildingLabel = UILabel()
    
    let gloatingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up location manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 50.0
        
        // set up cityAndCountryCodeLabel
        cityAndCountryCodeLabel.textAlignment = .center
        cityAndCountryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityAndCountryCodeLabel)
        
        // set up gpsLatitudeLabel
        gpsLatitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsLatitudeLabel)
        gpsLatitudeLabel.text = "Latitude: 000000000000"
        
        // set up gpsLongitudeLabel
        gpsLongitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsLongitudeLabel)
        gpsLongitudeLabel.text = "Longitude: 000000000000"
        
        // set up gpsTimeStampLabel
        gpsTimeStampLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsTimeStampLabel)
        gpsTimeStampLabel.text = "Updated: arstneio"
        
        // set up gpsRadiusOfUncertaintyHorizontalLabel
        gpsRadiusOfUncertaintyHorizontalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsRadiusOfUncertaintyHorizontalLabel)
        gpsRadiusOfUncertaintyHorizontalLabel.text = "Uncertainty (H): arstneio"
        
        // set up gpsRadiusOfUncertaintyVerticalLabel
        gpsRadiusOfUncertaintyVerticalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsRadiusOfUncertaintyVerticalLabel)
        gpsRadiusOfUncertaintyVerticalLabel.text = "Uncertainty (V): arstneio"
        
        // set up gpsAltitudeLabel
        gpsAltitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsAltitudeLabel)
        gpsAltitudeLabel.text = "Altitude(m): some Meters"
        
        // set up gpsLogicalFloorOfBuildingLabel
        gpsLogicalFloorOfBuildingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsLogicalFloorOfBuildingLabel)
        gpsLogicalFloorOfBuildingLabel.text = "Logical Floor: 34"
        
        // set up gloatingLabel
        gloatingLabel.textAlignment = .center
        gloatingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gloatingLabel)
        
        NSLayoutConstraint.activate([
            cityAndCountryCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityAndCountryCodeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -105),
            cityAndCountryCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityAndCountryCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsLatitudeLabel.topAnchor.constraint(equalTo: cityAndCountryCodeLabel.bottomAnchor, constant: 20),
            gpsLatitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsLatitudeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsLongitudeLabel.topAnchor.constraint(equalTo: gpsLatitudeLabel.bottomAnchor, constant: 1),
            gpsLongitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsLongitudeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsTimeStampLabel.topAnchor.constraint(equalTo: gpsLongitudeLabel.bottomAnchor, constant: 1),
            gpsTimeStampLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsTimeStampLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsRadiusOfUncertaintyHorizontalLabel.topAnchor.constraint(equalTo: gpsTimeStampLabel.bottomAnchor, constant: 1),
            gpsRadiusOfUncertaintyHorizontalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsRadiusOfUncertaintyHorizontalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsRadiusOfUncertaintyVerticalLabel.topAnchor.constraint(equalTo: gpsRadiusOfUncertaintyHorizontalLabel.bottomAnchor, constant: 1),
            gpsRadiusOfUncertaintyVerticalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsRadiusOfUncertaintyVerticalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsAltitudeLabel.topAnchor.constraint(equalTo: gpsRadiusOfUncertaintyVerticalLabel.bottomAnchor, constant: 1),
            gpsAltitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsAltitudeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gpsLogicalFloorOfBuildingLabel.topAnchor.constraint(equalTo: gpsAltitudeLabel.bottomAnchor, constant: 1),
            gpsLogicalFloorOfBuildingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gpsLogicalFloorOfBuildingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            gloatingLabel.topAnchor.constraint(equalTo: gpsLogicalFloorOfBuildingLabel.bottomAnchor, constant: 20),
            gloatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gloatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let messageText = "hehe yeah fuck Tim Apple"
        let attributedText = NSMutableAttributedString(string: messageText)
        if let range = messageText.range(of: "fuck") {
            let nsRange = NSRange(range, in: messageText)
            attributedText.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: gloatingLabel.font.pointSize), range: nsRange)
        }
        gloatingLabel.attributedText = attributedText
        
        gpsLatitudeLabel.text = "Latitude: 000000000000"
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
            
        // Reverse geocode to get the location name
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                // prep info for cityAndCountryCodeLabel
                let locality = "\(placemark.locality ?? "unknown city")"
                let isoCountryCode = "\(placemark.isoCountryCode ?? "unknown country")"
                
                // prep info for gps labels
                let gpsLatitude = placemark.location?.coordinate.latitude
                let gpsLongitude = placemark.location?.coordinate.longitude
                let gpsTimeStamp = placemark.location?.timestamp
                let gpsAltitude = placemark.location?.altitude
                let gpsRadiusOfUncertaintyVertical = placemark.location?.verticalAccuracy
                let gpsRadiusOfUncertaintyHorizontal = placemark.location?.horizontalAccuracy
                let gpsLogicalFloorOfBuilding = placemark.location?.floor
                
                DispatchQueue.main.async {
                    self.cityAndCountryCodeLabel.text = "Simulated Location: \(locality), \(isoCountryCode)"
                }
            }
        }
    }
    
}

