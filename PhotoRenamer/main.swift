//
//  main.swift
//  PhotoRenamer
//
//  Created by 杜艺卓 on 15/4/11.
//  Copyright (c) 2015年 杜艺卓. All rights reserved.
//

import Foundation

func readDirectory(path: String) {
    println("asdlkgjlasgj")
    let fileManager = NSFileManager.defaultManager()
    let enumerator = fileManager.enumeratorAtPath(path)
    println("All object: \(enumerator?.allObjects)")
    while let ele = enumerator?.nextObject() as? String {
        
    }
}

//println("First argument: \(Process.arguments)")
var rawPath = ""
var bundle = NSBundle.mainBundle()
//println(bundle)
if Process.argc == 1 {
    rawPath = NSBundle.mainBundle().bundlePath
} else {
    rawPath = buildPath((Process.arguments)[1])
}

process(rawPath)

println("Total failed: \(failNum)")



//let fileManager = NSFileManager.defaultManager()
//let enumerator: NSDirectoryEnumerator = fileManager.enumeratorAtPath(path.absoluteString!)!
//println(enumerator)
//
//while let ele = enumerator.nextObject() as? String {
//    println("ele: ", ele)
//}
//
//let img = CGImageSourceCreateWithURL(fullPath, nil)
//if img == nil {
//    println("File \(fullPath) doesn't exist.")
//}
//
//let exif = CGImageSourceCopyPropertiesAtIndex(img, 0, nil) as NSDictionary
////println(exif)
//let tiff = exif[kCGImagePropertyTIFFDictionary as String] as? NSDictionary
//println(tiff)
//if let tiffDic = tiff {
//    let datetimeStr = tiff![kCGImagePropertyTIFFDateTime as String] as! String
//    println(datetimeStr)
//    let dateFormater = NSDateFormatter()
//    dateFormater.dateFormat = "yyyy:MM:dd HH:mm:ss"
//    let date = dateFormater.dateFromString(datetimeStr)
//    dateFormater.dateFormat = "yyyy-MM-dd HH.mm.ss"
//    let newDateStr = dateFormater.stringFromDate(date!)
//    println(newDateStr)
//}


