import SwiftUI
import WebKit
import ZIPFoundation

struct WebContentView: View {
    var sourceURL: URL
    var title: String
    @State private var isPresentingFullScreenView = false
    @State private var unzippedContentURL: URL? = nil
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(title).font(.headline).padding()
                Text("Author: Unknown").font(.subheadline)
                
                if let unzippedURL = unzippedContentURL {
                    WebView(url: unzippedURL)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 * (4 / 3))
                } else {
                    Text("Loading...")
                        .onAppear {
                            unzipContent(sourceURL: sourceURL) { unzippedURL in
                                self.unzippedContentURL = unzippedURL
                            }
                        }
                }
                
                Button("Open Full Screen") {
                    self.isPresentingFullScreenView = true
                }
                .foregroundColor(.blue)
                .padding()
                .fullScreenCover(isPresented: $isPresentingFullScreenView) {
                    if let unzippedURL = unzippedContentURL {
                        FullScreenWebView(sourceURL: unzippedURL)
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
        }
    }
}


//struct WebContentView: View {
//    var sourceURL: URL
//    var title: String
//        // For modal presentation without introducing new @State variables,
//        // we can leverage .sheet's onDismiss or use a workaround to trigger the sheet.
//    @State private var isPresentingFullScreenView: Bool = false
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                    // Spacer(minLength: 20) // Optional: Adjust space above the title as needed
//                Text(title)
//                    .font(.headline)
//                    .padding([.leading, .trailing], 20)
//                Text("Author: Unknown")
//                    .font(.subheadline)
//                    // Calculate width and height based on desired aspect ratio and screen width
//                let webViewWidth = geometry.size.width * 0.95
//                let webViewHeight = webViewWidth * (4 / 3) // 4:3 aspect ratio
//                
//                UnzipAndPrepare(sourceURL: sourceURL)
//                    .frame(width: webViewWidth, height: webViewHeight)
//                    .cornerRadius(10) // Optional: Adds rounded corners to the WebView
//                    .padding(.bottom, 40)
//                    .border(Color.gray, width: 1)  // Space between the WebView and the footer
//                
//                Button(action: {
//                    self.isPresentingFullScreenView = true
//                }) {
//                    Text("Open Full Screen")
//                        .foregroundColor(.blue)
//                        .padding()
//                }
//                .sheet(isPresented: $isPresentingFullScreenView) {
//                        // Here you present another instance of WebContentView or a different
//                        // view designed for full screen. Adjust sourceURL as needed.
//                    FullScreenWebView(sourceURL: sourceURL)
//                    
//                }
//                Spacer(minLength: 20)
//            }
//            .frame(width: geometry.size.width)
//            .multilineTextAlignment(.center) // Ensure text is centered if it wraps
//        }
//    }
//}
//
//
//struct WebContentView_Previews: PreviewProvider {
//    static var previews: some View {
//            // Attempt to construct the URL for the local resource
//        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "TestSketch1981360") {
//            WebContentView(sourceURL: url, title: "TestTitle")
//        } else {
//                // Fallback content in case the URL couldn't be constructed
//            Text("Could not load the URL")
//        }
//    }
//}


