//
//  FacialExpression.swift
//  FaceIt
//
//  Created by PengZK on 2018/5/23.
//  Copyright © 2018年 KUN. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes: Int {
        case open
        case closed
        case squinting // 眯眼
    }
    
    enum Mouth: Int {
        case frown // 噘嘴
        case smirk // 讥笑
        case neutral // ——
        case grin // 咧嘴笑
        case smile // 大笑
        
        var sadder: Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    let eyes: Eyes
    let mouth: Mouth
    
    var sadder : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    
    var happier : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
}
