//
//  RunningTrackViewController.swift
//  NYHealthy
//
//  Created by NiYao on 7/18/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import HealthKit

class RunningTrackViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let mapViewModel:RunningTrackMapViewModel = RunningTrackMapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationAction()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupMapView() {
        weak var weakSelf:RunningTrackViewController! = self
        mapView.delegate = mapViewModel
        mapViewModel.setupMapViewAppearance(mapView)
        mapViewModel.setupDidUpdateUserLocationAction { (userLocation) in
            weakSelf.mapViewModel.locations.append(userLocation.location!)
        }
    }
    
    fileprivate func setupLocationAction() {
        weak var weakSelf:RunningTrackViewController! = self
        LocationService.commonService.startUpdateLocation()
        LocationService.commonService.setupDidUpdateLocationsAction { (locations) in
            weakSelf.mapViewModel.drawRoute(locations, mapView: weakSelf.mapView)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
