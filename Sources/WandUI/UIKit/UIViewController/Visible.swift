///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

#if canImport(UIKit) && !os(watchOS) && !os(visionOS)
import UIKit

public 
extension UIViewController {

    @inline(__always)
    @objc
    fileprivate
    var visible: UIViewController {
        presentedViewController?.visible ?? self
    }

    @inline(__always)
    var containerController: UIViewController? {
        tabBarController ?? navigationController ?? splitViewController
    }

    @inline(__always)
    var isRoot: Bool {
        UIApplication.shared.visibleWindow?.rootViewController == self
    }

    @inline(__always)
    var isVisible: Bool {
        UIApplication.shared.visibleViewController == self
    }
    
    @inline(__always)
    func presentOnVisible(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.visibleViewController?.present(self,
                                                            animated: animated,
                                                            completion: completion)
    }

}

public 
extension UINavigationController {

    @inline(__always)
    @objc
    override 
    var visible: UIViewController {
        visibleViewController?.visible ?? self
    }

}

public 
extension UITabBarController {

    @inline(__always)
    @objc
    override 
    var visible: UIViewController {
        selectedViewController?.visible ?? self
    }

}

public
extension UIApplication {

    @inline(__always)
    var rootViewController: UIViewController? {
        visibleWindow?.rootViewController
    }

    @inline(__always)
    var visibleViewController: UIViewController? {
        visibleWindow?.visibleViewController
    }

    @inline(__always)
    var visibleWindow: UIWindow? {

        if #available(iOS 13, tvOS 13, *) {
            let scene = UIApplication.shared.connectedScenes.first {
                ($0 as? UIWindowScene)?.activationState == .foregroundActive
            } as? UIWindowScene

            return scene?.windows.first(where: \.isKeyWindow)
        } else {
            return keyWindow
        }
    }

}

public
extension UIWindow {

    @inline(__always)
    public
    var visibleViewController: UIViewController? {
        rootViewController?.visible
    }

}
#endif
