//
//  NYSQLite.swift
//  NYHealthy
//
//  Created by NiYao on 6/21/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import Foundation

let DEFAULT_DATABASE_NAME = "NYSQLite.sqlite3"
/*
 INSERT INTO table_name (列1, 列2,...) VALUES (值1, 值2,....)
 DELETE FROM 表名称 WHERE 列名称 = 值
 UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
 SELECT 列名称 FROM 表名称 WHERE 列 运算符 值
 CREATE TABLE IF NOT EXISTS PERSIONINFO(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE INTEGER, SEX TEXT, WEIGHT INTEGER, ADDRESS TEXT)
 */
class NYSQLite {
    fileprivate var database:OpaquePointer? = nil /**< sqlite pointer */
    class func databasePath() -> String {
        return NSHomeDirectory() + "/Documents/" + DEFAULT_DATABASE_NAME
    }
    
    init () {
        
    }
    
    deinit {
        NYSQLite.closeDatabase(self.database!)
    }
    
    class func openDatabase(_ databaseName:String = DEFAULT_DATABASE_NAME, competion:(_ opened:Bool) -> ()) {
        var database:OpaquePointer = NYSQLite().database!
        if sqlite3_open(self.databasePath(), &database) != SQLITE_OK {
            NYSQLite.closeDatabase(database)
            assert(false, "Open Database Failed at : \n" + self.databasePath())
            competion(false)
        } else {
            competion(true)
        }
    }
    
    class func closeDatabase(_ database:OpaquePointer) {
        sqlite3_close(database)
    }
    
    fileprivate func executeSQL(_ SQL:String) {
        
    }
    
    func createTable(_ tableName:String, columns:Dictionary<String,AnyObject>) {
       
    }
    
    func insert(_ values:Array<AnyObject>, columns:Array<String>, table:String) {
      
    }
}
