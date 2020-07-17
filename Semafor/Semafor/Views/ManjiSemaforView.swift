//
//  ManjiSemaforView.swift
//  Semafor
//
//  Created by Katarina Veljkovic on 16/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class ManjiSemaforView: UIView {

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
        redView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        redView.clipsToBounds = true
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 20
        redView.layer.borderWidth = 2
        redView.layer.borderColor = UIColor.black.cgColor
        
        stack.addArrangedSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        greenView.clipsToBounds = true
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = 20
        greenView.layer.borderWidth = 2
        greenView.layer.borderColor = UIColor.black.cgColor
    }
    
    func state1() {
        redView.backgroundColor = .red
        greenView.backgroundColor = .gray
        redView.stopBlink()
    }
    
    func state2() {
        redView.backgroundColor = .red
        greenView.backgroundColor = .gray
        redView.startBlink()
    }

    func state3(){
        redView.backgroundColor = .gray
        greenView.backgroundColor = .green
        greenView.startBlink()
    }
    
    func state4() {
        greenView.stopBlink()
        redView.backgroundColor = .gray
        greenView.backgroundColor = .green
    }


}
