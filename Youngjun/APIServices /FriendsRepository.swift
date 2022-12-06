//
//  FriendsRepository.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/28.
//

import Foundation
import Alamofire

class FriendsRepository{
    func getFriendsList(viewcontroller: FriendsViewController){
        AF.request(Const.baseUrl+Const.getFriendsUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: GetFriendsModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("친구 목록 가져오기 성공")
                debugPrint(response)
                if result.isSuccess{
                    viewcontroller.successGetFriendsAPI(result)
                }
                
                
            case .failure:
                print("친구 목록 가져오기 실패")
                debugPrint(response)
            }
        }
    }
    
    func getFriendsList(viewcontroller: ShareFolderViewController){
        AF.request(Const.baseUrl+Const.getFriendsUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: GetFriendsModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("친구 목록 가져오기 성공")
                debugPrint(response)
                if result.isSuccess{
                    viewcontroller.successGetFriendsAPI(result)
                }
                
                
            case .failure:
                print("친구 목록 가져오기 실패")
                debugPrint(response)
            }
        }
    }
    
    func getFriendsList(viewcontroller: ShareLinkViewController){
        AF.request(Const.baseUrl+Const.getFriendsUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: GetFriendsModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("친구 목록 가져오기 성공")
                debugPrint(response)
                if result.isSuccess{
                    viewcontroller.successGetFriendsAPI(result)
                }
                
                
            case .failure:
                print("친구 목록 가져오기 실패")
                debugPrint(response)
            }
        }
    }
    
    func acceptFriendAlert(sendUserIdx: Int, _  completion: @escaping () -> Void){
        AF.request(Const.baseUrl+"/friends/create/"+"\(sendUserIdx)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: AddFriendModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("친구 수락 성공")
                debugPrint(response)
                if result.isSuccess{
                    completion()
                }
                
            case .failure:
                print("친구 수락 실패")
                debugPrint(response)
            }
        }
    }
    
    func deleteFriend(deleteUserIdx: Int){
        AF.request(Const.baseUrl+"/friends/delete/"+"\(deleteUserIdx)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: Const.header).responseDecodable(of: DeleteFriendModel.self){
            response in
            switch response.result {
            case .success(let result):
                print("친구 삭제 성공")
                debugPrint(response)
                if result.isSuccess{
                }
                
            case .failure:
                print("친구 삭제 실패")
                debugPrint(response)
            }
        }
    }
    
    
    
}
