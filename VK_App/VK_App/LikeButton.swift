//
//  LikeButton.swift
//  VK_App
//
//  Created by Akbar on 3/16/21.
//

import UIKit
@IBDesignable class LikeButton: UIControl {
    
    @IBInspectable var likesCount: Int = 0 {
        didSet {
            updateLabelText()
        }
    }
    @IBInspectable var likeImage: UIImage? = nil {
        didSet {
            likeImageView.image = likeImage
        }
    }
    private var stackView: UIStackView!
    private var countLabel: UILabel!
    private var likeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func commonInit() {
        countLabel = UILabel()
        likeImageView = UIImageView()
        likeImageView.contentMode = .scaleAspectFit
        countLabel.textAlignment = .left
        stackView = UIStackView (arrangedSubviews: [likeImageView, countLabel])
        addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        updateSelectionState()
    }
    
    private func updateLabelText() {
        let additionLikes = isSelected ? 1 : 0
        countLabel.text = "\(likesCount + additionLikes)"
    }
    
    private func updateSelectionState() {
        let color = isSelected ? tintColor : .systemGray2
        countLabel.textColor = color
        likeImageView.tintColor = color
        updateLabelText()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSelected = !isSelected
        updateSelectionState()
    }
    
}
