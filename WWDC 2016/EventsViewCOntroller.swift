//
//  EventsViewCOntroller.swift
//  WWDC 2016
//
//  Created by Joonwoo Kim on 2016. 6. 1..
//  Copyright © 2016년 Joonwoo Kim. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    
    @IBOutlet var bacButton: UIButton!
    
    @IBOutlet var EventsViewLabel: UIVisualEffectView!
    
    @IBOutlet var OSXLOGO: UIView!
    
    var timer = NSTimer()
    var counter = 0
    
    override func viewWillAppear(animated: Bool) {

        OSXLOGO.alpha = 0
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, animations: {
            self.OSXLOGO.alpha = 1
            
        })
    }
    @IBAction func goBack() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: #selector(EventsViewController.finished), userInfo: nil, repeats: true)
    }
    
    
    func finished() {
        
        counter += 1
        if counter == 1 {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
                self.view.backgroundColor = UIColor.whiteColor()
                self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
                self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
                self.OSXLOGO.alpha = 0
                }, completion: nil)
        }

        
        if counter == 2 {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Main") as UIViewController
            self.presentViewController(vc, animated: false, completion: nil)

        }
        
        if counter == 3 {
            
            counter == 0
            timer.invalidate()
        }
    }
}
