//
//  LocationService.swift
//  NYHealthy
//
//  Created by NiYao on 7/19/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit
import CoreLocation

enum LocationServiceClosureType:Int {
    case
    locationServicesNotEnabled,
    authorizationStatusDenied,
    requestServiceError
}

let kLocationServiceQueueLabel = "sunebear.nycode.location.service.concurency.queue"

typealias LocationServiceClosure = (_ type: LocationServiceClosureType) -> ()
typealias LocationServiceDidUpdateLocationsAction = (_ locations: [CLLocation]) -> ()

class LocationService: NSObject, CLLocationManagerDelegate {
    fileprivate static let service = LocationService()
    fileprivate var locationManager: CLLocationManager = CLLocationManager()

    fileprivate static let serviceQueue : DispatchQueue = DispatchQueue(label: kLocationServiceQueueLabel, attributes: DispatchQueue.Attributes.concurrent);
    
    var didUpdateLocationsAction:LocationServiceDidUpdateLocationsAction!
    
    class var commonService: LocationService {
        return service
    }
    
    class var defaultQueue:DispatchQueue {
        return serviceQueue
    }
    override init() {
        
    }
    
    func startLocationServiceFailure(_ failure:LocationServiceClosure?) {
         weak var weakSelf:LocationService! = self
        LocationService.defaultQueue.async { 
            weakSelf.requestLocationServiceFailure(failure)
        }
    }
    
    func requestLocationServiceFailure(_ failure:LocationServiceClosure?) {
        if CLLocationManager.locationServicesEnabled() {
            requestAuthorization(failure)
        } else {
            failure?(LocationServiceClosureType.locationServicesNotEnabled)
        }
    }
    
    func requestAuthorization(_ failure:LocationServiceClosure?) {
        
        switch CLLocationManager.authorizationStatus() {
        case CLAuthorizationStatus.denied:
            DispatchQueue.main.async(execute: { 
                failure?(LocationServiceClosureType.authorizationStatusDenied)
            })
            return;
        case CLAuthorizationStatus.authorizedWhenInUse,
             CLAuthorizationStatus.authorizedAlways:
            setupLocationManager()
        default:
            weak var weakSelf:LocationService! = self
            
            if #available(iOS 8.0, *) {
                if locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) {
                    DispatchQueue.main.async(execute: { 
                        weakSelf.locationManager.requestWhenInUseAuthorization()
                    })
                }
            } else {
                // Fallback on earlier versions
            }
            
        }
        startUpdateLocation()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = CLActivityType.fitness
        locationManager.distanceFilter = 10.0
    }
    
    func startUpdateLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationService() {
        locationManager.stopUpdatingLocation()
    }
    
    func setupDidUpdateLocationsAction(_ closure:@escaping LocationServiceDidUpdateLocationsAction) {
        didUpdateLocationsAction = closure
    }
    
    // MARK: - CLLocationManagerDelegate
    // MARK: - Responding to Location Events
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didUpdateLocationsAction?(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
    }
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
    }
    
    // MARK: - Pausing Location Updates
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    // MARK: - Responding to Heading Events
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }
    
    
}
