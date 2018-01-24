//
//  AppDetailsViewController.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/24/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController {

    @IBOutlet var appCategory: UILabel!
    @IBOutlet var appName: UILabel!
    @IBOutlet var appPrice: UILabel!
    @IBOutlet var appDescription: UITextView!
    
    var appInformation: AppInfo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appCategory.text = appInformation?.category
        appName.text = appInformation?.name
        appPrice.text = appInformation?.price
        appDescription.text = appInformation?.appDescription

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
