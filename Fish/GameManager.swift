//
//  GameManager.swift
//  Fish
//
//  Created by Quan on 6/29/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    var fishView : NSMutableArray?
    var hookView : HookerView?
    
    override init() {
        fishView = NSMutableArray()
        hookView = HookerView(frame: CGRectMake(0, -490, 20, 490))
        
    }
    
    func addFishToViewController(viewcontroller : UIViewController, width : Int) {
        let fishView = FishView(frame: CGRectMake(0, 0, 40, 30))
        fishView.generateFish(width)
        self.fishView?.addObject(fishView)
        viewcontroller.view.addSubview(fishView)
    }
    
    func bite(fishView : FishView) {
        if fishView.status != fishView.CAUGHT &&
           self.hookView?.status != self.hookView?.DRAWINGUP &&
           self.hookView?.status != self.hookView?.CAUGHTF {
            fishView.caught()
            print(fishView.frame.height)
            fishView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width / 2)
            self.hookView!.status = self.hookView!.CAUGHTF
        }
        
    }
    
    func updateMOVE() {
        self.hookView?.updateMOVE()
        for fishView in self.fishView! {
            fishView.updateMOVE()
            if CGRectContainsPoint(fishView.frame, CGPointMake((self.hookView?.center.x)!, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width / 2)) {
                    bite(fishView as! FishView)
            }
            
        }
    }
    
    func dropHookerAtX(x : Int) {
        self.hookView?.dropDownAtX(x)
    }
    
}

