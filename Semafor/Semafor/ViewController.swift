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
    let table = SemaforTableViewController()
    var interval = Intervals(firstInterval: 2, secondInterval: 2, thirdInterval: 2, fourthInterval: 2, fifthInterval: 2)
    
    
    typealias DoneCallback = ((Intervals) -> Void)
    private var callback: DoneCallback?
    func finished(callback: DoneCallback?) {
        self.callback = callback
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(editButtonTapped))
        
        
        view.addSubview(firstSemafor)
        firstSemafor.translatesAutoresizingMaskIntoConstraints = false
        firstSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
        view.addSubview(secondSemafor)
        secondSemafor.translatesAutoresizingMaskIntoConstraints = false
        secondSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        secondSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondSemafor.setTransformRotation(toDegrees: 180)
        
        view.addSubview(thirdSemafor)
        thirdSemafor.translatesAutoresizingMaskIntoConstraints = false
        thirdSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 80).isActive = true
        thirdSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        thirdSemafor.setTransformRotation(toDegrees: 270)
        
        view.addSubview(fourthSemafor)
        fourthSemafor.translatesAutoresizingMaskIntoConstraints = false
        fourthSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        fourthSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        fourthSemafor.setTransformRotation(toDegrees: 90)
        
        var red = Bool()
        var green = Bool()
        var red2 = Bool()
        var green2 = Bool()
        
        func start(){
            stage1()
            stage33()
        }
        func stage1(){
            //let timer1 = interval?.firstInterval
            
            Timer.scheduledTimer(withTimeInterval: Double(interval.fifthInterval), repeats: false){ timer in
                self.firstSemafor.state5()
                self.secondSemafor.state5()
                green = true
                stage12()
            }
            
        }
        func stage12(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.fourthInterval), repeats: false){ timer in
                self.firstSemafor.state4()
                self.secondSemafor.state4()
                green = true
                stage2()
                
            }
        }
        func stage2(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false){timer in
                if(green){
                    self.firstSemafor.state3()
                    self.secondSemafor.state3()
                    green = false
                    stage3()
                    
                }
                if(red){
                    self.firstSemafor.state2()
                    self.secondSemafor.state2()
                    red = false
                    stage1()
                    
                }
                
            }
        }
        func stage3(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){timer in
                self.firstSemafor.state1()
                self.secondSemafor.state1()
                red = true
                stage2()
                
                
            }
        }
        func stage11(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.fifthInterval), repeats: false){ timer in
                self.thirdSemafor.state5()
                self.fourthSemafor.state5()
                green2 = true
                stage21()
                
            }
        }
        func stage21(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.fourthInterval), repeats: false){ timer in
                self.thirdSemafor.state4()
                self.fourthSemafor.state4()
                green2 = true
                stage22()
                
            }
        }
        func stage22(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false){timer in
                if(green2){
                    self.thirdSemafor.state3()
                    self.fourthSemafor.state3()
                    green2 = false
                    stage33()
                    
                }
                if(red2){
                    self.thirdSemafor.state2()
                    self.fourthSemafor.state2()
                    red2 = false
                    stage11()
                    
                }
                
            }
        }
        func stage33(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){timer in
                self.thirdSemafor.state1()
                self.fourthSemafor.state1()
                red2 = true
                stage22()
                
                
            }
        }
        start()
    }
    @objc func editButtonTapped() {
        let vc = SemaforTableViewController()
        //   vc.model = Intervals
        //    vc.finished { [weak self] (model) in
        //self?.interval = interval
        
        vc.delegate = self
        vc.interval = interval
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
    
    
}
extension ViewController: SemaforTableViewControllerDelegate {
    func done(interval: Intervals) {
        self.interval = interval
    }
}

extension UIView {
    func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
        let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: angleInRadians)
        self.transform = rotation
    }
}
func startBlink(view: UIView) {
    UIView.animate(withDuration: 0.5,
                   delay:0.0,
                   options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                   animations: { view.alpha = 0.4 },
                   completion: nil)
}
func stopBlink(view: UIView) {
    view.layer.removeAllAnimations()
    view.alpha = 1
}


