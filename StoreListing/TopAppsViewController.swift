//
//  TopAppsViewController.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/21/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "appCell"

class TopAppsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
  
    @IBOutlet var storeCollection: UICollectionView!
    var requestApps = RequestHandler.init()
    var arrayOfAppsInfo = [AppInfo]()

    
    var numberOfItems = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.populateData), name: Notification.Name("dataRecieved"), object: nil)

        requestApps.requestFiftyApps()

        self.title = "Top 50 Apps"
        
        storeCollection.register(StoreCollectionViewCell.nib(), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    @objc func populateData() {
       arrayOfAppsInfo = requestApps.listofarrayOfAppsInfo
        numberOfItems = arrayOfAppsInfo.count
        print(numberOfItems)
        storeCollection.reloadData()
    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems;
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoreCollectionViewCell

        cell.appName.text = arrayOfAppsInfo[indexPath.item].name
        
        DispatchQueue.global(qos: .userInitiated).async {
            let url = NSURL(string: self.arrayOfAppsInfo[indexPath.item].image)
            let imageData:NSData = NSData(contentsOf: url! as URL)!

            
            DispatchQueue.main.async {
                
                let image = UIImage(data: imageData as Data)
                cell.appImage.image = image
                cell.appImage.contentMode = UIViewContentMode.scaleAspectFit
                
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let AppDetails: AppDetailsViewController = AppDetailsViewController(nibName: "AppDetailsViewController", bundle: nil)
        AppDetails.appInformation = arrayOfAppsInfo[indexPath.item]
        self.navigationController?.pushViewController(AppDetails, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
