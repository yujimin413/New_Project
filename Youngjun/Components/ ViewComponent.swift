//
//  ButtonComponent.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit


@IBDesignable
class ViewComponent: UIButton {


    @IBInspectable //inspector 패널에서 사용될 수 있도록 설정
    var  cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

