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
///
/// 

#if canImport(PhotosUI) && !os(watchOS)
import PhotosUI
import UIKit

import Wand

/// Obtain
///
/// let config: PHPickerConfiguration = nil|
///
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension PHPickerConfiguration: Obtainable {

    public
    static
    func obtain(by wand: Core?) -> Self {

        let wand = wand ?? Core()

        var configuration = PHPickerConfiguration()
        configuration.selectionLimit =  wand.get() ?? 1
        configuration.filter =          wand.get() ?? .images

        return wand.add(configuration)
    }
    
}

#endif
