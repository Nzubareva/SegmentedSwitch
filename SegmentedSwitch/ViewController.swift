//
//  ViewController.swift
//  SegmentedSwitch
//
//  Created by Natallia Zubareva on 02.05.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SegmentedSwitchDelegate {
    func segmentedSwitch(_ switch: SegmentedSwitch, didSelectItemAtIndex index: Int) {
       print("\(index) pressed")
    }
    

    @IBOutlet weak var controlContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [UIView(), UIView(), UIView(), UIView(), UIView() ]
        let segmentedSwitch = SegmentedSwitch(items: items, delegate: self)
        controlContainer.addSubview(segmentedSwitch)
        segmentedSwitch.frame = controlContainer.bounds
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

