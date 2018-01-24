//
//  RequestHandler.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/21/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestHandler: NSObject {
    var listofarrayOfAppsInfo = [AppInfo]()

    override init() {
        super.init()
    }
    
    func requestFiftyApps()-> [AppInfo] {
        Alamofire.request("https://itunes.apple.com/jo/rss/topfreeapplications/limit=50/json").responseJSON { response in
            if let data = response.data {
              let parser = JsonParser.init(data: data)
                self.listofarrayOfAppsInfo = parser.arrayOfAppsInfo;
                print(self.listofarrayOfAppsInfo.count)
                NotificationCenter.default.post(name: Notification.Name("dataRecieved"), object: nil)

            }

        }
        print(self.listofarrayOfAppsInfo.count)
        return self.listofarrayOfAppsInfo
    }
}
