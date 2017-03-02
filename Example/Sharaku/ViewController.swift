//
//  ViewController.swift
//  Sharaku
//
//  Created by makomori on 01/04/2017.
//  Copyright (c) 2017 makomori. All rights reserved.
//

import UIKit
import Sharaku

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var showSharokuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sharakuButtonTapped(_ sender: Any) {
        let image = UIImage(named: "sample")
        let vc = ContainerViewController(image: image!)
        present(vc, animated: true, completion: nil)

        vc.finished = { [weak self] image in
            self?.imageView.image = image
        }
    }
}
