//
//  ViewController.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 4/23/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

extension UIView  {
    func addEdgeConstrained(subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right).isActive = true
    }
}

class BarGraphViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    @IBAction func addCharts(_ sender: Any) {
        let barChartContainer = Bundle.main.loadNibNamed("BarChartContainerView", owner: self, options: nil)?.first as! BarChartContainerView
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
        }
        stackView.addArrangedSubview(barChartContainer)
    }
}

