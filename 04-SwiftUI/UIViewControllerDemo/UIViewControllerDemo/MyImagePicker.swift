//
//  MyImagePicker.swift
//  UIViewControllerDemo
//
//  Created by KimJunsoo on 1/23/25.
//

import SwiftUI

struct MyImagePicker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

#Preview {
    MyImagePicker()
}
