//
//  ViewController.swift
//  HTN iOS
//
//  Created by Wen-Hao Lue on 2015-09-19.
//  Copyright © 2015 Wen-Hao Lue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fox"))
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"

        self.imageView.frame = self.view.bounds
        self.imageView.contentMode = .Center
        self.view.addSubview(self.imageView)
    }

    @IBAction func buttonTapped() {
        print("tapped!")

        UIView.animateWithDuration(0.5) { () -> Void in
            self.button?.frame.origin = CGPoint(x: 0, y: 80)
        }

//        let viewController = IngredientsViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

