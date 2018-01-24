//
//  StoreCollectionViewCell.swift
//  StoreListing
//
//  Created by Munadel Qubbaj on 1/21/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var appImage: UIImageView!
    @IBOutlet var appName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class func nib() -> UINib
    {
        return UINib(nibName: "StoreCollectionViewCell", bundle: nil)
    }
}
