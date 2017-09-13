//
//  ViewController.swift
//  03-mulitPin
//
//  Created by D7702_10 on 2017. 9. 13..
//  Copyright © 2017년 D7702_10. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        zoomToRegion()
        
        let a = ViewPoint(coordinate: CLLocationCoordinate2D(latitude:35.168444,longitude:129.057832), title:"부산시민공원",subtitle:"시민들의 공원")
        let b = ViewPoint(coordinate: CLLocationCoordinate2D(latitude:35.166197,longitude:129.072594), title: "동의과학대학", subtitle: "동의인")
        myMap.addAnnotations([a,b])

        myMap.delegate = self

        
    }

    func zoomToRegion(){
        let location = CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594)
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMap.setRegion(region, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myPin"
        
        // an already allocated annotation view
        var annotationView = myMap.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.pinTintColor = UIColor.green
            annotationView?.animatesDrop = true
        } else {
            annotationView?.annotation = annotation
        }
        

        return annotationView
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        
        
        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }


}

