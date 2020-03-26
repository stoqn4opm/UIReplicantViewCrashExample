//
//  ViewController.swift
//  TestUIReplicantView
//
//  Created by Stoyan Stoyanov on 26/03/2020.
//  Copyright © 2020 Stoyan Stoyanov. All rights reserved.
//

import UIKit


// MARK: - Class Definition

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let image = view.snapshot
        imageView.image = image
    }
}

// MARK: - Helpers

extension UIView {
    
    func snapshot(at scale: CGFloat) -> UIImage? {
        
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { [weak self] context in
            self?.drawHierarchy(in: self?.bounds ?? .zero, afterScreenUpdates: true)
        }
        
        return image
    }
    
    var snapshot: UIImage? {
        snapshot(at: 3.0)
    }
}
