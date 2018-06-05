//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by PengZK on 2018/6/5.
//  Copyright © 2018年 KUN. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dstVC = segue.destination
        if let navigationController = dstVC as? UINavigationController {
            dstVC = navigationController.visibleViewController ?? dstVC
        }
        if let faceViewController = dstVC as? FaceViewController,
            let identifier = segue.identifier,
            let expression = emotionalFaces[identifier] {
                faceViewController.expression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)!.currentTitle
        }
    }
    
    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "sad" : FacialExpression(eyes: .closed, mouth: .frown),
        "happy" : FacialExpression(eyes: .open, mouth: .smile),
        "worried" : FacialExpression(eyes: .open, mouth: .smirk)
    ]

}
