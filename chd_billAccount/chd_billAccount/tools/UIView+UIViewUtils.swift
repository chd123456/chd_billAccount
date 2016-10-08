//
//  UIView+UIViewUtils.swift
//  Erm_mobile_ios
//
//  Created by 孙龙霄 on 7/18/15.
//  Copyright © 2015 孙龙霄. All rights reserved.
//

import UIKit

extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size;
        }set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    var centerX:CGFloat{
        get{
            return self.center.x
        }set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    
    var centerY:CGFloat{
        get{
            return self.center.y
        }set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    func showMessage(message:NSString,animateDuration:Double)
    {
        let window = UIApplication.sharedApplication().keyWindow
        let showView = UIView()
        showView.backgroundColor = UIColor.blackColor()
        showView.frame = CGRectMake(1, 1, 1, 1);
        showView.alpha = 1.0;
        showView.layer.cornerRadius = 5.0;
        showView.layer.masksToBounds = true;
        window?.addSubview(showView)
        
        let label = UILabel()
        let attributesArray = [NSFontAttributeName:UIFont.systemFontOfSize(17),NSForegroundColorAttributeName:UIColor.lightGrayColor()]
        let labelSize:CGSize = message.sizeWithAttributes(attributesArray)

        label.frame = CGRectMake(10.0, 5.0, labelSize.width,labelSize.height);
        label.numberOfLines = 0
        label.text = message as String;
        label.textColor = UIColor.whiteColor();
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        label.backgroundColor = UIColor.clearColor();
        label.font = UIFont.boldSystemFontOfSize(15)
        showView.addSubview(label)
        showView.frame = CGRectMake((UIScreen.mainScreen().bounds.width - labelSize.width - 20.0)/2.0,  UIScreen.mainScreen().bounds.width - 200.0, labelSize.width+20.0, labelSize.height+10.0)
        UIView.animateWithDuration(animateDuration, animations: { () -> Void in
            showView.alpha = 0
            }) { (finished) -> Void in
                showView.removeFromSuperview()
        }
        
    }
    
    func drawDashLine(lineLength:Int, lineSpacing:Int, lineColor:UIColor, directHorizontal:Bool, width:CGFloat){
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        shapeLayer.position = CGPointMake( CGRectGetWidth(self.frame) / 2,  CGRectGetHeight(self.frame))
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = lineColor.CGColor
        
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [lineLength,lineSpacing]
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0)
        if directHorizontal {
            CGPathAddLineToPoint(path, nil, width, 0)
        }else{
            CGPathAddLineToPoint(path, nil, 0, width)
        }
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
    // MARK:拿到当前view所在的viewcontroller
    func viewController() ->UIViewController?{
        let vc:UIViewController?
        var next = self.superview
        while next != nil {
            
            let nextResponder = next?.nextResponder()
            if nextResponder!.isKindOfClass(UIViewController)
            {
                vc = nextResponder as?UIViewController
                return vc!
            }
            next = next!.superview
        }
        return nil;
    }
    
    
    
    
    
}