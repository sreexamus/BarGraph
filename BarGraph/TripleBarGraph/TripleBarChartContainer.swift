//
//  TripleBarChartContainer.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/5/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class TripleBarChartContainer: UIView {

    @IBOutlet weak var horizontalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        horizontalLabel.transform = CGAffineTransform(rotationAngle: -.pi / 2)
    }
}
