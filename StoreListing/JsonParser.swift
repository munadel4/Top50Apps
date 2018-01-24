//
//  JsonParser.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/23/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit
import SwiftyJSON


class JsonParser: NSObject {
    
    var arrayOfAppsInfo = [AppInfo]()

    init(data: Data) {
        super.init()
        let _: Bool = parseTop50Apps(data: data)
    }
    
    func parseTop50Apps(data: Data) -> Bool {
        do {
        let json = try JSON(data: data)
        let arrayNames =  json["feed"]["entry"]
            fillApps(arrayapps: arrayNames)
       // print(arrayNames);
        } catch {
            
        }
        return true
    }
    
    func fillApps(arrayapps: JSON) {
        for index in stride(from: 0, to: arrayapps.count, by: 1) {
            
            let appName = arrayapps[index]["im:name"]["label"].stringValue;
            let appImage = arrayapps[index]["im:image"][2]["label"].stringValue
            let appPrice = arrayapps[index]["im:price"]["attributes"]["amount"].stringValue + " USD"
            let appDescription = arrayapps[index]["summary"]["label"].stringValue
            let appCategory = arrayapps[index]["category"]["attributes"]["label"].stringValue

            arrayOfAppsInfo.append(AppInfo(aname: appName, aimage: appImage, description: appDescription, aprice: appPrice, acategory:appCategory))
        }


    }
}
