//
//  ContentView.swift
//  CameraApp
//
//  Created by 富澤明大 on 2024/08/03.
//

import SwiftUI

struct ContentView: View {
    @State var showingCamera = false
    @State var image = UIImage()
    var body: some View {
        VStack{
            Image(uiImage: self.image)
                .resizable()
                .frame(width: 300,height: 200)
            Button(action:{
                showingCamera.toggle()
            }){
                Text("カメラで撮影する")
            }
            
            .sheet(isPresented:  $showingCamera, content: {
                CameraController(image: $image,showingCamera: $showingCamera)
            })
        }
    }
}

#Preview {
    ContentView()
}
