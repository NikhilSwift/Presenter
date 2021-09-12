//
//  CustomPresentationProperties.swift
//  Presenter
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit

class CutomPresentationviewController: UIPresentationController {
    
    let blurEffectView: UIVisualEffectView!
    var tapGesturerecognizer = UITapGestureRecognizer()
    var presentHeight = CGFloat()
    var presentType : ShapeManager!
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?,blurEffectStyle:UIBlurEffect.Style,height: CGFloat,type: ShapeManager) {
        let blurEffect = UIBlurEffect(style: blurEffectStyle)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.presentHeight = height
        self.presentType = type
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        tapGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView.isUserInteractionEnabled = true
        self.blurEffectView.addGestureRecognizer(tapGesturerecognizer)
        
    }
    
    override var frameOfPresentedViewInContainerView: CGRect{
        return .init(x: 0, y: self.containerView!.frame.height - presentHeight, width: self.containerView!.frame.width, height: presentHeight)
    }
    
    
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 1.0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.removeFromSuperview()
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.setShape(presentType)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }
    
   @objc func dismissController(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}



