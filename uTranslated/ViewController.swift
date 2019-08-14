//
//  ViewController.swift
//  uTranslated
//
//  Created by Haitong Yu on 2019/8/12.
//  Copyright © 2019 Haitong Yu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollLength: NSLayoutConstraint!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var detailsContext: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Build the annotation
        let location = CLLocation(latitude: 40.174253, longitude: -80.2429343)
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 3000,
                                        longitudinalMeters: 3000)
        mapView.setRegion(region, animated: true)
        let objectAnnotation = MKPointAnnotation()
        //Set the coordinate, title, and the subtitle
        objectAnnotation.coordinate = location.coordinate
        objectAnnotation.title = "Frazier-Simplex, Inc"
        objectAnnotation.subtitle = "436 E. Beau St. Washington, PA 15301"
        mapView.addAnnotation(objectAnnotation)
        
        // Do the adaptation for supporting vertical (portrait) view as well as horizontal (landscape) view 
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)

    }
    
    @objc func didChangeOrientation() {
        if (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight) {
            scrollLength.constant = 550
        } else {
            scrollLength.constant = 250
        }
    }

}

