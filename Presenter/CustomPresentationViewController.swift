//
//  CustomPresentationViewController.swift
//  Presenter
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit

class CustomPresentationViewController: UIViewController {
    var SetPointOrigin = false
    var pointOrigin: CGPoint?
    var mainView: UIView?
    var minDragVelocity : CGFloat = 1250
    init (with View: UIView?){
        self.mainView = View
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        guard let PresntView = mainView else {return}
        self.view = PresntView
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction(sender:)))
        self.view.addGestureRecognizer(pangesture)
    }
    
    override func viewDidLayoutSubviews() {
        if !SetPointOrigin{
            SetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        guard translation.y >= 0 else { return }
        
        view.frame.origin = .init(x: 0, y: self.pointOrigin!.y + translation.y)
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= minDragVelocity {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: UIScreen.main.bounds.height - self.view.frame.height)
                }
            }
        }
        
    }
    
}
