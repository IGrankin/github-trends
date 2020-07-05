//
//  RepositoryCell.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RepositoryCell: UICollectionViewCell {
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var repoNameLabel: UILabel!
    @IBOutlet var repoAuthorLabel: UILabel!
    @IBOutlet var repoDescLabel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            layer.cornerRadius = 8;
            layer.masksToBounds = true;
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
    //        postPhotoImageView.image = nil
    //        mediaLogoImageView.image = nil
        }
}
