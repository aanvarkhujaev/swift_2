//
//  FriendTableViewCell.swift
//  VK_App
//
//  Created by Akbar on 3/23/21.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBInspectable var showDisclosureArrow: Bool = false {
        didSet {
            if showDisclosureArrow {
                accessoryType = .disclosureIndicator
            } else {
                accessoryType = .none
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        showDisclosureArrow = false
    }
    
}
