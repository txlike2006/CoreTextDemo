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
      //  path.addRect(self.bounds)
        path.addEllipse(in: self.bounds)
        
        // 4. 文本
        let str = "Hello World! 创建绘制的区域，CoreText 本身支持各种文字排版的区域，我们这里简单地将 UIView 的整个界面作为排版的区域。 为了加深理解，建议读者将该步骤的代码替换成如下代码， 测试设置不同的绘制区域带来的界面变化。"
        let mutableAttrStr = NSMutableAttributedString(string: str)
        //设置行间距
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let frameSetter = CTFramesetterCreateWithAttributedString(mutableAttrStr)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, mutableAttrStr.length), path, nil)
        CTFrameDraw(frame, context!)
    }
    
}
