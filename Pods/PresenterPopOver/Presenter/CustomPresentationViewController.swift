//
//  CustomPresentationViewController.swift
//  Presenter
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit

public class CustomPresentationViewController: UIViewController {
    var SetPointOrigin = false
    var pointOrigin: CGPoint?
    var mainViewController: UIViewController?
    var minDragVelocity : CGFloat = 1250
    
   public init (with ViewController: UIViewController?){
        self.mainViewController = ViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        removeViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction(sender:)))
        self.view.addGestureRecognizer(pangesture)
    }
    public override func viewDidDisappear(_ animated: Bool) {
        removeViewController()
    }
    func addViewController(){
        guard let PresntViewController = mainViewController else {return}
        PresntViewController.view.frame = self.view.bounds
        self.view.addSubview(PresntViewController.view)
        PresntViewController.didMove(toParent: self)
    }
    
    func removeViewController(){
        guard let PresntViewController = mainViewController else {return}
        PresntViewController.willMove(toParent: nil)
        PresntViewController.view.removeFromSuperview()
        PresntViewController.removeFromParent()
    }
    public override func viewDidLayoutSubviews() {
        if !SetPointOrigin{
            SetPointOrigin = true
            pointOrigin = self.view.frame.origin
            addViewController()
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
