//
//  ViewController.swift
//  CustomPresentController
//
//  Created by Nikhil Desai on 12/09/21.
//

import UIKit
import PresenterPopOver
class ViewController: UIViewController {
    
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
            //Total Object Defines Show many Bubbles Want Over Presentation View
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
        
        
        //Presenter Popover Custom Presenter Controller
        //Pass your ViewController Which Need to be Presented to 'CustomPresentationViewController'
        let vc = CustomPresentationViewController(with: SampleViewController())
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
}



//MARK:- Tranistioning Delegate
extension ViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        //Presenter Popover Custom Presentation Properties Controller
        CutomPresentationPropertiesViewController(presentedViewController: presented, presenting: presenting, blurEffectStyle: .dark, height: self.view.frame.height * 0.7, type: presentationStyle)
        
    }
}



