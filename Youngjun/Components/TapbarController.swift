//
//  TapbarController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation
import UIKit

class TapBarController: UITabBarController{
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2{
            NoticeRepository().getNoticeList()
        }
    }
    
}
