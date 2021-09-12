//
//  ViewController.swift
//  CustomPresentController
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit


class ViewController: UIViewController {
    let PresentingView = CustomView()
    var presentationStyle : ShapeManager!
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var wavesButton: UIButton!
    @IBOutlet weak var fluidButton: UIButton!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var roundedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentButton.tag = 1
        ticketButton.tag = 2
        wavesButton.tag = 3
        fluidButton.tag = 4
        couponButton.tag = 5
        roundedButton.tag = 6
        [presentButton,ticketButton,wavesButton,fluidButton,couponButton,roundedButton].forEach({ (bttns) in
            bttns.addTarget(self, action: #selector(presentView(_:)), for: .touchUpInside)
        })
    }

    @objc func presentView(_ sender: UIButton){
        switch sender.tag{
        case 1:
            self.presentationStyle = .Bubble(totalObject: 10)
        case 2:
            self.presentationStyle = .Ticket(totalObject: 10)
        case 3:
            self.presentationStyle = .Wave(totalObject: 10)
        case 4:
            self.presentationStyle = .Fluid(height: 100)
        case 5:
            self.presentationStyle = .Coupon(totalObject: 10)
        case 6:
            self.presentationStyle = .Rounded(radius: 40)
        default:
            break;
        }
        PresentingView.dismissDelegate = self
        let vc = CustomPresentViewController(with: PresentingView)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        CutomPresentationviewController(presentedViewController: presented, presenting: presenting, blurEffectStyle: .dark, height: self.view.frame.height * 0.7, type: self.presentationStyle)
    }
}


extension ViewController:dismissPro{
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
