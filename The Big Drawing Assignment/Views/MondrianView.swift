//
//  MondorianView.swift
//  The Big Drawing Assignment
//
//  Created by Student on 11/22/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MondrianView: UIView {

    var drawFilledColorRects:Bool = true
    
    override func draw(_ rect: CGRect) {
        //        // iterate through TapArchive.shared[i]
        guard MondrianModel.shared.numRects() > 0 else {
            return
        }
        
        
        
        for i in 0 ..< MondrianModel.shared.numRects(){
            let rect = MondrianModel.shared[i]
            
            let path = UIBezierPath(rect: rect.rect)
            
            if drawFilledColorRects{
                rect.color.setFill()
                path.fill()
            }else{
                rect.color.setStroke()
                path.stroke()
            }
        }
        
        
    }
    

}
