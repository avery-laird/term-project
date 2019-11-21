(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)
open! IStd

type t = Clang | Java | JavaScript [@@deriving compare]

let equal = [%compare.equal: t]

let language_to_string = [(Clang, "C/C++/ObjC"); (Java, "Java"); (JavaScript, "JavaScript")]

let to_string lang = List.Assoc.find_exn language_to_string ~equal lang

let to_explicit_string = function Clang -> "Clang" | Java -> "Java" | JavaScript -> "JavaScript"

let of_string s = List.Assoc.find (List.Assoc.inverse language_to_string) ~equal:String.equal s

(** Current language *)
let curr_language = ref Clang

let curr_language_is lang = equal !curr_language lang
