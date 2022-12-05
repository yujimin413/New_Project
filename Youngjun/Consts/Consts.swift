//
//  Consts.swift
//  LinkFolder
//
//  Created by 임영준 on 2022/11/22.
//

import Foundation
import Alamofire

struct Const {
    
    static let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
    static let userIdx = UserDefaults.standard.string(forKey: "userIdx")
    static var userNickname = UserDefaults.standard.string(forKey: "userNickname")
    
    static let header: HTTPHeaders = [
        "LF-ACCESS-TOKEN" : jwtToken!
    ]
    
    
    static let baseUrl =  "https://linkfolder.shop"
    static let singupUrl =  "/users/create/"
    static let loginUrl = "/users/login"
    static let editProfileUrl = "/users/modify"
    

    static var nickname  = "닉네임"
    static var profileUrl  = "url"
    
    static var searchIdUrl = "/users/id?search="
    static var acceptFriendUrl = "/friends/create"
    
    
    
    
    //Notice
    static let getNoticeUrl = "/alerts"
    static let getFriendsUrl = "/friends"
     
    

    // /folders
    static let foldersUrl = "/folders"
    static let addFolderUrl = "/folders/create"
    static let modifyFolderNameUrl = "/folders/modify"
    static let deleteFolderUrl = "/folders/delete/"
    static let copyFolderUrl = "/folders/copy"
    
    // /links
    static let linksUrl = "/links/"
    static let addLinkUrl = "/links/create"
    static let modifyLinkUrl = "/links/modify"
    static let deleteLinkUrl = "/links/delete/"
    
    // /alerts
    static let createAlertsUrl = "/alerts/create"
    
}
