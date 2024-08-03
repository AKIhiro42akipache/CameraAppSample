//
//  CameraController.swift
//  CameraApp
//
//  Created by 富澤明大 on 2024/08/03.
//

import Foundation
import SwiftUI

struct CameraController:UIViewControllerRepresentable{
    @Binding var image:UIImage
    @Binding var showingCamera:Bool
    /*フォトライブラリを使う場合はPHPickerViewController、
     カメラを使う場合はUIImagePickerControllerを使うことが推奨されている*/
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        //Controllerの中にDelegateを設定
        //context.coordinatorはCameraCoordinatorのインスタンスを示す。
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> CameraCoordinator {
        return CameraCoordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    //NSObjectはObjective-cの記述を使う
    //カメラの機能を使うCoordinatorクラスを作成するときにUIImagePickerControllerDelegateはViewとUIImagePickerControllerの橋渡し的な役割で、
    //イベントの取得や画像の取得などを行う。
    class CameraCoordinator: NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        //カメラで格納した画像をView側から取得する
        let parent:CameraController
        init(parent: CameraController) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            //info[.originalImage]と指定することでカメラで撮影した画像を取得する
            let image = info[.originalImage] as! UIImage
            self.parent.image = image
            self.parent.showingCamera = false
        }
    }
}


