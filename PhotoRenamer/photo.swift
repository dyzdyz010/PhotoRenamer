//
//  photo.swift
//  PhotoRenamer
//
//  Created by 杜艺卓 on 15/4/11.
//  Copyright (c) 2015年 杜艺卓. All rights reserved.
//

import Foundation
import ImageIO

var failNum = 0

let photoExts = ["png", "jpg", "jpeg", "JPG", "PNG"]

func changeFileName(path: String) {
    let filePath = NSURL(fileURLWithPath: path)!
    
    let img = CGImageSourceCreateWithURL(filePath, nil)
    if img == nil {
        println("File \(filePath) doesn't exist.")
        exit(0)
    }
    
    let exif = CGImageSourceCopyPropertiesAtIndex(img, 0, nil) as NSDictionary
    println(exif)
    let tiff = exif[kCGImagePropertyTIFFDictionary as String] as? NSDictionary
//    println(tiff)
    if let tiffDic = tiff {
        let datetimeStrOpt = tiff![kCGImagePropertyTIFFDateTime as String] as? String

        if let datetimeStr = datetimeStrOpt {
//            println(datetimeStr)
            let dateFormater = NSDateFormatter()
            dateFormater.dateFormat = "yyyy:MM:dd HH:mm:ss"
            let date = dateFormater.dateFromString(datetimeStr)
            dateFormater.dateFormat = "yyyy-MM-dd HH.mm.ss"
            let newDateStr = dateFormater.stringFromDate(date!)
//            println(newDateStr)
            
            let filename = filePath.lastPathComponent?.stringByDeletingPathExtension
//            println(filename)
            let ext = filePath.pathExtension
//            println(ext)
            let dirURL = filePath.URLByDeletingLastPathComponent
            let dir = (dirURL?.absoluteString)!.substringFromIndex(advance((dirURL?.absoluteString)!.startIndex, 7))
//            println(dir)
            
            let newFileName = newDateStr + ".\(ext!)"
//            println("New file name: \(newFileName)")
            
            let newFilePath = dir + newFileName
            
//            println("New file path: \(newFilePath)")
            
            let newFileURL = NSURL(fileURLWithPath: newFilePath)
            
//            println("New URL: \(newFileURL)")
            
            var err: NSError?
            var flag = NSFileManager.defaultManager().moveItemAtURL(filePath, toURL: newFileURL!, error: &err)
            println("Success: \(flag)")
            if flag == false {
                failNum++
            }
            if err != nil {
                println("Error: \(err)")
            }
        }
    }
}

func process(path: String) {
    
//    println("\(path)")
    
    if isPhoto(path) {
        changeFileName(path)
    } else {
        let fileManager = NSFileManager.defaultManager()
        let enumerator = fileManager.enumeratorAtPath(path)
//        println("\(enumerator?.nextObject())")
//        if enumerator?.allObjects == nil {
//            println("Not a directory")
//            return
//        }
        
        while let ele = enumerator?.nextObject() as? String {
//            println(ele)
            process(path+"/\(ele)")
            
        }
    }
}