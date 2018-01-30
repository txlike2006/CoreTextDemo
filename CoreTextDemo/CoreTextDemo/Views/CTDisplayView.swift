//
//  CTDisplayView.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CTDisplayView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 1.获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 2.转换坐标
        context?.textMatrix = .identity
        context?.translateBy(x: 0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        // 3获取路径
        let path = CGMutablePath()
        path.addRect(self.bounds)
        
        // 4. 文本
        let str = "Hello world"
        let mutableAttrStr = NSMutableAttributedString(string: str)
        //设置行间距
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let frameSetter = CTFramesetterCreateWithAttributedString(mutableAttrStr)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, mutableAttrStr.length), path, nil)
        CTFrameDraw(frame, context!)
    }
    
}
