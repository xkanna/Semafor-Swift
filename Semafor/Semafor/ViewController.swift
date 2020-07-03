//
//  ViewController.swift
//  Semafor
//
//  Created by Katarina Veljkovic on 03/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let firstSemafor = SemaforView()
    let secondSemafor = SemaforView()
    let thirdSemafor = SemaforView()
    let fourthSemafor = SemaforView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        view.addSubview(firstSemafor)
        firstSemafor.translatesAutoresizingMaskIntoConstraints = false
        //firstSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        firstSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        firstSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        
        view.addSubview(secondSemafor)
        secondSemafor.translatesAutoresizingMaskIntoConstraints = false
        secondSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 160).isActive = true
        secondSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        secondSemafor.setTransformRotation(toDegrees: 180)
        
        view.addSubview(thirdSemafor)
        thirdSemafor.translatesAutoresizingMaskIntoConstraints = false
        thirdSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 160).isActive = true
        thirdSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160).isActive = true
        thirdSemafor.setTransformRotation(toDegrees: 270)
        
        view.addSubview(fourthSemafor)
        fourthSemafor.translatesAutoresizingMaskIntoConstraints = false
        fourthSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        fourthSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160).isActive = true
        fourthSemafor.setTransformRotation(toDegrees: 90)
        
        
        
        
    }


}
extension UIView {
    func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
        let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: angleInRadians)
        self.transform = rotation
    }
}

