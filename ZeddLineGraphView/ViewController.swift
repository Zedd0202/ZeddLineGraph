//
//  ViewController.swift
//  ZeddLineGraphView
//
//  Created by Zedd on 2020/04/22.
//  Copyright © 2020 Zedd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var graphView: ZeddLineGraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let padding: CGFloat = 100
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width - padding, height: self.view.frame.height - padding)
        let view = ZeddLineGraphView(frame: frame,
                                 values: [20, 10, 30, 20, 50, 100, 10, 10])
        view.backgroundColor = .lightGray
        view.center = CGPoint(x: self.view.frame.size.width  / 2,
                              y: self.view.frame.size.height / 2)
        self.view.addSubview(view)
        self.graphView = view
    }
}
