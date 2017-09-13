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
        _ = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.104532, 129.123774), title:"부산시민공원",subtitle:"부산 시민 공원")
        _ = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.109237, 129.12652), title: "동의과학대학", subtitle: "동의과학대학교")
        
        myMap.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func zoomToRegion(){
        let location = CLLocationCoordinate2D(latitude: 35.118002, longitude: 129.121017)
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMap.setRegion(region, animated: true)
    }


}

