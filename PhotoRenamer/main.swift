//
//  main.swift
//  PhotoRenamer
//
//  Created by 杜艺卓 on 15/4/11.
//  Copyright (c) 2015年 杜艺卓. All rights reserved.
//

import Foundation

var rawPath = ""
if Process.argc == 1 {
    rawPath = NSBundle.mainBundle().bundlePath
} else {
    rawPath = buildPath((Process.arguments)[1])
}

process(rawPath)

println("Total failed: \(failNum)")


