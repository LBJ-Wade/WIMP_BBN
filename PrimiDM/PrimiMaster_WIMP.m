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
Quiet[<<WIMP.m];
$EvolutionType= "WIMP"; 
TmgStart = 30.1;
CASE = "EE";
SPIN = "BE";
gDM = 1.;
\[Sigma]v = 1.;
BR = 0.;
Ombmin=0.015;
Ombmax=0.028;
MassDMArray=Join[Table[10^i,{i,-1,Log10[0.9],0.1}],Table[i,{i,1,14,0.3}],Table[i,{i,14,30,2}]];
h2\[CapitalOmega]b0Array = Table[j,{j,Ombmin,Ombmax,(Ombmax-Ombmin)/(40)}];
Abundances = Table[0., {k, 1, Length[MassDMArray]}, {k, 1, Length[h2\[CapitalOmega]b0Array]}];
SetSharedVariable[h2\[CapitalOmega]b0Array,Abundances];


(* ::Input::Initialization:: *)
LaunchKernels[6];

Do[
Clear[MDM];
MDM = MassDMArray[[l]];
Quiet[<<PrimiCosmo.m];
DistributeDefinitions["Global`"];
          ParallelDo[
            Clear[h2\[CapitalOmega]b0];
            h2\[CapitalOmega]b0 = h2\[CapitalOmega]b0Array[[m]];
            Print["\!\(\*SubscriptBox[\(M\), \(DM\)]\) = ", MDM, " MeV & h2\[CapitalOmega]b0 = ", h2\[CapitalOmega]b0];
            Quiet[<<PrimiNuc.m];
            Abundances[[l,m]] = Join[mgresultvec[[1]],Sequence@@Flatten[List[Yf[#]&/@ShortNames]],0.,0.,0.],
            {m,1,Length[h2\[CapitalOmega]b0Array]}
        ];

ForExport = Flatten[Table[{MassDMArray[[n]],h2\[CapitalOmega]b0Array[[p]],Sequence@@Abundances[[n,p]]},{n,1,Length[MassDMArray]},{p,1,Length[h2\[CapitalOmega]b0Array]}],1];
Export[ToString[StringForm["Abundances_Case=``_Stat=``_gDM=``_Sigmav=``_BR=``",CASE,SPIN,gDM,\[Sigma]v,BR]],Join[{"M_DM     Omega_b h^2     Neff       n         p         D         t         He3         a         Li7         Be7         chi2BBN         chi2CMB         chi2BBNCMB"},ForExport],"Table","FieldSeparators"->" "],

{l,1,Length[MassDMArray]}
]