//
//  AppDelegate.swift
//  Memo
//
//  Created by Seojun Kim on 16/07/2019.
//  Copyright © 2019 Seojun Kim. All rights reserved.
//

import UIKit


// 🔥 AppDelegate 클래스는 전역변수를 저장하기 적당. 이 클래스는 앱 전체의 라이프 사이클을 관리하는 앱 델리게이트 역할을 하기 때문에, 앱 내에서 반드시 하나의 인스턴스만 존재하도록 시스템적으로 보장되어 있을 뿐만 아니라 어디서든 쉽게 접근할 수 있도록 참조 경로가 제공되는 객체.
// 🔥 여기에 변수를 정의하면 중복될 가능성이 전혀 없으며, 정의된 변수를 뷰 컨트롤러가 참조하기도 쉬움.
// 🔥 앱 델리게이트 객체는 앱 자체의 생명 주기와 운명을 함께함. 앱이 사용할 데이터를 여기에 저장해두면 데이터의 유실을 걱정하지 않아도 됨.
// 🔥 물론, 앱 델리게이트 클래스가 데이터 저장의 완벽한 해결책은 아님. 앱 델리게이트 객체에 저장되는 데이터는 어디까지나 '메모리'에 저장되는 것이기 때문에, 앱이 실행되는 동안에만 데이터가 유지됨.



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // 🔥 MemoData 클래스는 개별적인 메모 데이터를 저장하는 역할임. 제목, 내용, 이미지, 작성날짜가 있는 '하나'의 메모 데이터임. 근데 우리가 만든는 앱은 여러 개의 메모를 목록 형식으로 저장해야함. 그래서 메모 데이터 역시 목록처럼 저장하기 위해, 배열 타입의 변수가 하나 더 필요함!
    var memolist = [MemoData]()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

