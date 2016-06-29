//
//  ViewController.swift
//  Fish
//
//  Created by Quan on 6/29/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameManager : GameManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHandle(_:))))
        NSTimer.scheduledTimerWithTimeInterval(0.025, target: self.gameManager!, selector: "updateMOVE", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_Reset(sender: AnyObject) {
        self.gameManager?.fishView?.removeAllObjects()
        for object in self.view.subviews {
            if object.isKindOfClass(FishView) {
                object.removeFromSuperview()
            }
        }
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
    }

    @IBAction func btn_AddFish(sender: AnyObject) {
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
    }
    
    func tapHandle(sender: UITapGestureRecognizer) {
        let tapPoint = sender.locationInView(self.view)
        self.gameManager?.dropHookerAtX(Int(tapPoint.x))
    }
}

