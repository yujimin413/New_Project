//
//  ShowFolderMorePopUpViewController.swift
//  LinkFolder
//
//  Created by 유지민 on 2022/11/01.
//

import UIKit

class ShowFolderMorePopUpViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var shareFolderButton: UIButton!
    @IBOutlet weak var changeFolderNameButton: UIButton!
    @IBOutlet weak var deleteFolderButton: UIButton!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareFolderButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "ShareFolder", bundle: nil)
        let shareFolderVC = storyboard.instantiateViewController(withIdentifier: "ShareFolderVC")
        shareFolderVC.modalPresentationStyle = .overFullScreen
        self.present(shareFolderVC, animated: true, completion: nil)
        
    }
    
    @IBAction func changeFolderNameButtonDidTap(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "ChangeFolderNamePopUp", bundle: nil)
        let changeFolderNamePopUpVC = storyboard.instantiateViewController(withIdentifier: "ChangeFolderNamePopUpVC")
        changeFolderNamePopUpVC.modalPresentationStyle = .overCurrentContext
        
        // 현재 더보기 팝업뷰 내리고 폴더명 변경 팝업뷰 띄우기
        guard let pvc = self.presentingViewController else { return }
        
        self.dismiss(animated: true) {
          pvc.present(changeFolderNamePopUpVC, animated: true, completion: nil)
        }
        
        // 폴더명 변경 팝업 띄우기
//        let storyboard = UIStoryboard.init(name: "ChangeFolderNamePopUp", bundle: nil)
//        let changeFolderNamePopUpVC = storyboard.instantiateViewController(withIdentifier: "ChangeFolderNamePopUpVC")
//        changeFolderNamePopUpVC.modalPresentationStyle = .overCurrentContext
//        self.present(changeFolderNamePopUpVC, animated: true, completion: nil)
        
    }
    
    @IBAction func deleteFolderButtonDidTap(_ sender: Any) {
        
        let alert = UIAlertController(title: "알림", message: "해당 폴더를 정말 삭제하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .destructive) {
            (action) in
            print("폴더 삭제 api 호출")
//            MyprojectDataManager().deleteMyPost(self, projectId)
//            self.myProjectListReload()
            self.dismiss(animated: true, completion: nil)
        }
//                MyprojectDataManager().deleteMyPost(self, projectId)
//                setupData()
        let cancel = UIAlertAction(title: "아니오", style: .cancel) {
            (action) in
            print("폴더 삭제 안 함")
        }

        alert.addAction(ok)
        alert.addAction(cancel)

        present(alert, animated: true)
        
        // 폴더 삭제 API 호출
//        self.dismiss(animated: true, completion: nil)
    }
    
}
