//
//  SampleViewController.swift
//  CustomPresentController
//
//  Created by Nikhil Desai on 18/09/21.
//

import UIKit



class SampleViewController: UIViewController {
    
     var mainView : CustomView = {
        let view = CustomView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
        self.mainView.dismissDelegate = self
    }
    

}

extension SampleViewController:dismissPro{
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
