import SwiftUI

struct FullScreenWebView: View {
    @Environment(\.presentationMode) var presentationMode
    var sourceURL: URL
    
    var body: some View {
        ZStack {
            WebView(url: sourceURL)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


//struct FullScreenWebView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var sourceURL: URL
//
//    var body: some View {
//        ZStack {
//            WebView(url: sourceURL)
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
//                .onLongPressGesture(minimumDuration: 1) {
//                    NotificationCenter.default.post(name: .takeWebViewSnapshot, object: nil)
//                    // Additional actions or feedback to the user can be added here
//                    print("Long press detected. Implement snapshot functionality here.")
//                }
//        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
//}

