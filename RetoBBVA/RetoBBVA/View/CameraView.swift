//
//  CameraView.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator{
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
    
    @Binding var image:UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        viewController.cameraDevice = .rear
        viewController.cameraOverlayView = .none
        return viewController
    }
    
    
}

extension CameraView {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) { 
            self.parent = parent
        }
        
        /*func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {  }
        
        func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? { }*/
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("Image taken")
                print("Width: " + image.size.width.description)
                print("Height: " + image.size.height.description)
                
                if (image.size.width > image.size.height) {
                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
                } else {
                    // self.parent.image = image
                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
                }
            }
        }
        
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
