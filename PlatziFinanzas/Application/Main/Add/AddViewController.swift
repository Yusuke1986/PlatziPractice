//
//  AddViewController.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/10.
//  Copyright © 2019 Platzi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var transactionNameLabel: UITextField!
    @IBOutlet weak var transactionDescriptionLabel: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    private var viewModel = AddTransactionsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        valueTextField.becomeFirstResponder()
    }
    

    @IBAction func addTransaction(_ sender: UIButton) {
        viewModel.add(
            name: transactionNameLabel.text ?? "new add",
            descrption: transactionDescriptionLabel.text ?? "",
            value: valueTextField.text ?? "0"
        )
        
        valueTextField.resignFirstResponder()
        tabBarController?.selectedIndex = 0
    }

}
