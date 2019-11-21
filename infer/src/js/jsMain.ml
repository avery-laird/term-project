(*
 *
 *)

open! IStd
open PolyVariantEqual
module L = Logging

let init_global_state source_file =
  Language.curr_language := Language.JavaScript ;
  PerfStats.register_report_at_exit (PerfStats.JavaScriptFrontend source_file) ;
  DB.Results_dir.init source_file ;
  Ident.NameGenerator.reset ()
  (* JContext.reset_exn_node_table () *)


let do_all_files sources = ()
  


(* load source files and translate *)
let main load_sources =
  (* ignore models for now *)
  let str, map, other =
    match load_sources with
    | `FromVerboseOut _ ->
        L.(die UserError) "Build systems not supported for JavaScript"
    | `FromArguments path ->
        JsLoader.load_from_arguments path
  in
  if String.Map.is_empty map then L.(die InternalError) "Failed to load any JavaScript source code" ;
  do_all_files str

let from_arguments path = main (`FromArguments path)
