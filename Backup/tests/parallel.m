(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
Num = 10;


(* ::Input::Initialization:: *)
f[x_] := Table[{z, NIntegrate[2^(x^y/Log[y]), {y,2,3}]},{z,1,1000}];


(* ::Input::Initialization:: *)
Do[f[i],
   {i,Num}
] //AbsoluteTiming


(* ::Input::Initialization:: *)
ParallelDo[f[i],
   {i,Num}
] //AbsoluteTiming


(* ::Input::Initialization:: *)
Parallelize[Do[f[i],
   {i,Num}
]] //AbsoluteTiming


(* ::Input::Initialization:: *)
g[x_] := Parallelize[Table[{z, NIntegrate[2^(x^y/Log[y]), {y,2,3}]},{z,1,1000}]];
Do[g[i],
   {i,Num}
] //AbsoluteTiming


(* ::Input::Initialization:: *)
h = Compile[{x},Table[{z, NIntegrate[2^(x^y/Log[y]), {y,2,3}]},{z,1,1000}], Parallelization->True];
Do[h[i],
   {i,1}
]; //AbsoluteTiming


(* ::Input::Initialization:: *)
j = Compile[{x},Table[{z, NIntegrate[2^(x^y/Log[y]), {y,2,3}]},{z,1,1000}], Parallelization->True];
ParallelDo[j[i],
   {i,1}
]; //AbsoluteTiming


(* ::Input::Initialization:: *)
SetDirectory[NotebookDirectory[]];
SetDirectory[ParentDirectory[Directory[]]];


(* ::Input::Initialization:: *)
Quiet[<<PRIMAT-Main.m]; //AbsoluteTiming
