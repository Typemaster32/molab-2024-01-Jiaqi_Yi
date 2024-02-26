import SwiftUI
import WebKit
import ZIPFoundation
import UIKit

//By ChatGPT, modified
struct WebView: UIViewRepresentable {
    var url: URL

    // Reference to WKWebView for direct access
    private let webView = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        setupSnapshotListener() // Setup the listener when the view is created
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
    
    func setupSnapshotListener() {
        NotificationCenter.default.addObserver(forName: .takeWebViewSnapshot, object: nil, queue: .main) { _ in
            self.takeSnapshot { image in
                // Here you can handle the snapshot image
                // For example, save it to the photo library
                if let image = image {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            }
        }
    }
    
    // Snapshot function accessible from SwiftUI
    func takeSnapshot(completion: @escaping (UIImage?) -> Void) {
        let config = WKSnapshotConfiguration()
        // Configure your snapshot here (e.g., specify rect, afterScreenUpdates, etc.)

        webView.takeSnapshot(with: config) { image, error in
            DispatchQueue.main.async {
                guard let image = image, error == nil else {
                    print(error?.localizedDescription ?? "Unknown error")
                    completion(nil)
                    return
                }
                completion(image)
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
    }
}

//By ChatGPT, exclusively
extension Notification.Name {
    static let takeWebViewSnapshot = Notification.Name("takeWebViewSnapshotNotification")
}



