//
//  SHViewController.swift
//  Pods
//
//  Created by 母利 睦人 on 2017/01/04.
//
//

import UIKit

public protocol SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage)
}

public class SHViewController: UIViewController {
    var delegate: SHViewControllerDelegate?

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
