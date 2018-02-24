//
//  ViewController.swift
//  PanGestureDay7
//
//  Created by Payal Nigade on 15/02/18.
//  Copyright © 2018 Payal Nigade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(dragImageView))
        ballImageView.isUserInteractionEnabled = true
        ballImageView.alpha = 0.7
        ballImageView.addGestureRecognizer(panGesture)
    }
    
    
    @objc func dragImageView(sender : UIPanGestureRecognizer){
        ballImageView.alpha = 1.0
        self.view.bringSubview(toFront: ballImageView)
        let translation = sender.translation(in: ballImageView)
        ballImageView.center = CGPoint(x: ballImageView.center.x + translation.x, y: ballImageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: ballImageView)
        
        if sender.state == .ended{
             ballImageView.alpha = 0.7
            let x = self.view.bounds.width / 2
            let y = self.view.bounds.height / 2
            let point = CGPoint(x:x , y:y)
            
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: UIViewAnimationOptions.curveEaseOut,
                           animations: {self.ballImageView.center = point },
                           completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

