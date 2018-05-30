//
//  NewTableViewCell.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 5/2/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class NewTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var viewConten: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewConten.backgroundColor = App.Color.blue13
    }
    
}
