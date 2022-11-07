//
//  ShowLinkMorePopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ShowLinkMorePopUpViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editLinkButton: UIButton!
    @IBOutlet weak var shareLinkButton: UIButton!
    @IBOutlet weak var deleteLinkButton: UIButton!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editLinkButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func shareLinkButtonDidTap(_ sender: Any) {
//        let storyboard = UIStoryboard.init(name: "ShareLink", bundle: nil)
//        let shareLinkVC = storyboard.instantiateViewController(withIdentifier: "ShareLinkVC")
//        shareLinkVC.modalPresentationStyle = .overFullScreen
//        self.present(shareLinkVC, animated: true, completion: nil)
        
    }
    
    @IBAction func deleteLinkButtonDidTap(_ sender: Any) {
        let alert = UIAlertController(title: "알림", message: "해당 링크를 정말 삭제하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .destructive) {
            (action) in
            print("링크 삭제 api 호출")
//            MyprojectDataManager().deleteMyPost(self, projectId)
//            self.myProjectListReload()
            self.dismiss(animated: true, completion: nil)
        }
//                MyprojectDataManager().deleteMyPost(self, projectId)
//                setupData()
        let cancel = UIAlertAction(title: "아니오", style: .cancel) {
            (action) in
            print("링크 삭제 안 함")
        }

        alert.addAction(ok)
        alert.addAction(cancel)

        present(alert, animated: true)
        
        // 폴더 삭제 API 호출
//        self.dismiss(animated: true, completion: nil)
        
    }
    
}
