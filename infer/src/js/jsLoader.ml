open! IStd
module L = Logging

type file_entry = Singleton of SourceFile.t | Duplicate of (string * SourceFile.t) list

type ast = Tree 

type t = string * file_entry String.Map.t * ast

let load_from_arguments source_path =
  ("", String.Map.empty, Tree)
