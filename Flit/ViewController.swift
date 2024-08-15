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
    let gloatingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up location manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // set up cityAndCountryCodeLabel
        cityAndCountryCodeLabel.textAlignment = .center
        cityAndCountryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityAndCountryCodeLabel)
        
        // set up gloatingLabel
        gloatingLabel.textAlignment = .center
        gloatingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gloatingLabel)
        
        NSLayoutConstraint.activate([
            cityAndCountryCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityAndCountryCodeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            cityAndCountryCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityAndCountryCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            gloatingLabel.topAnchor.constraint(equalTo: cityAndCountryCodeLabel.bottomAnchor, constant: 20),
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
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
            
        // Reverse geocode to get the location name
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                let locality = "\(placemark.locality ?? "unknown city")"
                let isoCountryCode = "\(placemark.isoCountryCode ?? "unknown country")"
                DispatchQueue.main.async {
                    self.cityAndCountryCodeLabel.text = "Simulated Location: \(locality), \(isoCountryCode)"
                }
            }
        }
    }
    
}

