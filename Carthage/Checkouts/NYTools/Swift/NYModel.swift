//
//  NYModel.swift
//  NYHealthy
//
//  Created by NiYao on 5/20/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation

extension NSObject {
    
    class func getClassPropertyNames() -> Array<String> {
        var properties: Array<String> = []
        var count: u_int = 0
        let propertyList = class_copyPropertyList(self, &count)
        
        var i = 0
        while i < Int(count) {
            let propertyName = property_getName(propertyList[i])
            let nameString = NSString(UTF8String: propertyName) as! String
            properties.append(nameString)
            i += 1
        }
        return properties
    }
    
    class func objectWithDictionary(dictionary: Dictionary<String, AnyObject>) -> AnyObject {
        let objectWithDictionary = self.init()
        let propertyMapper = self.propertyMapper() as NSDictionary
        
        for key in dictionary.keys {
           let modelKey = ((propertyMapper.valueForKey(key)) != nil) ? propertyMapper.valueForKey(key) : key
            objectWithDictionary.setValue((dictionary as NSDictionary).objectForKey(key), forKey: modelKey as! String)
        }
        return objectWithDictionary
    }
    
    class func propertyMapper() -> Dictionary<String, AnyClass> {
        return [:]
    }
    
    func dictionary() -> Dictionary<String, AnyObject> {
        var dictionary: Dictionary<String, AnyObject> = [:]
        let allProperties = self.classForCoder.getClassPropertyNames()
        var i = 0
        while i < allProperties.count {
            dictionary[allProperties[i]] = self.valueForKey(allProperties[i])
            i += 1
        }
        return dictionary
    }
}