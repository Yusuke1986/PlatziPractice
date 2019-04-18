//
//  TransactionTableViewCell.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/10.
//  Copyright © 2019 Platzi. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionNameLabel: UILabel!
    @IBOutlet weak var transactionDescriptionLabel: UILabel!
    @IBOutlet weak var transactionValueLabel: UILabel!
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var transactionTimeLabel: UILabel!
    
    var viewModel: TransactionViewModel! {
        didSet {
            setUpView()
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpView() {
        
        transactionNameLabel.text = viewModel.name
        transactionDateLabel.text = viewModel.date
        transactionTimeLabel.text = viewModel.time
        transactionValueLabel.text = viewModel.value
        
        
        
        
        
    }
    
}
