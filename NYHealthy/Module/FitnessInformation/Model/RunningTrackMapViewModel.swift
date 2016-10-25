//
//  RunningTrackMapViewModel.swift
//  NYHealthy
//
//  Created by NiYao on 7/19/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit
import MapKit

class RunningTrackMapViewModel: NSObject, MKMapViewDelegate {
    
    var locations:[CLLocation] = []
    var distance = 0.0
    
    typealias MapViewDidUpdateUserLocation = (_ userLocation: MKUserLocation) -> ()
    fileprivate var didUpdateUserLocationAction:MapViewDidUpdateUserLocation?
    
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
      
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
       
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        didUpdateUserLocationAction?(userLocation)
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 3
        return renderer
    }
    
    // MARK: - Public Method
    
    func setupDidUpdateUserLocationAction(_ action: @escaping MapViewDidUpdateUserLocation) {
        didUpdateUserLocationAction = action
    }
    
    func setupMapViewAppearance(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.follow
    }
    
    func drawRoute(_ locations: [CLLocation], mapView: MKMapView) {
        for location in locations {
            let howRecent = location.timestamp.timeIntervalSinceNow
            
            if abs(howRecent) < 10 && location.horizontalAccuracy < 20 {
                //update distance
                if self.locations.count > 0 {
                    distance += location.distance(from: self.locations.last!)
                    
                    var coords = [CLLocationCoordinate2D]()
                    coords.append(self.locations.last!.coordinate)
                    coords.append(location.coordinate)
                    
                    let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500)
                    mapView.setRegion(region, animated: true)
                    
                    mapView.add(MKPolyline(coordinates: &coords, count: coords.count))
                }
                
                //save location
                self.locations.append(location)
            }
        }
    }
}
