//
//  Data.swift
//  AnimalCrossingData
//
/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import UIKit
import SwiftUI
import CoreLocation

let seaCreatureData: SeaCreatureDict = load("sea.json")
let artData: ArtDict = load("art.json")
let bugData: BugDict = load("bugs.json")
let fishData: FishDict = load("fish.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func iconImage(name: String, subFolderPath: String) -> Image {
        let index = _guaranteeImage(name: name, subFolder: subFolderPath)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    func image(name: String, subFolderPath: String) -> Image {
        let index = _guaranteeImage(name: name, subFolder: subFolderPath)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String, subFolder: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png", subdirectory: subFolder),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String, subFolder: String) -> _ImageDictionary.Index
    {
        let key = "\(subFolder)/\(name)"
        if let index = images.index(forKey: key) { return index }
        
        images[key] = ImageStore.loadImage(name: name, subFolder: subFolder)
        return images.index(forKey: key)!
    }
}

