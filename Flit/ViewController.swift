//
//  ViewController.swift
//  GPesz
//
//  Created by Rhodri Thomas on 7/23/24.
//

import UIKit
import CoreLocation
import MapKit

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
        
        // set up gpsLongitudeLabel
        gpsLongitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsLongitudeLabel)
        
        // set up gpsTimeStampLabel
        gpsTimeStampLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsTimeStampLabel)
        
        // set up gpsRadiusOfUncertaintyHorizontalLabel
        gpsRadiusOfUncertaintyHorizontalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsRadiusOfUncertaintyHorizontalLabel)
        
        // set up gpsRadiusOfUncertaintyVerticalLabel
        gpsRadiusOfUncertaintyVerticalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsRadiusOfUncertaintyVerticalLabel)
        
        // set up gpsAltitudeLabel
        gpsAltitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsAltitudeLabel)
        
        // set up gpsLogicalFloorOfBuildingLabel
        gpsLogicalFloorOfBuildingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsLogicalFloorOfBuildingLabel)
        
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
        
    }
    
    
    func calculateDirections(to destination: CLLocationCoordinate2D) {
        // source, destination, MKMapItem, MKDirectionsRequest
        let request = MKDirections.Request()
        let source = MKMapItem.forCurrentLocation()
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        request.source = source
        request.destination = destinationItem
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { (response: MKDirections.Response?, error: Error?) in
            if let error = error {
                print("Error calculating directions: \(error)")
                return
            }
            
            guard let response = response else {
                print("No directions found")
                return
            }
            
            // Handling the first route in the response
            if let route = response.routes.first {
                print("Rounte name: \(route.name)")
                print("Distance: \(route.distance) meters")
                print("Expected travel time: \(route.expectedTravelTime) seconds")
                
                // Loop through each step in the route
                var stepCount = 1
                for step in route.steps {
                    print("\(stepCount): \(step.instructions)")
                    print("    Distance: \(step.distance) meters")
                    stepCount += 1
                }
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        // Create CLLocationCoordinate2D for later use
        let destinationCoordinates = CLLocationCoordinate2D(latitude: 36.07237298738563, longitude: -94.00386585452026)
            
        // Reverse geocode to get the location name
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                // prep info for cityAndCountryCodeLabel
                let locality = "\(placemark.locality ?? "unknown city")"
                let isoCountryCode = "\(placemark.isoCountryCode ?? "unknown country")"
                
                // prep info for gps labels
                let gpsLatitude = placemark.location?.coordinate.latitude ?? 000000
                let gpsLongitude = placemark.location?.coordinate.longitude ?? 0000000
                let gpsTimeStamp = placemark.location?.timestamp ?? Date(timeIntervalSince1970: 0)
                let gpsRadiusOfUncertaintyHorizontal = placemark.location?.horizontalAccuracy ?? 000000
                let gpsRadiusOfUncertaintyVertical = placemark.location?.verticalAccuracy ?? 000000
                let gpsAltitude = placemark.location?.altitude ?? 000000
                let gpsLogicalFloorOfBuilding = placemark.location?.floor ?? CLFloor()
                
                DispatchQueue.main.async {
                    self.cityAndCountryCodeLabel.text = "Location: \(locality), \(isoCountryCode)"
                    self.gpsLatitudeLabel.text = "Latitude: \(gpsLatitude)"
                    self.gpsLongitudeLabel.text = "Longitude: \(gpsLongitude)"
                    self.gpsTimeStampLabel.text = "TimeStamp: \(gpsTimeStamp)"
                    self.gpsRadiusOfUncertaintyHorizontalLabel.text = "Uncertainty (H) \(gpsRadiusOfUncertaintyHorizontal)"
                    self.gpsRadiusOfUncertaintyVerticalLabel.text = "Uncertainty (V) \(gpsRadiusOfUncertaintyVertical)"
                    self.gpsAltitudeLabel.text = "Altitude: \(gpsAltitude)"
                    self.gpsLogicalFloorOfBuildingLabel.text = "Logical Floor: \(gpsLogicalFloorOfBuilding.level)"
                }
            }
        }
        
        calculateDirections(to: destinationCoordinates)
    }
}

