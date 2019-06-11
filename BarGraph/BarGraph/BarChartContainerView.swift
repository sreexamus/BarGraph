//
//  ChartContainerView.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/3/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class BarChartContainerView: UIView {

    @IBOutlet weak var horizontalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        horizontalLabel.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        horizontalLabel.preferredMaxLayoutWidth = horizontalLabel.frame.width
    }
}
