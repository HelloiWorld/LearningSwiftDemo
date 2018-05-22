//
//  PeiqiView.swift
//  FaceIt
//
//  Created by PengZK on 2018/5/21.
//  Copyright © 2018年 KUN. All rights reserved.
//

import UIKit

@IBDesignable
class PeiqiView: UIView {

    var scale : CGFloat = 0.5
    
    var lineWidth : CGFloat = 4.0
    
    var bgColor : UIColor = UIColor(red: 255 / 255.0, green: 179 / 255.0, blue: 218 / 255.0, alpha: 1.0)
    var borderColor : UIColor = UIColor(red: 239 / 255.0, green: 150 / 255.0, blue: 194 / 255.0, alpha: 1.0)
    
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    private var skullCenter: CGPoint {
        return  CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private enum Ear {
        case left
        case right
    }
    
    private func drawPathForEye(_ eye: Eye)
    {
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? 0 : 2) * eyeOffset
            return eyeCenter
        }
        
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        path.lineWidth = lineWidth
        UIColor.white.setFill()
        path.fill()
        
        let eyeballRadius = eyeRadius * 0.4
        let eyeballPath = UIBezierPath(arcCenter: CGPoint(x: eyeCenter.x - eyeballRadius - 1, y: eyeCenter.y - 1), radius: eyeballRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        UIColor.black.setFill()
        eyeballPath.fill()
        
        path.stroke()
    }
    
    private func drawPathForMouth()
    {
        let mouthWidth = skullRadius / Ratios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.skullRadiusToMouthOffset
        
        let mouthRect = CGRect(
            x: skullCenter.x - mouthWidth * 0,
            y: skullCenter.y + mouthOffset,
            width: mouthWidth,
            height: mouthHeight
        )
        
        let smileOffset_down = 1.0 * mouthRect.height
        let smileOffset_up = 0.5 * mouthRect.height
        
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.midY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.midY)
        
        let path = UIBezierPath()
        path.move(to: start)
//        let cp1 = CGPoint(x: start.x + mouthRect.width / 3, y: start.y + smileOffset_down)
//        let cp2 = CGPoint(x: end.x - mouthRect.width / 3, y: start.y + smileOffset_down)
//        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.addQuadCurve(to: end, controlPoint: CGPoint(x: start.x + mouthRect.width / 2, y: start.y + smileOffset_down))
        path.move(to: end)
        path.addQuadCurve(to: start, controlPoint: CGPoint(x: start.x + mouthRect.width / 2, y: start.y + smileOffset_up))
    
        path.lineWidth = lineWidth
        
        UIColor.black.setFill()
        path.fill()
        UIColor(red: 206 / 255.0, green: 66 / 255.0, blue: 118 / 255.0, alpha: 1).setStroke()
        path.stroke()
    }
    
    private func drawPathForSkull()
    {
        let path = UIBezierPath(ovalIn: CGRect(x: skullCenter.x - skullRadius * 0.7, y: skullCenter.y - skullRadius * 0.4, width: skullRadius * 2.0, height: skullRadius * 1.5))
        path.lineWidth = lineWidth
        bgColor.setFill()
        path.fill()
        path.stroke()
        
        let blankPath = UIBezierPath(rect: CGRect(x: skullCenter.x - skullRadius * 0.8, y: skullCenter.y + skullRadius * 0.2, width: skullRadius, height: skullRadius))
        UIColor.white.setFill()
        blankPath.fill()
        
        let linePath1 = UIBezierPath()
        linePath1.lineWidth = lineWidth
        
        let start = CGPoint(x: skullCenter.x - skullRadius * 0.7, y: skullCenter.y + skullRadius * 0.2)
        let end1 = CGPoint(x: skullCenter.x - skullRadius * 0.1, y: skullCenter.y + skullRadius * 0.4)
        let end2 = CGPoint(x: skullCenter.x + skullRadius * 0.2 + 1, y: skullCenter.y + skullRadius + 9)
        
        linePath1.move(to: start)
        linePath1.addQuadCurve(to: end1, controlPoint: CGPoint(x: skullCenter.x - skullRadius * 0.6, y: skullCenter.y + skullRadius * 0.5))
        linePath1.move(to: CGPoint(x: skullCenter.x - skullRadius * 0.15, y: skullCenter.y + skullRadius * 0.4))
        linePath1.addQuadCurve(to: end2, controlPoint: CGPoint(x: skullCenter.x - skullRadius * 0.2, y: skullCenter.y + skullRadius * 0.9))
        bgColor.setFill()
        linePath1.fill()
        linePath1.stroke()
        
        let linePath2 = UIBezierPath()
        linePath2.lineWidth = 0
        linePath2.move(to: CGPoint(x: skullCenter.x + skullRadius * 0.2, y: skullCenter.y + skullRadius + 7))
        linePath2.addLine(to: CGPoint(x: skullCenter.x + skullRadius * 0.2 + 1, y: skullCenter.y + skullRadius * 0.2))
        linePath2.addLine(to: CGPoint(x: skullCenter.x - skullRadius * 0.7, y: skullCenter.y + skullRadius * 0.2 - 2))
        linePath2.addLine(to: CGPoint(x: skullCenter.x - skullRadius * 0.15 - 1, y: skullCenter.y + skullRadius * 0.4))
//        linePath2.close()
        bgColor.setFill()
        linePath2.fill()
    }
    
    private func drawPathForEar(_ ear: Ear)
    {
        func centerOfEar(_ ear: Ear) -> CGPoint {
            let earOffset = skullRadius / Ratios.skullRadiusToEarOffset
            var earCenter = CGPoint(x: skullCenter.x, y: skullCenter.y - skullRadius * 0.4)
            earCenter.y -= 0.5 * earOffset
            earCenter.x += ((ear == .left) ? 1 : 3) * earOffset
            return earCenter
        }
        
        let earRadius = skullRadius / Ratios.skullRadiusToEarRadius
        let earCenter = centerOfEar(ear)
        
        let path = UIBezierPath(ovalIn: CGRect(x: earCenter.x - earRadius, y: earCenter.y - earRadius, width: earRadius, height: earRadius * 2.0))
        path.lineWidth = lineWidth
        bgColor.setFill()
        path.fill()
        path.stroke()
    }
    
    private func drawPathForNose()
    {
        let path = UIBezierPath(ovalIn: CGRect(x: skullCenter.x - 66, y: skullCenter.y - 4, width: 30, height: 40))
        path.lineWidth = lineWidth
        //旋转
//        path.apply(CGAffineTransform(rotationAngle: -0.6 / 180.0 * CGFloat.pi))
        bgColor.setFill()
        path.fill()
        
        let nostrilPath = UIBezierPath(ovalIn: CGRect(x: skullCenter.x - 62, y: skullCenter.y + 13, width: 8, height: 8))
        UIColor(red: 213 / 255.0, green: 97 / 255.0, blue: 144 / 255.0, alpha: 1).setFill()
        nostrilPath.fill()
        
        let nostrilPath_right = UIBezierPath(ovalIn: CGRect(x: skullCenter.x - 51, y: skullCenter.y + 10, width: 8, height: 8))
        UIColor(red: 213 / 255.0, green: 97 / 255.0, blue: 144 / 255.0, alpha: 1).setFill()
        nostrilPath_right.fill()
       
        path.stroke()
    }
    
    private func drawPathForBlusher()
    {
        let path = UIBezierPath(ovalIn: CGRect(x: skullCenter.x + 68, y: skullCenter.y - 10, width: 33, height: 40))
        UIColor(red: 255 / 255.0, green: 139 / 255.0, blue: 199 / 255.0, alpha: 0.6).setFill()
        path.fill()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        borderColor.setStroke()
        // 耳朵
        drawPathForEar(.left)
        drawPathForEar(.right)
        // 脑壳
        drawPathForSkull()
        // 眼睛👀
        drawPathForEye(.left)
        drawPathForEye(.right)
        // 鼻子
        drawPathForNose()
        // 腮红
        drawPathForBlusher()
        // 嘴巴
        drawPathForMouth()
        self.layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat.pi * 30 / 180.0, 0, 0, 1)
    }
    
    private struct Ratios {
        static let skullRadiusToEyeOffset: CGFloat = 6
        static let skullRadiusToEyeRadius: CGFloat = 9
        static let skullRadiusToEarOffset: CGFloat = 5
        static let skullRadiusToEarRadius: CGFloat = 4
        static let skullRadiusToMouthWidth: CGFloat = 1.4
        static let skullRadiusToMouthHeight: CGFloat = 1.7
        static let skullRadiusToMouthOffset: CGFloat = 4.8
    }

}
