//
// AppDelegate.swift
//
// MIT License
//
// Copyright (c) 2016 Chris Voss
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ProductsViewController(products: [
            Prototype.Products.eggs,
            Prototype.Products.beans,
            Prototype.Products.peas,
            Prototype.Products.milk
            ])
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        
        setupCache()
        
        window.tintColor = Prototype.Colors.primary
        
        backgroundMusicPlayer?.play()
        
        return true
    }
    
    // MARK: - Private
    
    internal var window: UIWindow?
    
    /// Plays shopping background music (if phone isn't muted)
    fileprivate let backgroundMusicPlayer: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "background", withExtension: "m4a") else {
            return nil
        }
        
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.volume = 0.05
        player?.numberOfLoops = -1
        
        return player
    }()
    
    fileprivate func setupCache() {
        let cache = URLCache(memoryCapacity: 1024 * 1024 * 10, diskCapacity: 1024 * 1024 * 50, diskPath: nil)
        URLCache.shared = cache
    }
}

