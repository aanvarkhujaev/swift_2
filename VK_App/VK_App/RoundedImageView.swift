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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIImageView.animate(withDuration: 2, delay: 0, options: []) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { (success) in
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIImageView.animate(withDuration: 2, delay: 0, options: []) {
            self.transform = .identity
        } completion: { (success) in
            
        }
        
    }
}
