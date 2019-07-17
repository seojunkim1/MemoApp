//
//  MemoReadVC.swift
//  Memo
//
//  Created by Seojun Kim on 16/07/2019.
//  Copyright © 2019 Seojun Kim. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var param: MemoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.subjectLabel.text = param?.title
        self.contentsLabel.text = param?.contents
        self.imgView.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 HH:mm분에 작성"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        self.navigationItem.title = dateString
        
    }
    

    

}
