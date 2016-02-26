//
//  path.swift
//  PhotoRenamer
//
//  Created by 杜艺卓 on 15/4/11.
//  Copyright (c) 2015年 杜艺卓. All rights reserved.
//

import Foundation

func buildPath(filename: String) ->String {
    if filename.hasPrefix("/") {
        return filename
    }
    
    let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: nil)
    if filePath == nil {
        print("File \(filename) does not exist.")
        exit(0)
    }
    
    return filePath!
}

func isPhoto(filename: String) ->Bool {
    var isPhotoFlag = false
    for ext in photoExts {
        if filename.hasSuffix(ext) {
            isPhotoFlag = true
        }
    }
    
    return isPhotoFlag
}

func isDirectory(path: String) ->Bool {
    var dirPath = path
    if !path.hasSuffix("/") {
        dirPath += "/"
    }
    var isDir:ObjCBool = true
    NSFileManager.defaultManager().fileExistsAtPath(dirPath, isDirectory: &isDir)
    
    return isDir.boolValue
}
