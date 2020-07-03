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
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        
        let stack = UIStackView()
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        
        
        stack.addArrangedSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(yellowView)
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        redView.layer.cornerRadius = 20
        redView.layer.masksToBounds = true
        
        yellowView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yellowView.layer.cornerRadius = 20
        yellowView.layer.masksToBounds = true
        
        greenView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        greenView.layer.cornerRadius = 20
        greenView.layer.masksToBounds = true
        
        
        
        
        
    }

}
