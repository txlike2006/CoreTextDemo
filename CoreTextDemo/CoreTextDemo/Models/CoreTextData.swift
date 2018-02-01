//
//  CoreTextData.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CoreTextData: NSObject {
    
    var ctFrame: CTFrame?
    var height: CGFloat?
    
    var imageArray: NSArray? {
        set {
            self.imageArray = newValue
            self.fillImagePosition()
        }
        get {
            return self.imageArray
        }
    }
    
    func fillImagePosition() {
        if self.imageArray?.count == 0 {
            return
        }
        let lines = CTFrameGetLines(self.ctFrame!) as NSArray
        var originsArray = [CGPoint](repeating: CGPoint.zero, count:lines.count)
        CTFrameGetLineOrigins(self.ctFrame!, CFRangeMake(0, 0), &originsArray)
        
        var imgIndex = 0
        guard (self.imageArray?[imgIndex]) != nil else {
            return
        }
        for i in 0 ..< lines.count {
            
            let line = lines[i] as! CTLine
            let runObjectArray = CTLineGetGlyphRuns(line) as NSArray
            for runObject in runObjectArray {
                let run = runObject as! CTRun
                let runAttributes = CTRunGetAttributes(run) as NSDictionary
                let delegate = (runAttributes.object(forKey: kCTRunDelegateAttributeName) as! CTRunDelegate)
                let metaDic = CTRunDelegateGetRefCon(delegate)
                var runBounds: CGRect = CGRect()
                var ascent: CGFloat = CGFloat()
                var descent: CGFloat = CGFloat()
                
                runBounds.size.width = CGFloat(CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, nil))
                runBounds.size.height = ascent + descent;
                
                let xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, nil)
                runBounds.origin.x = originsArray[i].x + xOffset;
                runBounds.origin.y = originsArray[i].y;
                runBounds.origin.y -= descent;
                
                let pathRef = CTFrameGetPath(self.ctFrame!);
                let colRect = pathRef.boundingBox;
                let delegateBounds = runBounds.offsetBy(dx: colRect.origin.x, dy: colRect.origin.y);
                let  imageData = self.imageArray?[imgIndex] as! CoreTextImageData
                imageData.imagePosition = delegateBounds;
                imgIndex += 1;
            }
            
        }
    }
    
}
