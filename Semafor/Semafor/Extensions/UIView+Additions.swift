//
//  UIView+Additions.swift
//  Semafor
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit


extension UIView {
    
    func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
        let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: angleInRadians)
        self.transform = rotation
    }

    func startBlink() {
        UIView.animate(withDuration: 0.5,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0.4 },
                       completion: nil)
    }
    
    func stopBlink() {
        self.layer.removeAllAnimations()
        self.alpha = 1
    }
}
