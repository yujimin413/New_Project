//
//  ProfileImageComponent.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation
import UIKit

@IBDesignable
class ProfileImageComponent: UIImageView {


    @IBInspectable //inspector 패널에서 사용될 수 있도록 설정
    var  cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = self.frame.height/2
        }
    }
}
