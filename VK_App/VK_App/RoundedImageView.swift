//
//  RoundedImageView.swift
//  VK_App
//
//  Created by Akbar on 3/16/21.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
  
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.masksToBounds = cornerRadius > 0
            layer.cornerRadius = cornerRadius
        }
    }
}
