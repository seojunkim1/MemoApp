//
//  MemoData.swift
//  Memo
//
//  Created by Seojun Kim on 16/07/2019.
//  Copyright © 2019 Seojun Kim. All rights reserved.
//

import Foundation
import UIKit


//🔥 앱 기능 구현에서 제일 먼저 할 일은 데이터 모델을 정의하는 것.
//🔥 데이터 모델은 사용자가 입력한 데이터를 저장하고 이를 목록이나 상세 화면에 출력할 수 있도록 데이터 소스 역할을 하는 객체.
//🔥 딱히 형식이 있는것은 아님. 근데 실무에서 웬만하면 클래스랑 프로퍼티로 정의해줌. 이 방법이 유지보수에 좋음.
//🔥 MemoData 클래스는 사용자가 '메모 작성' 화면에서 입력한 값을 저장했다가, '메모 목록' 화면이나 '메모 상세' 화면에 제공하는 역할을 함.

class MemoData {
    
    var memoIdx: Int?
    var title: String?
    var contents: String?
    var image: UIImage?
    var regdate: Date?
    
}
