//
//  HomeViewController.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/10/18.
//

import UIKit

protocol HomeReloadDelegate {
    func setupFolderData()
}

protocol FolderCollectionViewCellDelegate {
    func folderMoreButtonDidTap(name: UILabel, _ collectionViewCell: UICollectionViewCell)
}

class HomeViewController: UIViewController, HomeReloadDelegate {
    // MARK: - Properties
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var addFolderButton: UIButton!
    
    let refreshControl = UIRefreshControl()
    
    let stickyIndexPath = IndexPath(row: 0, section: 0)
    
    var folderData: [contents]? {
        didSet { self.homeCollectionView.reloadData()}
    }
    
    var selectedFolderIndex: Int?
    var selectedFolderName: String?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setFlowLayout()
        setupFolderData()
        initRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FoldersListRepository().getFoldersList(self)
    }
    
    // 폴더 리스트 불러오기
    func setupFolderData() {
        print("폴더 리스트 불러오기")
        FoldersListRepository().getFoldersList(self)
    }
    
    // MARK: - Actions
    
    func initRefreshControl(){
        homeCollectionView.refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView(refreshControl:)), for: .valueChanged)
        homeCollectionView.refreshControl = refreshControl
    }
    
    @objc func refreshTableView(refreshControl:
    UIRefreshControl){
        print("새로고침!")
        
        DispatchQueue.main.asyncAfter(deadline: .now()){
            FoldersListRepository().getFoldersList(self)
            refreshControl.endRefreshing()
        }
    }
    
    @IBAction func addFolderButtonTapped(_ sender: Any) {
        // 링크 폴더 추가 팝업뷰
        let storyboard = UIStoryboard.init(name: "AddLinkFolder", bundle: nil)
        let addFolderPopUpVC = storyboard.instantiateViewController(withIdentifier: "AddFolderPopUpVC")
        addFolderPopUpVC.modalPresentationStyle = .overCurrentContext
        self.present(addFolderPopUpVC, animated: true, completion: nil)
        
    }
    
    // 홈화면에서 선택한 폴더 내부로 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let section = indexPath.section
        if section == 1 {
            
            var id = indexPath.row
            print(id)
            print("번째 게시글 터치")
            
            let storyboard = UIStoryboard(name: "LinkList", bundle: nil)
            let linkListVC = storyboard.instantiateViewController(withIdentifier: "LinkListVC") as! LinkListViewController
            self.navigationController?.pushViewController(linkListVC, animated: true)
            
        }
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
            return folderData?.count ?? 0
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
            cell.delegate = self
            
            let itemIndex = indexPath.item
            if let cellData = self.folderData {
                // 폴더 데이터 있는 경우, 폴더 이름 전달
                cell.setupFolderData(cellData[itemIndex].folderName, cellData[itemIndex].folderIdx)
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

extension HomeViewController: FolderCollectionViewCellDelegate {
    func folderMoreButtonDidTap(name: UILabel, _ collectionViewCell: UICollectionViewCell) {
        // 폴더 더보기 팝업
        let section = homeCollectionView.indexPath(for: collectionViewCell)
        print(section?.row, "번째 폴더 더보기 버튼 클릭")
        
        //ㅠㅠㅠㅠㅠㅠ드디어 (폴더 인덱스 접근)
        let cellData = folderData![section!.row]
        selectedFolderIndex = cellData.folderIdx
        selectedFolderName = cellData.folderName
        
        let storyboard = UIStoryboard.init(name:  "ShowFolderMorePopUp", bundle: nil)
        let showFolderMorePopUpVC = storyboard.instantiateViewController(withIdentifier: "ShowFolderMorePopUpVC") as! ShowFolderMorePopUpViewController
        showFolderMorePopUpVC.modalPresentationStyle = .overCurrentContext
        
        // folderIdx 전달
        showFolderMorePopUpVC.folderIndex = selectedFolderIndex
        showFolderMorePopUpVC.folderName = selectedFolderName
        
        self.present(showFolderMorePopUpVC, animated: true, completion: nil)

        

    }
}

// MARK: - 폴더 목록 가져오기 API 통신 메소드
extension HomeViewController {
    func successFeedAPI(_ result: FoldersListModel) {
        self.folderData = result.result
    }
}

