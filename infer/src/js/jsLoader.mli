open! IStd
open Parser_flow

type file_entry = Singleton of SourceFile.t | Duplicate of (string * SourceFile.t) list

type ast = Tree 

type t = string * file_entry String.Map.t * ast

val load_from_arguments : string -> t
(** load the list of source files *)
