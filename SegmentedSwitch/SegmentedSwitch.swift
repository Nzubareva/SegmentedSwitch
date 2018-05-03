//
//  SegmentedSwitch.swift
//  SegmentedSwitch
//
//  Created by Natallia Zubareva on 02.05.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import UIKit

protocol SegmentedSwitchDelegate {
    func segmentedSwitch(_ switch: SegmentedSwitch, didSelectItemAtIndex index: Int) -> ()
}

class SegmentedSwitch: UIView {
    private var items: [UIView]
    private var selectedIndex = 0
    var delegate: SegmentedSwitchDelegate
    
    private var spacing: CGFloat = 8
    
    private lazy var selectionFrame: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    init(items: [UIView], delegate: SegmentedSwitchDelegate ) {
        self.items = items
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        items.forEach{ item in
            item.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(item)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(itemTapped(_:)))
            item.addGestureRecognizer(tapRecognizer)
            
        }
    }
    
    @objc func itemTapped(_ sender: UITapGestureRecognizer) {
        if  let tappedItem = sender.view {
           if  let tappedIndex = items.index(of: tappedItem) {
                selectedIndex = tappedIndex
                prepareLayout()
                delegate.segmentedSwitch(self, didSelectItemAtIndex: selectedIndex)
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        prepareLayout()
    }
    
    private func prepareLayout() {
        let itemWidth = (self.bounds.width - CGFloat(items.count + 1) * spacing) / CGFloat(items.count)
        let itemHeight = bounds.height - 2 * spacing
        
        let fx = spacing + CGFloat(selectedIndex) * (itemWidth + spacing) - spacing / 2
        selectionFrame.frame = CGRect(x: fx, y: spacing/2, width: itemWidth + spacing, height: itemHeight + spacing)
        
        
        for (index, item) in items.enumerated() {
            item.backgroundColor = UIColor.red
            let x = spacing + CGFloat(index) * ( itemWidth + spacing)
            
            item.frame = CGRect(x: x, y: spacing, width: itemWidth, height: itemHeight)
        }
    }
    
}



















