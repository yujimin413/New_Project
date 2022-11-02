//
//  HomeViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var addFolderButton: UIButton!
    
    let stickyIndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setFlowLayout()
    }
    
    // MARK: - Actions
    @IBAction func addFolderButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Helpers
    private func setupCollectionView() {
        // delegate 연결
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        // cell 등록
        // 프로필
        homeCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        // 폴더
        homeCollectionView.register(
            UINib(nibName: "FolderCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: FolderCollectionViewCell.identifier)
    }
    
    func setFlowLayout() {
        let columnLayout = CustomCollectionViewFlowLayout(stickyIndexPath: stickyIndexPath)
        self.homeCollectionView.collectionViewLayout = columnLayout
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // 섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 30
        }
    }

    // 셀 생성
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileCollectionViewCell.identifier,
                for: indexPath) as? ProfileCollectionViewCell else {
                    fatalError("셀 타입 캐스팅 실패...")
            }
            cell.index = indexPath.row
            return cell

        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FolderCollectionViewCell.identifier,
                for: indexPath) as? FolderCollectionViewCell else {
                    fatalError("셀 타입 캐스팅 실패...")
            }
            return cell
        }
    }

}

// for collectionView size 조절
extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(
                width: collectionView.frame.width,
                height: collectionView.frame.height * 35 / 670)

        default:
            return CGSize(
                width: collectionView.frame.width * 150 / 390,
                height: collectionView.frame.height * 150 / 673)
        }
    }
    // 열 간격
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(0)
        }
    }
    // 행 간격
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(10)
        }
    }
    // contentInset 상하좌우
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let interval = UIEdgeInsets(top: 5, left: 32, bottom: 5, right: 32)
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            return interval
        }
    }
}

