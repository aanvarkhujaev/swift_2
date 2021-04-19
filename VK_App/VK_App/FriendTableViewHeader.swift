//
//  FriendTableViewHeader.swift
//  VK_App
//
//  Created by Akbar on 3/23/21.
//

import UIKit

class FriendTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let colorView = GradientView()
        colorView.backgroundColor = .systemBackground
        backgroundView = colorView
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

}
