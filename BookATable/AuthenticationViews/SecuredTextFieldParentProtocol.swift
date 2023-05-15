//
//  SecuredTextFieldParentProtocol.swift
//  BookATable
//
//  Created by Agata Menes on 15/05/2023.
//

import Foundation


import Foundation

/// Properties and functionalities to assign and  perform in the parent view of the SecuredTextFieldView.
protocol SecuredTextFieldParentProtocol {
    
    /// Assign SecuredTextFieldView hideKeyboard method to this and
    /// then parent can excute it when needed..
    var hideKeyboard: (() -> Void)? { get set }
}
