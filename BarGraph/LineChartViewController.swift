//
//  LineChartViewController.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/16/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class LineChartViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showTripleBar(_ sender: Any) {
        
        let lineChartContainer = Bundle.main.loadNibNamed("LineChartContainer", owner: self, options: nil)?.first as! LineChartContainer
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
        }
        stackView.addArrangedSubview(lineChartContainer)
    }

}
