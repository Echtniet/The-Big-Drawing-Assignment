//
//  FirstViewController.swift
//  The Big Drawing Assignment
//
//  Created by Student on 11/22/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MondrianViewController: UIViewController {
    
    var mondrianView:MondrianView!
    let rectsToAdd = 50
    @IBOutlet weak var drawFilledColorRectsSWI: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Mondrian"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clear))
        
        mondrianView = (self.view.viewWithTag(100) as! MondrianView)
        mondrianView.layer.borderWidth = 2
        mondrianView.layer.borderColor = UIColor.green.cgColor
        
        MondrianModel.shared.generate(numberOfColorRects: rectsToAdd, bounds: CGRect(x: 0, y: 0, width: mondrianView.frame.width, height: mondrianView.frame.height))
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        mondrianView.addGestureRecognizer(tapGR)
        
        drawFilledColorRectsSWI.addTarget(self, action: #selector(toggledFill), for: .valueChanged)
    }
    
    @objc func refresh(){
        MondrianModel.shared.generate(numberOfColorRects: rectsToAdd, bounds: CGRect(x: 0, y: 0, width: mondrianView.frame.width, height: mondrianView.frame.height))
        mondrianView.setNeedsDisplay()
    }
    
    @objc func clear(){
        MondrianModel.shared.clearColorRects()
        mondrianView.setNeedsDisplay()
    }
    
    @objc func tap(_ sender:UITapGestureRecognizer){
        let point = sender.location(in: mondrianView)
        print("in tap: \(point)")
        MondrianModel.shared.deleteColorRect(atPoint: point)
        mondrianView.setNeedsDisplay()
    }
    
    @objc func toggledFill(){
        if drawFilledColorRectsSWI.isOn{
            mondrianView.drawFilledColorRects = true
        }else{
            mondrianView.drawFilledColorRects = false
        }
        mondrianView.setNeedsDisplay()
    }
    
    
}

