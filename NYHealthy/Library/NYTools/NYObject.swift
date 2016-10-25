//
//  NYObject.swift
//  NYHealthy
//
//  Created by NiYao on 6/21/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation

extension Array {
    func separateArrayToString() -> String {
        var string:String = ""
        for item in self {
            let str = "," + String(describing: item)
            string.append(str)
        }
        return string
    }
}

extension Dictionary {
    func separateDictionaryToString() -> String {
        var string:String = ""
        for item in self {
            let str = String(describing: item.0) + String(describing: item)
            string.append(str)
        }
        return string
    }
}
