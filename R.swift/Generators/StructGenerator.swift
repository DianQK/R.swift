//
//  StructGenerator.swift
//  R.swift
//
//  Created by Mathijs Kadijk on 06-09-15.
//  From: https://github.com/mac-cain13/R.swift
//  License: MIT License
//

import Foundation

protocol StructGenerator {
  typealias Result = (externalStruct: Struct, internalStruct: Struct?)

  func generatedStructs(at externalAccessLevel: AccessLevel, withStructName structName: String) -> Result
}

protocol ExternalOnlyStructGenerator: StructGenerator {
  func generatedStruct(at externalAccessLevel: AccessLevel, withStructName structName: String) -> Struct
}

extension ExternalOnlyStructGenerator {
  func generatedStructs(at externalAccessLevel: AccessLevel, withStructName structName: String) -> StructGenerator.Result {
    return (
      generatedStruct(at: externalAccessLevel, withStructName: structName),
      nil
    )
  }
}
