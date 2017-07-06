//
//  ImageCollectionViewCell.swift
//  collectionView
//
//  Created by admin on 7/6/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

protocol ImageCollectionViewCellDelegate {
    func changeColorOfButton(forCell: ImageCollectionViewCell)
}
class ImageCollectionViewCell: UICollectionViewCell {
    
    var ImageView: UIImageView!
    var button: UIButton!
    var delegate: ImageCollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        ImageView = UIImageView(frame: contentView.frame)
        ImageView.contentMode = .scaleAspectFill
        contentView.addSubview(ImageView)
        
        button = UIButton(frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        button.backgroundColor = UIColor.red
        button.setTitle("Change my Color", for: .normal)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        contentView.addSubview(button)
    }
    func changeColor(){
        print("changing color")
        delegate?.changeColorOfButton(forCell: self)
    }
}
