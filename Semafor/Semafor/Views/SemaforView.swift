//
//  SemaforView.swift
//  Semafor
//
//  Created by Katarina Veljkovic on 03/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class SemaforView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var redView = UIView()
    var yellowView = UIView()
    var greenView = UIView()
    var grayView = UIView()
    
    
    
    private var isHorizontal = false
    
    init(isHorizontal: Bool = true) {
        super.init(frame: .zero)
        self.isHorizontal = isHorizontal
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        backgroundColor = .gray
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        
        let stack = UIStackView()
        addSubview(stack)
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        if isHorizontal {
            stack.axis = .horizontal
        } else {
            stack.axis = .vertical
        }
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.addArrangedSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        redView.clipsToBounds = true
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 20
        redView.layer.borderWidth = 2
        redView.layer.borderColor = UIColor.black.cgColor
        
        stack.addArrangedSubview(yellowView)
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yellowView.clipsToBounds = true
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = 20
        yellowView.layer.borderWidth = 2
        yellowView.layer.borderColor = UIColor.black.cgColor
        
        stack.addArrangedSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        greenView.clipsToBounds = true
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = 20
        greenView.layer.borderWidth = 2
        greenView.layer.borderColor = UIColor.black.cgColor
    }
    
    func state1() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .gray
        greenView.backgroundColor = .gray
    }
    
    func state2() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .gray
    }
    
    func state3(){
        redView.backgroundColor = .gray
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .gray
    }
    
    func state4(){
        redView.backgroundColor = .gray
        yellowView.backgroundColor = .gray
        greenView.backgroundColor = .green
        
        startBlink(view: greenView)
    }
    
    func state5(){
        stopBlink(view: greenView)
        redView.backgroundColor = .gray
        yellowView.backgroundColor = .gray
        greenView.backgroundColor = .green
    }
    

}
