//
//  NewsPostCellViewCell.swift
//  VK_App
//
//  Created by Akbar on 3/25/21.
//

import UIKit

class NewsPostCellViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: LikeButton!
    @IBOutlet weak var shareButton: LikeButton!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var viewAmount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
