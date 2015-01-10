//
//  Persistence.swift
//  Tipster
//
//  Created by Jonathan Kim on 1/10/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import Foundation

func setDefaultTipPercentage(tip: Double)
{
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(tip, forKey: "defaultTip")
    defaults.synchronize()
}

func getDefaultTipPercentage() -> Double
{
    var defaults = NSUserDefaults.standardUserDefaults()
    var defaultTipPercentage = defaults.doubleForKey("defaultTip")
    return defaultTipPercentage
}
