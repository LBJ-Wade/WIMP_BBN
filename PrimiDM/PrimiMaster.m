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
ClearAll["Global`*"]


(* ::Input::Initialization:: *)
SetDirectory[NotebookDirectory[]];


(* ::Input::Initialization:: *)
$EvolutionType= "WIMP";
TnuStart = 30.0;
Ombmin=0.02;
Ombmax=0.04;
MassDMArray = Join[Table[10^i,{i,-1,Log10[0.5],0.1}],Table[10^i,{i,Log10[0.55],Log10[5],0.05}],Table[i,{i,6,30,1}]];
h2\[CapitalOmega]b0Array = Table[i,{i,Ombmin,Ombmax,(Ombmax-Ombmin)/(40)}];
Abundances = Table[0., {i, 1, Length[MassDMArray]}, {j, 1, Length[h2\[CapitalOmega]b0Array]}];


(* ::Input::Initialization:: *)
Do[
Clear[MassDM];
MassDM = MassDMArray[[i]];
Quiet[<<PrimiCosmo.m];
	
          Do[
            Clear[h2\[CapitalOmega]b0];
            h2\[CapitalOmega]b0 = h2\[CapitalOmega]b0Array[[j]];
            Quiet[<<PrimiNuc.m];
            Abundances[[i,j]] = Join[mgresultvec[[1]],Sequence@@Flatten[List[Yf[#]&/@ShortNames]],0.,0.,0.],
            {j,1,Length[h2\[CapitalOmega]b0Array]}
        ],

{i,1,Length[MassDMArray]}
]

ForExport = Flatten[Table[{MassDMArray[[i]],h2\[CapitalOmega]b0Array[[j]],Sequence@@Abundances[[i,j]]},{i,1,Length[MassDMArray]},{j,1,Length[h2\[CapitalOmega]b0Array]}],1];
Export["simple_wimp_abundances.txt",Join[{"m_DM     omega_b h^2     Neff       n         p         D         t         He3         a         Li7         Be7         chi2BBN         chi2CMB         chi2BBNCMB"},ForExport],"Table","FieldSeparators"->" "];


