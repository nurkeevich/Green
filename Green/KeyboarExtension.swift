//
//  KeyboarExtension.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
