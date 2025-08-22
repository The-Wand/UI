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
/// let ctrl: PHPickerViewController = nil|
///
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension PHPickerViewController: Obtainable {

    public
    static
    func obtain(by wand: Core?) -> Self {

        let wand = wand ?? Core()

        let delegate = wand.add(Delegate())

        let config: PHPickerConfiguration =  wand.get()

        let picker = wand.add(PHPickerViewController(configuration: config))
        picker.delegate = delegate

        return wand.add(picker as! Self)
    }
    
}

@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension PHPickerViewController {

    class Delegate: NSObject, PHPickerViewControllerDelegate, Wanded {

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

            var images = [UIImage]()

            let group = DispatchGroup()

            results.forEach {

                let provider = $0.itemProvider
                guard provider.canLoadObject(ofClass: UIImage.self) else {
                    return
                }

                group.enter()

                provider.loadObject(ofClass: UIImage.self) { [weak self] image, error  in
                    guard
                        let image = image as? UIImage,
                        let self
                    else {
                        return
                    }

                    images.append(image)

                    group.leave()
                }

            }

            group.notify(queue: .main) { [weak self] in

                guard let self else {
                    return
                }

                if images.isEmpty {
                    wand.add(Core.Error.imagePicker(-1))
                } else {
                    wand.add(images)
                }

                picker.dismiss(animated: true)

            }
        }

    }



}

#endif
