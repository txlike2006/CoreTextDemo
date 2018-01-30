//
//  CTFrameParser.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CTFrameParser: NSObject {
    
    class func parseContent(content: NSString, config: CTFrameParserConfig) -> CoreTextData {
        let attributes = self.attributesWithConfig(config: config)
        let contentString = NSAttributedString(string: content as String, attributes: attributes as! [String : Any])
        
        // 创建 CTFramesetterRef 实例
        let frameSetter = CTFramesetterCreateWithAttributedString(contentString)
        
        // 获得要绘制的区域的高度
        let restrictSize = CGSize(width: config.width, height: CGFloat.greatestFiniteMagnitude)
        let coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, 0), nil, restrictSize, nil)
        let textHeight = coreTextSize.height
        
        // 生成 CTFrameRef 实例
        let frame = self.createFrameWithFramesetter(framesetter: frameSetter, config: config, height: textHeight)
        
        // 将生成好的 CTFrameRef 实例和计算好的绘制高度保存到 CoreTextData 实例中，最后返回 CoreTextData 实例
        let data = CoreTextData()
        data.ctFrame = frame
        data.height = textHeight
        return data
    }
    
    class func attributesWithConfig(config: CTFrameParserConfig) -> NSDictionary {
        let fontSize = config.fontSize
        let fontRef = CTFontCreateWithName("ArialMT" as CFString?, fontSize, nil)
        var lineSpace = config.lineSpace
        
        var theSettings: [CTParagraphStyleSetting] =  [CTParagraphStyleSetting]()
        
        let theSettingLine = CTParagraphStyleSetting(spec: .lineSpacingAdjustment, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace)
        theSettings.append(theSettingLine)
        let theSettingMax = CTParagraphStyleSetting(spec: .maximumLineSpacing, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace)
        theSettings.append(theSettingMax)
        let theSettingMin = CTParagraphStyleSetting(spec: .minimumLineSpacing, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace)
        theSettings.append(theSettingMin)
        
        let theParagraphRef = CTParagraphStyleCreate(theSettings, 3)
        
        let textColor = config.textColor
        
        let dict = NSMutableDictionary()
        dict[kCTForegroundColorAttributeName] = textColor.cgColor
        dict[kCTFontAttributeName] = fontRef
        dict[kCTParagraphStyleAttributeName] = theParagraphRef
        
        return dict
    }
    
    class func createFrameWithFramesetter(framesetter: CTFramesetter, config: CTFrameParserConfig, height: CGFloat) -> CTFrame {
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: config.width, height: height))
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil)
        return frame
    }
}
