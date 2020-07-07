//
//  SemaforTableViewController.swift
//  Semafor
//
//  Created by Katarina Veljkovic on 07/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

protocol SemaforTableViewControllerDelegate: class{
    func done(interval: Intervals) -> Void
}

class SemaforTableViewController: UITableViewController {
    
    weak var firstTextField: UITextField!
    weak var secondTextField: UITextField!
    weak var thirdTextField: UITextField!
    weak var fourthTextField: UITextField!
    weak var fifthTextField: UITextField!
    var first = Float()
    var second = Float()
    var third = Float()
    var fourth = Float()
    var fifth = Float()
    var interval = Intervals()
    var model: Intervals!
    
    weak var delegate: SemaforTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.register(SemaforTableViewCell.self, forCellReuseIdentifier: String(describing: SemaforTableViewCell.self))
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(backButtonTapped))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SemaforTableViewCell.self)) as! SemaforTableViewCell
            cell.semafor.state1()
            cell.textFieldStanje.text = String(interval.firstInterval)
            firstTextField = cell.textFieldStanje
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SemaforTableViewCell.self)) as! SemaforTableViewCell
            cell.semafor.state2()
            cell.textFieldStanje.text = String(interval.secondInterval)
            secondTextField = cell.textFieldStanje
            
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SemaforTableViewCell.self)) as! SemaforTableViewCell
            cell.semafor.state3()
            cell.textFieldStanje.text = String(interval.thirdInterval)
            thirdTextField = cell.textFieldStanje
            
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SemaforTableViewCell.self)) as! SemaforTableViewCell
            cell.semafor.state4()
            cell.textFieldStanje.text = String(interval.fourthInterval)
            fourthTextField = cell.textFieldStanje
            
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SemaforTableViewCell.self)) as! SemaforTableViewCell
            cell.semafor.state5()
            cell.textFieldStanje.text = String(interval.fifthInterval)
            fifthTextField = cell.textFieldStanje
            
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    @objc func backButtonTapped() {
        dismiss(animated: true)
        
        //interval = Intervals(firstInterval: first, secondInterval: second, thirdInterval: third, fourthInterval: fourth, fifthInterval: fifth)
        interval.firstInterval = Float(firstTextField.text!) ?? 0
        interval.secondInterval = Float(secondTextField.text!) ?? 0
        interval.thirdInterval = Float(thirdTextField.text!) ?? 0
        interval.fourthInterval = Float(fourthTextField.text!) ?? 0
        interval.fifthInterval = Float(fifthTextField.text!) ?? 0
        
        
        delegate?.done(interval: interval)
        
    }
    
}
