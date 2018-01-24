//
//  AppInfo.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/23/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class AppInfo: NSObject {
    var name: String = ""
    var image: String = ""
    var appDescription: String = ""
    var price: String = ""
    var category: String = ""
    

    init(aname: String,aimage: String, description: String,aprice: String, acategory: String) {
        name = aname
        image = aimage
        appDescription = description
        price = aprice
        category = acategory
        
    }
    
}
