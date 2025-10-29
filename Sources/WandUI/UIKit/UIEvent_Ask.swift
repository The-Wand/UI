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

#if canImport(UIKit)
import Foundation
import UIKit

import Wand
import WandFoundation

extension UIEvent.EventSubtype: AskingNil, @retroactive Wanded {

    public
    static
    func ask<C, T>(with context: C, ask: Ask<T>) -> Core {

        let core = Core.to(context)

        guard core.append(ask: ask) else {
            return core
        }

        if let window = UIApplication.shared.visibleWindow {
            core.put(window)
        } else {

            //Looking for the key window

            core.put(UIWindow.didBecomeKeyNotification)
            core | { (notification: Notification) in
                if let window = notification.object as? UIWindow {
                    core.put(window)
                }
            }

        }

        return core
    }

}

extension UIWindow: Wanded {

    open
    override
    func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard let core = isWanded else {
            return
        }

        if let event = event {
            core.add(event)
        }

        core.add(motion)
    }

}

#endif
