//
//  Parser.swift
//  Food
//
//  Created by jinshenghao on 2022/11/16.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

let userInfoData: [User] = load("UserInfo.json")
let commentData: [Comment] = load("Comment.json")
let issueData: [Issue] = load("Issue.json")
let preferData:[UserPreference] = load("Article.json")

let ddd : Bool = initMyself()


func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}


func getImageFromCache(str:String) -> Image {
     let filename = getDocumentsDirectory().appendingPathComponent("\(str).jpg")
     
     let imgData = try! Data(contentsOf: filename)
     return Image(uiImage: UIImage(data: imgData)!)
    
        //self.getImage.append(Image(uiImage: t))
 }

func loadImageInToCache(str:String, uploadImg:UIImage){
    let filename = getDocumentsDirectory().appendingPathComponent("\(str).jpg")
    if let data = uploadImg.jpegData(compressionQuality: 0.8) {
        try? data.write(to: filename)
    }
    print("\(str) has load into cache")
}



func initMyself() -> Bool{
    print("init sucess")
    let sanboxfilename = getDocumentsDirectory().appendingPathComponent("Comment.json")

    
    if !FileManager.default.fileExists(atPath: sanboxfilename.path) {
        for s in commentData {
                let imageNameStd = s.commentImageName
                
                let path = Bundle.main.path(forResource: imageNameStd, ofType: "jpg")
                let newImage = UIImage(contentsOfFile: path!)!
                loadImageInToCache(str: imageNameStd, uploadImg: newImage)
        }
    }
    
    
    
    print("init sucess")

    
    
    return true
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    /*
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
     else {
         fatalError("Couldn't find \(filename) in main bundle.")
     }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }*/
    
    
    
    let sanboxfilename = getDocumentsDirectory().appendingPathComponent(filename)

    
    if FileManager.default.fileExists(atPath: sanboxfilename.path) {
        data = try! Data.init(contentsOf: sanboxfilename)
    } else {
         guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
         else {
             fatalError("Couldn't find \(filename) in main bundle.")
         }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }
  

    
    
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


final class ImageStore {
    typealias _ImageDictionary = [String: Image]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return images.values[index]
    }

    static func loadImage(name: String) -> Image {
       
        return getImageFromCache(str:name)
        
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
