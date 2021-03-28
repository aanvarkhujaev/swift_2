//
//  ImageWithShadow.swift
//  VK_App
//
//  Created by Akbar on 3/16/21.
//

import UIKit

    class ImageWithShadow: UIView {
        @IBInspectable var shadowColor: UIColor = .black {
            didSet {
                layer.shadowColor = shadowColor.cgColor
            }
        }
        
        @IBInspectable var shadowOpacity: Float = 0.5 {
            didSet {
                layer.shadowOpacity = shadowOpacity
            }
        }
        
        @IBInspectable var shadowRadius: CGFloat = 8 {
            didSet {
                layer.shadowRadius = shadowRadius
            }
        }
        
        @IBInspectable var shadowOffset: CGSize = .zero {
            didSet {
                layer.shadowOffset = shadowOffset
            }
        }
        
        @IBInspectable var image: UIImage? = nil {
            didSet {
        imageView.image = image
            }
        }
        
        
          @IBInspectable var cornerRadius: CGFloat = 0 {
              didSet{
                imageView.layer.masksToBounds = cornerRadius > 0
                imageView.layer.cornerRadius = cornerRadius
              }
          }
        
        var imageView = UIImageView()
        
        override func awakeFromNib() {
            super.awakeFromNib()
            addSubview(imageView)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = bounds
        }
    }
