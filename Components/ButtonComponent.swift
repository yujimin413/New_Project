//
//  ButtonComponent.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit


@IBDesignable
class ButtonComponent: UIButton {

    @IBInspectable //inspector 패널에서 사용될 수 있도록 설정
    var  cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
//    @IBOutlet weak var ButtonComponent: UIButton!
//
//    override init(frame: CGRect) {
//            super.init(frame: frame)
//            customInit()
//            //alternativeCustomInit()
//        }
//
//        required init?(coder: NSCoder) {
//            super.init(coder: coder)
//            customInit()
//            //alternativeCustomInit()
//        }
//
//        //방법 1: loadNibNamed(_:owner:options:) 사용
//        func customInit() {
//            if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
//                view.frame = self.bounds
//                addSubview(view)
//            }
//        }
//
//        //방법 2: UINib 생성 후 instantiate
//        func alternativeCustomInit() {
//            if let view = UINib(nibName: "CustomNavigationBar", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView {
//                view.frame = self.bounds
//                addSubview(view)
//            }
//        }
}

