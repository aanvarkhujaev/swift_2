//
//  PhotosCollectionViewCell.swift
//  VK_App
//
//  Created by Akbar on 3/16/21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
