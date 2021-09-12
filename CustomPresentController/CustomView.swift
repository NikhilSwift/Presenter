//
//  CustomView.swift
//  CustomPresentController
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit

protocol dismissPro:AnyObject{
    func dismissView()
}

class CustomView: UIView {
    weak var dismissDelegate: dismissPro?
    var customButton : UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.font = .monospacedDigitSystemFont(ofSize: 20, weight: .bold)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.systemIndigo, for: .normal)
        } else {
            button.setTitleColor(.systemOrange, for: .normal)
        }
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.customButton.addTarget(self, action: #selector(dimissView(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customButton.frame = .init(x: self.frame.width/2 - 250/2, y: self.frame.height/2 - 250/2, width: 250, height: 250)
        self.addSubview(customButton)
    }
    
    @objc func dimissView(_ sender: UIButton){
        self.dismissDelegate?.dismissView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
