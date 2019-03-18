//
//  ToggleView.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 17/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ToggleView: BaseView {

    var toggle: Toggle!
    var isToggleSelected : Dynamic<Bool> = Dynamic(false)
    
    override func setup() {
        let toggleView = UIView(frame: bounds)
        toggleView.backgroundColor = .lightBlue
        toggleView.layer.cornerRadius = toggleView.bounds.height / 2
        addSubview(toggleView)
        
        toggleView.addSubview(createLabel(text: "2 Members", frame: CGRect(x: 0, y: 0, width: bounds.width / 2, height: bounds.height)))
        toggleView.addSubview(createLabel(text: "4 Members", frame: CGRect(x: bounds.width / 2, y: 0, width: bounds.width / 2, height: toggleView.bounds.height)))

        toggle = Toggle(frame: CGRect(x: 0, y: 0, width: bounds.width / 2, height: toggleView.bounds.height))
        toggleView.addSubview(toggle)
        
        toggleView.isUserInteractionEnabled = true
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe))
        rightSwipeGesture.direction = .right
        toggleView.addGestureRecognizer(rightSwipeGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
        leftSwipeGesture.direction = .left
        toggleView.addGestureRecognizer(leftSwipeGesture)

    }
    
    private func createLabel(text: String, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
}

@objc
extension ToggleView {
    func rightSwipe() {
        isToggleSelected.value = false
        toggle.transform = CGAffineTransform.init(translationX: bounds.width / 2, y: 0)
        toggle.titleText = "4 Members"
    }
    
    func leftSwipe() {
        isToggleSelected.value = true
        toggle.transform = CGAffineTransform.identity
        toggle.titleText = "2 Members"
    }
}
