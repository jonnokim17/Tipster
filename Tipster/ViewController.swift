//
//  ViewController.swift
//  Tipster
//
//  Created by Jonathan Kim on 1/10/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Properties
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var splitBillTextField: UITextField!
    @IBOutlet weak var splitAmountLabel: UILabel!

    weak var defaultTipPercentages: NSArray!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Initialize default values
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
        splitAmountLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)

        // Get the default values from the settings VC
        updateTipSegmentedControl(getDefaultTipPercentage())
    }

    // IBActions
    @IBAction func onEditingChanged(sender: AnyObject)
    {
        // Get the tip percentage based on the segmented control
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipSegmentedControl.selectedSegmentIndex]

        var billAmount = (billTextField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        tipAmountLabel.text = String(format:"$%.2f", tip)
        totalAmountLabel.text = String(format:"$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true)
    }

    @IBAction func onSplitBillTextFieldChanged(sender: AnyObject)
    {
        // TODO: refactor repeated code
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipSegmentedControl.selectedSegmentIndex]

        var billAmount = (billTextField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        var splitAmount = total / (splitBillTextField.text as NSString).doubleValue

        // Create default text to $0.00
        if splitBillTextField.text == ""
        {
            splitAmountLabel.text = "$0.00"
        }
        else
        {
            splitAmountLabel.text = String(format:"$%.2f", splitAmount)
        }
    }


    // Helper Methods
    func updateTipSegmentedControl(updatedPercentage: Double)
    {
        var defaultTipPercentages = [0.18, 0.2, 0.22]
        tipSegmentedControl.selectedSegmentIndex = find(defaultTipPercentages, updatedPercentage)!
    }
}

