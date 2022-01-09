//
//  UICollectionView+Additions.swift
//  ImageDownloader
//
//  Created by Mac on 1/10/22.
//

import UIKit

extension UICollectionView {
    func registerNibWithNames(_ name: String...) {
        name.forEach { name in
            let nib = UINib(nibName: name, bundle: .main)
            self.register(nib, forCellWithReuseIdentifier: name)
        }
    }
}
