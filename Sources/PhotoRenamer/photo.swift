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
    let filePath = NSURL(fileURLWithPath: path)
    
    let img = CGImageSourceCreateWithURL(filePath, nil)
    if img == nil {
        print("File \(filePath) doesn't exist.")
        exit(0)
    }
    
    if let exif = CGImageSourceCopyPropertiesAtIndex(img!, 0, nil) as NSDictionary? {
        print(exif)
        if let tiff = exif[kCGImagePropertyTIFFDictionary as String] as! NSDictionary? {
//            print(tiff)
            
            let datetimeStrOpt = tiff[kCGImagePropertyTIFFDateTime as String] as? String
            
            if let datetimeStr = datetimeStrOpt {
                //            println(datetimeStr)
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy:MM:dd HH:mm:ss"
                let date = dateFormater.date(from: datetimeStr)
                dateFormater.dateFormat = "yyyy-MM-dd HH.mm.ss"
                let newDateStr = dateFormater.string(from: date!)
                //            println(newDateStr)
                
//                let filename = ((filePath.lastPathComponent)! as NSString).deletingPathExtension
                //            println(filename)
                let ext = filePath.pathExtension
                //            println(ext)
                let dirURL = filePath.deletingLastPathComponent
//                let dir = (dirURL?.absoluteString)!.substringFromIndex((dirURL?.absoluteString)!.startIndex.advancedBy(7))
                let absString = dirURL!.absoluteString
                let dirStr = absString[absString.index(absString.startIndex, offsetBy: 7)..<absString.endIndex]
                //            println(dir)
                
                let newFileName = newDateStr + ".\(ext!)"
                //            println("New file name: \(newFileName)")
                
                let newFilePath = dirStr + newFileName
                
                //            println("New file path: \(newFilePath)")
                
                let newFileURL = NSURL(fileURLWithPath: String(newFilePath))
                
                //            println("New URL: \(newFileURL)")
                
                var err: NSError?
                var flag: Bool
                do {
                    try FileManager.default.moveItem(at: filePath as URL, to: newFileURL as URL)
                    flag = true
                } catch let error as NSError {
                    err = error
                    flag = false
                }
                print("Success: \(flag)")
                if flag == false {
                    failNum += 1
                }
                if err != nil {
                    print("Error: \(String(describing: err))")
                }
            }
        }
    }
}

func process(path: String) {
    
    //    println("\(path)")
    
    if isPhoto(filename: path) {
        changeFileName(path: path)
    } else {
        let fileManager = FileManager.default
        let enumerator = fileManager.enumerator(atPath: path)
        //        println("\(enumerator?.nextObject())")
        //        if enumerator?.allObjects == nil {
        //            println("Not a directory")
        //            return
        //        }
        
        while let ele = enumerator?.nextObject() as? String {
            //            println(ele)
            process(path: path+"/\(ele)")
            
        }
    }
}
