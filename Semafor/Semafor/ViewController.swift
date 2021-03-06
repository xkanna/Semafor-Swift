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
    let firstSmallSemafor = ManjiSemaforView()
    let secondSmallSemafor = ManjiSemaforView()
    let thirdSmallSemafor = ManjiSemaforView()
    let fourthSmallSemafor = ManjiSemaforView()
    let table = SemaforTableViewController()
    var interval = Intervals(firstInterval: 2, secondInterval: 2, thirdInterval: 2, fourthInterval: 2, fifthInterval: 2)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(editButtonTapped))
        
        view.addSubview(firstSmallSemafor)
        firstSmallSemafor.translatesAutoresizingMaskIntoConstraints = false
        firstSmallSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstSmallSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        view.addSubview(firstSemafor)
        firstSemafor.translatesAutoresizingMaskIntoConstraints = false
        firstSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        firstSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        firstSemafor.setTransformRotation(toDegrees: 90)
        
        view.addSubview(secondSemafor)
        secondSemafor.translatesAutoresizingMaskIntoConstraints = false
        secondSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        secondSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        secondSemafor.setTransformRotation(toDegrees: 270)
        
        view.addSubview(secondSmallSemafor)
        secondSmallSemafor.translatesAutoresizingMaskIntoConstraints = false
        secondSmallSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        secondSmallSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondSmallSemafor.setTransformRotation(toDegrees: 180)
        
        view.addSubview(thirdSemafor)
        thirdSemafor.translatesAutoresizingMaskIntoConstraints = false
        thirdSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 160).isActive = true
        thirdSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(thirdSmallSemafor)
        thirdSmallSemafor.translatesAutoresizingMaskIntoConstraints = false
        thirdSmallSemafor.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        thirdSmallSemafor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        thirdSmallSemafor.setTransformRotation(toDegrees: 270)
        
        view.addSubview(fourthSemafor)
        fourthSemafor.translatesAutoresizingMaskIntoConstraints = false
        fourthSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        fourthSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        fourthSemafor.setTransformRotation(toDegrees: 180)
        
        view.addSubview(fourthSmallSemafor)
        fourthSmallSemafor.translatesAutoresizingMaskIntoConstraints = false
        fourthSmallSemafor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        fourthSmallSemafor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        fourthSmallSemafor.setTransformRotation(toDegrees: 90)
        
        var red = false
        var green = false
        var red1 = false
        var green1 = false
        
        func start() {
            stage1()
            stage52()
        }
        
        func stage1(){
            
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false) { [weak self] timer in
                self?.firstSemafor.state5()
                self?.secondSemafor.state5()
                self?.thirdSmallSemafor.state4()
                self?.fourthSmallSemafor.state4()
                
                green = true
                stage2()
            }
            
        }
        func stage2(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){ timer in
                self.firstSemafor.state4()
                self.secondSemafor.state4()
                self.thirdSmallSemafor.state3()
                self.fourthSmallSemafor.state3()
                green = true
                stage3()
                
            }
        }
        func stage3(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.secondInterval), repeats: false){timer in
                if(green){
                    self.firstSemafor.state3()
                    self.secondSemafor.state3()
                    self.thirdSmallSemafor.state3()
                    self.fourthSmallSemafor.state3()
                    green = false
                    stage5()
                }
                
                if(red){
                    self.firstSemafor.state3()
                    self.secondSemafor.state3()
                    self.thirdSmallSemafor.state2()
                    self.fourthSmallSemafor.state2()
                    red = false
                    stage1()
                }
            }
        }
        func stage4(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){timer in
                self.firstSemafor.state2()
                self.secondSemafor.state2()
                self.thirdSmallSemafor.state2()
                self.fourthSmallSemafor.state2()
                red = true
                stage3()
                
            }
        }
        func stage5(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false){timer in
                self.firstSemafor.state1()
                self.secondSemafor.state1()
                self.thirdSmallSemafor.state1()
                self.fourthSmallSemafor.state1()
                red = true
                stage4()
                
                
            }
        }
        func stage12(){
            
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false){ timer in
                self.thirdSemafor.state5()
                self.fourthSemafor.state5()
                self.firstSmallSemafor.state4()
                self.secondSmallSemafor.state4()
                green1 = true
                stage22()
            }
            
        }
        func stage22(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){ timer in
                self.thirdSemafor.state4()
                self.fourthSemafor.state4()
                self.firstSmallSemafor.state3()
                self.secondSmallSemafor.state3()
                green1 = true
                stage32()
                
            }
        }
        func stage32(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.secondInterval), repeats: false){timer in
                if green1 {
                    self.thirdSemafor.state3()
                    self.fourthSemafor.state3()
                    self.firstSmallSemafor.state3()
                    self.secondSmallSemafor.state3()
                    green1 = false
                    stage52()
                    
                }
                if red1 {
                    self.thirdSemafor.state3()
                    self.fourthSemafor.state3()
                    self.firstSmallSemafor.state2()
                    self.secondSmallSemafor.state2()
                    red1 = false
                    stage12()   
                }
            }
        }
        
        func stage42(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.firstInterval), repeats: false){timer in
                self.thirdSemafor.state2()
                self.fourthSemafor.state2()
                self.firstSmallSemafor.state2()
                self.secondSmallSemafor.state2()
                red1 = true
                stage32()

            }
        }
        
        func stage52(){
            Timer.scheduledTimer(withTimeInterval: Double(interval.thirdInterval), repeats: false){timer in
                self.thirdSemafor.state1()
                self.fourthSemafor.state1()
                self.firstSmallSemafor.state1()
                self.secondSmallSemafor.state1()
                red1 = true
                stage42()
            }
        }
        
        start()
    }
    
    @objc func editButtonTapped() {
        let vc = SemaforTableViewController()
        
        vc.delegate = self
        vc.interval = interval
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
}

// MARK: - SemaforTableViewControllerDelegate
extension ViewController: SemaforTableViewControllerDelegate {
    func done(interval: Intervals) {
        self.interval = interval
    }
}
