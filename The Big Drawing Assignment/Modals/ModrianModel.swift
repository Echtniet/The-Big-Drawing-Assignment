//
//  ModrianModel.swift
//  The Big Drawing Assignment
//
//  Created by Student on 11/22/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

struct ColorRect{
    var rect:CGRect
    var color:UIColor
}

class MondrianModel {
    private var colorRects:[ColorRect]
    
    
    private static var _shared:MondrianModel!
    
    static var shared:MondrianModel{
        if _shared == nil{
            _shared = MondrianModel()
        }
        return _shared
    }
    
    func numRects()-> Int{
        return colorRects.count
    }
    
    subscript(i:Int)-> ColorRect{
        if i >= numRects(){
            return ColorRect(rect: CGRect.zero, color: UIColor.black)
        }
        return colorRects[i]
    }
    
    func deleteColorRect(atIndex i:Int) throws{
        guard i > 0 else{
            throw Arrays.NegativeIndex
        }
        guard i < numRects() else{
            throw Arrays.IndexTooLarge
        }
        colorRects.remove(at: i)
    }
    
    func deleteColorRect(atPoint:CGPoint){
        for i in stride(from: 0, to: numRects(), by:  1){
            
            let startX = colorRects[i].rect.origin.x
            let endX = colorRects[i].rect.origin.x + colorRects[i].rect.size.width
            let startY = colorRects[i].rect.origin.y
            let endY = colorRects[i].rect.origin.y + colorRects[i].rect.size.height
            print(atPoint)
            print(startX, endX, startY, endY)
            if  atPoint.x >= startX && atPoint.x <= endX && atPoint.y >= startY && atPoint.y <= endY{
                print("Deleted rectangle \(i)")
                colorRects.remove(at: i)
                return
            }
        }
    }
    
    func clearColorRects(){
        colorRects.removeAll()
    }
    
    func generate(numberOfColorRects:Int, bounds:CGRect){
        colorRects = []
        let colors:[UIColor] = [.gray, .green, .blue, .orange, .yellow, .cyan, .magenta, .red, .purple, .brown]
        for _ in stride(from: 0, to: numberOfColorRects, by: 1){
            colorRects.append(ColorRect(rect: CGRect(x: CGFloat.random(in: 0 ..< bounds.width), y: CGFloat.random(in: 0 ..< bounds.height), width: CGFloat.random(in: 0 ..< bounds.width), height: CGFloat.random(in: 0 ..< bounds.height)), color: colors[Int.random(in: 0 ..< colors.count)]))
        }
    }
    
    
    
    private init(){
        colorRects = []
    }
}

enum Arrays:Error{
    case NegativeIndex, IndexTooLarge
}
