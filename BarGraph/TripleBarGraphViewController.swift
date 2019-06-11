//
//  TripleBarGraphViewController.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/6/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class TripleBarGraphViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showTripleBar(_ sender: Any) {
        
        let tripleBarChartContainer = Bundle.main.loadNibNamed("TripleBarChartContainer", owner: self, options: nil)?.first as! TripleBarChartContainer
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
        }
        stackView.addArrangedSubview(tripleBarChartContainer)
    }
    
}
