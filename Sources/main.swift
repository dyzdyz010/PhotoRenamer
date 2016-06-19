//
//  main.swift
//  PhotoRenamer
//
//  Created by 杜艺卓 on 15/4/11.
//  Copyright (c) 2015年 杜艺卓. All rights reserved.
//

import Foundation

var rawPath = ""
print(Process.arguments)
if Process.argc == 1 {
    rawPath = NSBundle.main().bundlePath
} else {
    rawPath = buildPath(filename: (Process.arguments)[1])
}
print(rawPath)

process(path: rawPath)

print("Total failed: \(failNum)")


