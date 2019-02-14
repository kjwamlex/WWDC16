//
//  ViewController.swift
//  WWDC 2016
//
//  Created by Joonwoo Kim on 2016. 5. 30..
//  Copyright © 2016년 Joonwoo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var WWDCLOGOIMAGE: UIImageView!
    @IBOutlet var IMAGECONSTRAINTS: NSLayoutConstraint!
    @IBOutlet var button1View: UIVisualEffectView!
    @IBOutlet var button2View: UIVisualEffectView!
    @IBOutlet var button3View: UIVisualEffectView!
    @IBOutlet var button4View: UIVisualEffectView!
    
    var timer = NSTimer()
    var counter = 0
    
    
    func ParallaxViewforBackground(vw: UIView) {
        let amount = 15
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }


    override func viewWillAppear(animated: Bool) {
        WWDCLOGOIMAGE.transform = CGAffineTransformMakeScale(20, 20)
        self.button1View.transform = CGAffineTransformMakeTranslation(0, 1000)
        self.button2View.transform = CGAffineTransformMakeTranslation(0, 1000)
        self.button3View.transform = CGAffineTransformMakeTranslation(0, 1000)
        self.button4View.transform = CGAffineTransformMakeTranslation(0, 1000)
        IMAGECONSTRAINTS.constant = 400
        
        ParallaxViewforBackground(WWDCLOGOIMAGE)
        ParallaxViewforBackground(button1View)
        ParallaxViewforBackground(button2View)
ParallaxViewforBackground(view)
        
        ParallaxViewforBackground(button3View)
        ParallaxViewforBackground(button4View)

        
        self.button1View.layer.cornerRadius = 15
        self.button1View.clipsToBounds = true
        self.button2View.layer.cornerRadius = 15
        self.button2View.clipsToBounds = true
        self.button3View.layer.cornerRadius = 15
        self.button3View.clipsToBounds = true
        self.button4View.layer.cornerRadius = 15
        self.button4View.clipsToBounds = true
        self.view.layoutIfNeeded()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidAppear(animated: Bool) {
        
        self.IMAGECONSTRAINTS.constant = -100

        UIView.animateWithDuration(0.75, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.button1View.transform = CGAffineTransformMakeTranslation(0, 0)
            self.WWDCLOGOIMAGE.transform = CGAffineTransformMakeScale(1, 1)
            self.view.layoutIfNeeded()

            }, completion: nil)
        
        
        UIView.animateWithDuration(0.75, delay: 0.35, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.button2View.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.75, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.button3View.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
        UIView.animateWithDuration(0.75, delay: 0.45, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.button4View.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)

    }

    
    
    @IBAction func goEvents() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: #selector(ViewController.finished), userInfo: nil, repeats: true)
        
       // self.IMAGECONSTRAINTS.constant = 350
        
        
        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    func finished() {
        
        counter += 1
        
        if counter == 1 {
            UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
                
                self.view.transform = CGAffineTransformMakeScale(15, 15)
                
                }, completion: nil)
            UIView.animateWithDuration(0.75, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
                
               // self.WWDCLOGOIMAGE.image = UIImage(named: "1920x1080-black-solid-color-background.jpg")
                }, completion: nil)

        }
        
        
        if counter == 2 {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Temp") as UIViewController
            self.presentViewController(vc, animated: false, completion: nil)
        }
        
        if counter == 3 {
            
            timer.invalidate()
            counter == 0
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

