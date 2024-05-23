//
//  ManufactureCell.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 23/5/2024.
//

import UIKit

class ManufactureCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }

    private func setupImageView() {
        let fixedImageSize = CGSize(width: 50, height: 50) // Adjust size as needed
        imageView?.frame.size = fixedImageSize
        imageView?.contentMode = .scaleAspectFit
    }
}
