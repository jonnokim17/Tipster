//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Jonathan Kim on 1/10/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    // IBActions
    @IBAction func onDoneBarButtonItemPressed(sender: AnyObject)
    {
        // Dismiss viewcontroller
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onEightteenPercentPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.18)
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func onTwentyPercentPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.2)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTwentytwoPercentPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.22)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
