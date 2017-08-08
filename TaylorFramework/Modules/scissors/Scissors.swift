//
//  Scissors.swift
//  Scissors
//
//  Created by Alexandru Culeva on 9/3/15.
//  Copyright © 2015 com.yopeso.aculeva. All rights reserved.
//

import Foundation
import SourceKittenFramework

public struct Scissors {

    public init() { }

    public func component(from string: String) -> ExtendedComponent {
        return Tree(file: File(contents: string)).extendedComponent
    }

    public func tokenize(_ string: String) -> FileContent {
        return fileContent(from: File(contents: string))
    }

    /**
     Tokenizes contents of file at a given path by converting it to a tree of components.
     
     - parameter path: Absolute path to the file to be tokenized.
     
     - returns: **FileContent** containing 'path' to file and the tree of components.
     */
    public func tokenizeFileAtPath(_ path: String) -> FileContent {
        return FileContent(path: path, components: File(path: path).map(Tree.init)?.component.components ?? [])
    }

    private func fileContent(from file: File) -> FileContent {
        return FileContent(path: "", components: Tree(file: file).component.components)
    }
}
