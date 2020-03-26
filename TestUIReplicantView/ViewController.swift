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
        
        // next line crashes with:
        // *** Terminating app due to uncaught exception 'NSInvalidArgumentException',
        // reason: '-[_UIReplicantView _isSymbolImage]: unrecognized selector sent to instance 0x115907c00'
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
    
    func snapshotOld(at scale: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @objc var snapshot: UIImage? {
        snapshot(at: 3.0)
//        snapshotOld(at: 3.0)
    }
}
