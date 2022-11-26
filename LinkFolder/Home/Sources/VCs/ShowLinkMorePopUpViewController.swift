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
    
    var delegate: LinkReloadDelegate?
    
    var linkUrl: String = ""
    var linkIdx: Int!
    var linkAlias: String = ""
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(linkUrl)
//        print(linkIdx)
//        print(linkAlias)

    }
    
    // MARK: - Actions
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func editLinkButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "EditLink", bundle: nil)
        let editLinkVC = storyboard.instantiateViewController(withIdentifier: "EditLinkVC") as! EditLinkViewController
//        shareFolderVC.modalPresentationStyle = .overFullScreen
        editLinkVC.delegate = self.delegate
        
        
        // 링크 인덱스 전달
        editLinkVC.linkUrl = self.linkUrl
        editLinkVC.linkIdx = self.linkIdx
        editLinkVC.linkAlias = self.linkAlias
        
        // 현재 링크 더보기 팝업뷰 내리고 링크 변경 뷰 띄우기
        guard let pvc = self.presentingViewController else { return }
        
        self.dismiss(animated: true) {
          pvc.present(editLinkVC, animated: false, completion: nil)
        }
        
    }
    
    @IBAction func shareLinkButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "ShareLink", bundle: nil)
        let shareLinkVC = storyboard.instantiateViewController(withIdentifier: "ShareLinkVC")
        shareLinkVC.modalPresentationStyle = .overFullScreen
        self.present(shareLinkVC, animated: false, completion: nil)
        
    }
    
    @IBAction func deleteLinkButtonDidTap(_ sender: Any) {
        let alert = UIAlertController(title: "알림", message: "해당 링크를 정말 삭제하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .destructive) {
            (action) in
            print("링크 삭제 api 호출")
            self.deleteLinkButtonTapped(input: self.linkIdx) {
                self.delegate?.setupLinkData()
                self.dismiss(animated: false, completion: nil)
            }
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel) {
            (action) in
            print("링크 삭제 안 함")
        }

        alert.addAction(ok)
        alert.addAction(cancel)

        present(alert, animated: true)
        
    }
    
    func deleteLinkButtonTapped(input: Int, completion: @escaping () -> Void) {
        LinkDeleteRepository().deleteLink(self.linkIdx, completion)
    }
    
}
