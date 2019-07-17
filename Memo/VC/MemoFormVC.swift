//
//  MemoFormVC.swift
//  Memo
//
//  Created by Seojun Kim on 16/07/2019.
//  Copyright © 2019 Seojun Kim. All rights reserved.
//

import UIKit


//enum pickerViewCase {
//
//    case photoLibrary
//    case camera
//    case savedPhotosAlbum
//
//}

class MemoFormVC: UIViewController {
    
    // 🔥@IBOutlet weak으로 참조하는 이유? 순환 참조 오류를 방지하기 위해서 사용함. 순환 참조 오류는 두 개 이상의 객체가 서로를 강하게 참조하고 있어서 논리적으로는 객체들이 메모리에서 해제될 수 없는 상황을 뜻함. 객체가 메모리에서 해제되기 위해서는 더 이상 어느 객체도 자신을 참조하지 않는 상태가 전제되어야함. 근데 strong으로 연결되어있으면 계속해서 두 개 이상의 객체가 서로를 참조하는거임. 이 연결고리를 끊어주기 위해서 약한 잠조(Weak Reference)를 사용함. 한 쪽을 약한 참조로 정의해 놓으면 순환 참조 이슈가 발생했을 때 시스템은 약한 참조를 제거함. 이를 통해 순환 참조 사이클이 깨짐! ARC(Auto Referencing Counter)를 공부하면 알 수 있음.
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var previewImgView: UIImageView!
    
    // 🔥 제목을 입력받는 칸을 두지 않고, 내용의 첫 줄을 추출하여 제목으로 사용할거임. subject는 이를 위한 변수로서 제목을 저장하는 역할을 담당.
    var subject: String!
    
    // 🔥 UIImagePickerControllerDelegate 프로토콜에 대한 구현. 인스턴스 초기화 해준거임.
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentsTextView.delegate = self
        
        //        picker.delegate = self
        //        picker.allowsEditing = true
        
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        guard self.contentsTextView.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        // MemoData 인스턴스 초기화를 하고 데이터를 담음.
        let data = MemoData()
        data.title = self.subject
        data.contents = self.contentsTextView.text
        data.image = self.previewImgView.image
        data.regdate = Date()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
        
        
    }
    
    // 이미지 피커 컨트롤러는 델리게이트 패턴 기반으로 동작함. MemoFormVC 뷰 컨트롤러는 이미지 피커 컨트롤러를 실행하면서 몇 가지 권한과 조건을 걸어두었음. 그 조건은 -> 뷰 컨트롤러(self)가 이미지 피커 컨트롤러의 동작에 간섭하지 않을 테니, 특정 이벤트가 발생했을 때 뷰 컨트롤러(self)쪽에도 알려달라!
    // 알려주는 방식은 메써드 호출로, 이때 호출되는 메써드는 '델리게이트 메써드'라고 함.
    
    @IBAction func pickCameraAction(_ sender: Any) {
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
        let alert = UIAlertController(title: "이미지를 가져올 곳을 선택하세요", message: "" , preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default) { (action) in
            self.openLibrary()
            
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        alert.addAction(library)
        alert.addAction(camera)
        self.present(alert, animated: false, completion: nil)
    }
    
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        self.present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        picker.sourceType = .camera
        self.present(picker, animated: false, completion: nil)
    }
    //
    //        func openCamera() {
    //            if UIImagePickerController.SourceType.camera = true {
    //                picker.sourceType = .camera
    //                self.present(picker, animated: false)
    //            }
    //        }
    
    //        var restrictedPickerView: pickerViewCase
    //        restrictedPickerView = .camera
    
    
    //        switch restrictedPickerView {
    //        case .camera:
    //            UIImagePickerController.SourceType.camera
    //            self.present(picker, animated: false)
    //        case .photoLibrary:
    //            UIImagePickerController.SourceType.photoLibrary
    //            self.present(picker, animated: false)
    //        default:
    //            UIImagePickerController.SourceType.savedPhotosAlbum
    //            self.present(picker, animated: false)
    //        }
    
    //        UIImagePickerController.SourceType.photoLibrary
    //        UIImagePickerController.SourceType.camera
    //        UIImagePickerController.SourceType.savedPhotosAlbum
    
    
    
}

// 카메라 버튼에 연결되어 사진을 촬영 or 저장된 이미지를 로드
// 델리게이트 패턴 : 위임해주는 패턴. 프로토콜을 선언만 해주고 형식만 제공해준다음, 내용을 구현하는 객체는 그 프로토콜을 채택한 객체가 해줌.
extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.previewImgView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
        
    }
    
    // 텍스트 뷰의 내용이 변경될 때 마다 호출되는 델리게이트 메써드
    func textViewDidChange(_ textView: UITextView) {
        
        // 내용의 최대 15자리까지 읽어들여 subject 변수에 저장!
        let contents = textView.text as NSString
        
        // 삼항 연산자. 컨텐츠의 길이가 15보다 크면 15자리까지 나타내주고, 15보다 작으면 해당 컨텐츠의 길이만큼 표현해주어라!
        let length = ( (contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
    }
    
}
