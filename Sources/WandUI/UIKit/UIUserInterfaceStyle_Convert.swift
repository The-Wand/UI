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
import UIKit.UIColor
import Wand

@inline(__always)
public
func | (color: UIColor, style: UIUserInterfaceStyle) -> UIColor {
    color | .init(userInterfaceStyle: style)
}

@inline(__always)
public
func | (color: UIColor, collection: UITraitCollection) -> UIColor {
    color.resolvedColor(with: collection)
}

@inline(__always)
prefix
public
func ! (color: UIColor) -> UIColor {
    color | !.current
}

public
extension UIUserInterfaceStyle {

    @inline(__always)
    static
    var current: Self {
        UIScreen.main.traitCollection.userInterfaceStyle
    }


    @inline(__always)
    prefix
    static
    func ! (style: Self) -> Self {
        style == .dark ? .light : .dark
    }

}

@MainActor
@available(iOS 17.0, *)
@inline(__always)
public
func |<T: UITraitChangeObservable & UITraitEnvironment> (observer: T, handler: @escaping (UIUserInterfaceStyle)->()) -> any UITraitChangeRegistration {

    observer.registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (o: T, prev: UITraitCollection) in
        handler(.current)
    }
}

#endif
