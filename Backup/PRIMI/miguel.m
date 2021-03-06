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
SetDirectory[NotebookDirectory[]];
mgdata=Import["QED_MeV/QED_P_int.cvs","Table",HeaderLines-> 1];
mgPint=Interpolation[mgdata];
mgdata2=Import["QED_MeV/QED_dP_intdT.cvs","Table",HeaderLines-> 1];
mgdPintdT:=Interpolation[mgdata2];
mgdata3=Import["QED_MeV/QED_d2P_intdT2.cvs","Table",HeaderLines-> 1];
mgd2PintdT2:=Interpolation[mgdata3];


(* ::Input::Initialization:: *)
SetDirectory[NotebookDirectory[]];
mgdata=Import["Rate_MeV/nue_ann.dat","Table",HeaderLines-> 1];
mgfann\[Nu]e=Interpolation[mgdata];

mgdata=Import["Rate_MeV/nue_scatt.dat","Table",HeaderLines-> 1];
mgfsca\[Nu]e=Interpolation[mgdata];

mgdata=Import["Rate_MeV/numu_ann.dat","Table",HeaderLines-> 1];
mgfann\[Nu]\[Mu]=Interpolation[mgdata];

mgdata=Import["Rate_MeV/numu_scatt.dat","Table",HeaderLines-> 1];
mgfsca\[Nu]\[Mu]=Interpolation[mgdata];

mgFunc=Compile[{T1,T2}, 32 0.884*(T1^9-T2^9)+56 T1^4 T2^4*0.829*(T1-T2), Parallelization->True];

mg\[CapitalDelta]\[Rho]SM\[Nu]e=  Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]},  (mgGF^2)/\[Pi]^5 ((1+4 mgSW2 +8 mgSW2^2)(32 0.884*mgfann\[Nu]e[T\[Gamma]]*(T\[Gamma]^9-T\[Nu]e^9)+56 T\[Gamma]^4 *mgfsca\[Nu]e[T\[Gamma]]*T\[Nu]e^4*0.829*(T\[Gamma]-T\[Nu]e))+2mgFunc[T\[Nu]\[Mu],T\[Nu]e])/.{mgSW2-> 0.223}/.mgGF-> 1.1663787 10^-11, Parallelization->True];
mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu]=  Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]},  (mgGF^2)/\[Pi]^5 ((1-4 mgSW2 +8 mgSW2^2)(32 0.884*mgfann\[Nu]\[Mu][T\[Gamma]]*(T\[Gamma]^9-T\[Nu]\[Mu]^9)+56 T\[Gamma]^4 *mgfsca\[Nu]\[Mu][T\[Gamma]]*T\[Nu]\[Mu]^4*0.829*(T\[Gamma]-T\[Nu]\[Mu]))-mgFunc[T\[Nu]\[Mu],T\[Nu]e])/.{mgSW2-> 0.223}/.mgGF-> 1.1663787 10^-11, Parallelization->True];


(* ::Input::Initialization:: *)
mgme = 0.511;


(* ::Input::Initialization:: *)
(*Number and energy densities*)
mgnBE=Compile[{T,\[Mu]}, ((2 T^3)/(2\[Pi]^2))PolyLog[3,E^(-(\[Mu]/T))], Parallelization->True];
mgnFD=Compile[{T,\[Mu]}, ((-2 T^3)/(2\[Pi]^2)) PolyLog[3,-E^(-(\[Mu]/T))], Parallelization->True];
mg\[Rho]BE=Compile[{T,\[Mu]}, ((6 T^4)/(2\[Pi]^2))PolyLog[4,E^(-(\[Mu]/T))], Parallelization->True];
mg\[Rho]FD=Compile[{T,\[Mu]}, ((-6 T^4)/(2\[Pi]^2)) PolyLog[4,-E^(-(\[Mu]/T))], Parallelization->True];

mgnBEM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}], Parallelization->True];
mgnFDM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}], Parallelization->True];
mgnMBM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/Exp[Enred-\[Mu]/T],{Enred,m/T,\[Infinity]}], Parallelization->True];
mg\[Rho]BEM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^4 NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}], Parallelization->True];
mg\[Rho]FDM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^4 NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}], Parallelization->True];
mgpBEM=Compile[{T,\[Mu],m}, 1/(6 \[Pi]^2) T^4 NIntegrate[(Enred^2-m^2/T^2)^(3/2) 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}], Parallelization->True];
mgpFDM=Compile[{T,\[Mu],m}, 1/(6 \[Pi]^2) T^4 NIntegrate[(Enred^2-m^2/T^2)^(3/2) 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}], Parallelization->True];

mgd\[Rho]dTFDM=Compile[{T,\[Mu],m}, 1/(2 \[Pi]^2) T^3 Quiet[NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] ((Enred -\[Mu]/T) Sech[(Enred -\[Mu]/T)/2]^2)/4 ,{Enred,m/T,\[Infinity]}]], Parallelization->True];
mgPartial\[Gamma]e=Compile[{T},2 (2 \[Pi]^2 T^3)/15+4mgd\[Rho]dTFDM[T,0,mgme]+T mgd2PintdT2[T], Parallelization->True];


mgHubble= Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ},\[Sqrt]((2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+2mg\[Rho]FD[T\[Nu]e,0]+4mg\[Rho]FD[T\[Nu]\[Mu],\[Mu]\[Nu]]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/(3 (1.2209 10^19 10^3)^2)), Parallelization->True];


mgdataX=Import["Thermo_Tables/rho_FD.cvs","Table",HeaderLines-> 0];
mg\[Rho]FDMX=Interpolation[mgdataX];

mgHubbleTaboft= Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ},1/T\[Gamma]^2 \[Sqrt]((2 mg\[Rho]BE[T\[Gamma],0]+4 T\[Gamma]^4 mg\[Rho]FDMX[T\[Gamma]/me]+2mg\[Rho]FD[T\[Nu]e,0]+4mg\[Rho]FD[T\[Nu]\[Mu],\[Mu]\[Nu]]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/3), Parallelization->True];

mgHubbleTabofa= Compile[{z\[Gamma],z\[Nu]e,z\[Nu]\[Mu],\[Mu]\[Nu],MZ,a}, 1/((z\[Gamma] mgm0)/a)^2 \[Sqrt]((2 mg\[Rho]BE[(z\[Gamma] mgm0)/a,0]+4 ((z\[Gamma] mgm0)/a)^4 mg\[Rho]FDMX[(z\[Gamma] mgm0)/a/mgme]+2mg\[Rho]FD[(z\[Nu]e mgm0)/a,0]+4mg\[Rho]FD[(z\[Nu]\[Mu] mgm0)/a,\[Mu]\[Nu]]-mgPint[(z\[Gamma] mgm0)/a]+((z\[Gamma] mgm0)/a) mgdPintdT[(z\[Gamma] mgm0)/a]) (8 \[Pi])/3), Parallelization->True];

mg\[Rho]tot=Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ}, (2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+2mg\[Rho]FD[T\[Nu]e,0]+4mg\[Rho]FD[T\[Nu]\[Mu],\[Mu]\[Nu]]), Parallelization->True];

mgptot=Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ}, (1/3 2 mg\[Rho]BE[T\[Gamma],0]+4mgpFDM[T\[Gamma],0,mgme]+1/3 2mg\[Rho]FD[T\[Nu]e,0]+4 1/3 mg\[Rho]FD[T\[Nu]\[Mu],\[Mu]\[Nu]]), Parallelization->True];

mgRHSec=Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ}, -3 mgHubble[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ](mg\[Rho]tot[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ]+ mgptot[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ]), Parallelization->True];


(* ::Input::Initialization:: *)
mgFAC=1/(6.58212 10^-16 10^-6); (* Converts MeV to s^-1 *)

mgdT\[Gamma]dt=Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ}, -(mgFAC/mgPartial\[Gamma]e[T\[Gamma]])(4 mgHubble[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],0,0] ( 2 mg\[Rho]BE[T\[Gamma],0]) +3 mgHubble[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],0,0]*4*(mg\[Rho]FDM[T\[Gamma],0,mgme]+mgpFDM[T\[Gamma],0,mgme])+ mg\[CapitalDelta]\[Rho]SM\[Nu]e[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]]+2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]]+ 3 mgHubble[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],0,0] T\[Gamma] mgdPintdT[T\[Gamma]]), Parallelization->True];


mgdT\[Nu]dt=Compile[{T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],\[Mu]\[Nu],MZ}, (-mgHubble[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu],0,0] T\[Nu]e + T\[Nu]e/(3 4 2 mg\[Rho]FD[T\[Nu]e,0] ) (mg\[CapitalDelta]\[Rho]SM\[Nu]e[T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]]+2mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][T\[Gamma],T\[Nu]e,T\[Nu]\[Mu]]))mgFAC, Parallelization->True];


(* ::Input::Initialization:: *)
mgm0=mgme;
mgdz\[Gamma]da=Compile[{z\[Gamma],z\[Nu]e,z\[Nu]\[Mu],\[Mu]\[Nu],g,MZ,a}, z\[Gamma]/a (1/(z\[Gamma] mgm0/a *mgPartial\[Gamma]e[z\[Gamma] mgm0/a]) (z\[Gamma] mgm0/a *mgPartial\[Gamma]e[z\[Gamma] mgm0/a]-4*2*mg\[Rho]BE[z\[Gamma] mgm0/a,0]-3*4(mg\[Rho]FDM[z\[Gamma] mgm0/a,0,mgme]+mgpFDM[z\[Gamma] mgm0/a,0,mgme])-3*z\[Gamma] mgm0/a mgdPintdT[z\[Gamma] mgm0/a]-( mg\[CapitalDelta]\[Rho]SM\[Nu]e[z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a]+2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a])/mgHubble[z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a,0,0])), Parallelization->True,"RuntimeOptions"->"Speed",CompilationTarget->"C"];

mgdz\[Nu]eda=Compile[{z\[Gamma],z\[Nu]e,z\[Nu]\[Mu],\[Mu]\[Nu],g,MZ,a},z\[Nu]e/a (mg\[CapitalDelta]\[Rho]SM\[Nu]e[z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a]/(4 mgHubble[z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a,0,0]*2*mg\[Rho]FDM[z\[Nu]e mgm0/a,0,0])), Parallelization->True];

mgdz\[Nu]\[Mu]da= Compile[{z\[Gamma],z\[Nu]e,z\[Nu]\[Mu],\[Mu]\[Nu],g,MZ,a},z\[Nu]\[Mu]/a (mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a]/(4 mgHubble[z\[Gamma] mgm0/a,z\[Nu]e mgm0/a,z\[Nu]\[Mu] mgm0/a,0,0]*2*mg\[Rho]FDM[z\[Nu]\[Mu] mgm0/a,0,0])), Parallelization->True];



(* ::Input::Initialization:: *)
mgNeutrinoDecoupling[T\[Nu]0_]:=(
(*Solve first as a function of the scale factor*)
mga0=mgm0/T\[Nu]0;mgamax=mgm0/0.001;(* Tnu ~= 0.01 MeV, a time at which e+e- have annihilated away *)

solEarlyUniverse=NDSolve[{ 
z\[Gamma]'[a]==mgdz\[Gamma]da[z\[Gamma][a],z\[Nu][a],z\[Nu][a],0,0,0,a],
z\[Nu]'[a]==1/3 (mgdz\[Nu]eda[z\[Gamma][a],z\[Nu][a],z\[Nu][a],0,0,0,a]+2mgdz\[Nu]\[Mu]da[z\[Gamma][a],z\[Nu][a],z\[Nu][a],0,0,0,a]),
z\[Gamma][mga0]==1,
z\[Nu][mga0]==1},
{z\[Gamma],z\[Nu]},
{a,mga0,mgamax},
PrecisionGoal->8,AccuracyGoal->8];



(*Solve as a function of time in seconds*)
mgTmin=0.0006;
mgt0=1/(2 mgFAC mgHubble[T\[Nu]0,T\[Nu]0,T\[Nu]0,0,0]);
mgtmax=1/(2 mgFAC mgHubble[1.4 mgTmin,mgTmin,mgTmin,0,0]);

mgKtoMeV = 1/(11604.51812*10^6);
mgMpl=1.2209 10^19 10^3;
mgMeVtopers = 6.58*10^-22;

solEarlyUniverset=NDSolve[{ 
T\[Gamma]'[t]==mgdT\[Gamma]dt[T\[Gamma][t],T\[Nu][t],T\[Nu][t],0,0],
T\[Nu]'[t]==mgdT\[Nu]dt[T\[Gamma][t],T\[Nu][t],T\[Nu][t],0,0],
T\[Gamma][mgt0]==T\[Nu]0,T\[Nu][mgt0]==T\[Nu]0},
{T\[Gamma],T\[Nu]},
{t,mgt0,mgtmax},
PrecisionGoal->8,AccuracyGoal->8];

(*Compute all relevant stuff*)

mgNeffres=(8/7 (11/4)^(4/3) (4 mg\[Rho]FD[z\[Nu][a],0]+2mg\[Rho]FD[z\[Nu][a],0])/(2mg\[Rho]BE[z\[Gamma][a],0])/.solEarlyUniverse/.{a-> mgamax})[[1]]//N;

z\[Gamma]ofafunc[a1_]:=(z\[Gamma][a]/.solEarlyUniverse)[[1]]/.{a-> a1};

z\[Nu]ofafunc[a1_]:=(z\[Nu][a]/.solEarlyUniverse)[[1]]/.{a-> a1};

NaParthenope[a1_]:=((4/z\[Gamma][a]^4 7/8 \[Pi]^2/15 ( 3 a/z\[Nu][a] D[z\[Nu][a],a]))/.solEarlyUniverse/.a-> a1)[[1]];

Hubbleofa[a1_]:=(mgHubbleTabofa[z\[Gamma][a]/.solEarlyUniverse,z\[Nu][a]/.solEarlyUniverse,z\[Nu][a]/.solEarlyUniverse,0,0,a1])[[1]]/.a-> a1;

Hubbleoftfunc[tt_]:=(mgHubbleTaboft[T\[Gamma][t]/.solEarlyUniverset,T\[Nu][t]/.solEarlyUniverset,T\[Nu][t]/.solEarlyUniverset,0,0])[[1]]/.t-> tt;

T\[Gamma]ofafunc[a1_]:=(mgm0 (z\[Gamma][a]/.solEarlyUniverse)[[1]])/a/.{a-> a1};

aofT\[Gamma]func[Tgam_]:=InverseFunction[T\[Gamma]ofafunc][Tgam];

Toftfunc[tt_]:=(T\[Gamma][t]/.solEarlyUniverset)[[1]]/.{t->tt };

aoftfunc[tt_]:=aofT\[Gamma]func[Toftfunc[tt]];

T\[Gamma]oftfunc[tt_]:=(T\[Gamma][t]/.solEarlyUniverset)[[1]]/.{t-> tt};
T\[Gamma]T\[Nu]oftfunc[tt_]:=(T\[Gamma][t]/T\[Nu][t]/.solEarlyUniverset)[[1]]/.{t-> tt};
T\[Gamma]T\[Nu]ofT\[Gamma]func[Tgam_]:=(z\[Gamma][a]/z\[Nu][a]/.solEarlyUniverse)[[1]]/.{a-> aofT\[Gamma]func[Tgam]};

ascaling=(2.7255/(1.16045*10^10))/(0.001*aofT\[Gamma]func[0.001]);

a[Tkel_]:= aofT\[Gamma]func[Tkel*mgKtoMeV]*ascaling;
aoft[ts_]:= aoftfunc[ts]*ascaling;
T\[Nu]overT[Tkel_] := 1/T\[Gamma]T\[Nu]ofT\[Gamma]func[Tkel*mgKtoMeV];
TofaMeV[as_] := T\[Gamma]ofafunc[as/ascaling];
Tofa[as_]:=TofaMeV[as]/mgKtoMeV;
H[as_] := Hubbleofa[as/ascaling]*TofaMeV[as]^2/(mgMpl*mgMeVtopers);
Hoft[ts_]:= H[aoft[ts]];
T\[Gamma]oft[ts_]:= Toftfunc[ts]/mgKtoMeV;
\[ScriptCapitalN]T[Tkel_]:=NaParthenope[a[Tkel]/ascaling];
\[ScriptCapitalN]oft[ts_]:=\[ScriptCapitalN]T[T\[Gamma]oft[ts]];
T\[Nu]overToft[ts_]:=T\[Nu]overT[T\[Gamma]oft[ts]];
zT[Tkel_]:=(a[Tkel]*Tkel)/(a[10^11]*10^11);
znuT[Tkel_]:=(a[Tkel]*Tkel*T\[Nu]overT[Tkel])/(a[10^11]*T\[Nu]overT[10^11]*10^11);
zoft[ts_]:=zT[T\[Gamma]oft[ts]];
znuoft[ts_]:=znuT[T\[Gamma]oft[ts]];


{mgNeffres,z\[Gamma]ofafunc[mgamax],z\[Nu]ofafunc[mgamax],z\[Gamma]ofafunc[a],z\[Nu]ofafunc[a],NaParthenope[a],Hubbleofa[a],aofT\[Gamma]func[T],aoftfunc[t],T\[Gamma]ofafunc[a],T\[Gamma]oftfunc[t],T\[Gamma]T\[Nu]oftfunc[t],T\[Gamma]T\[Nu]ofT\[Gamma]func[T],Hubbleoftfunc[t], a[TK], aoft[tsec], T\[Nu]overT[TK], Tofa[as], H[as],Hoft[tsec], T\[Gamma]oft[tsec], \[ScriptCapitalN]T[TK], \[ScriptCapitalN]oft[tsec], T\[Nu]overToft[tsec], zT[TK], znuT[T]K, zoft[tsec], znuoft[tsec]});


(* ::Input::Initialization:: *)
resultvec=Quiet[mgNeutrinoDecoupling[87.0]];
Print["\!\(\*SubscriptBox[\(N\), \(eff\)]\) = ", resultvec[[1]]]
Print["z\[Gamma] = ", resultvec[[2]]]
Print["z\[Nu] = ", resultvec[[3]]]
Print["T\[Gamma]/T\[Nu] = ", resultvec[[2]]/resultvec[[3]]]

a[T_]:=resultvec[[15]] /. {TK -> T};
aoft[tv_]:= resultvec[[16]] /. {tsec -> tv};
T\[Nu]overT[Tv_]:=resultvec[[17]]/.{TK-> Tv};
Tofa[a_]:= resultvec[[18]] /.{as -> a};
H[a_]:=resultvec[[19]] /.{as -> a};
Hoft[tv_]:=resultvec[[20]] /.{tsec -> tv};
T\[Gamma]oft[tv_]:=resultvec[[21]] /.{tsec -> tv}; 
\[ScriptCapitalN]T[Tv_] :=resultvec[[22]] /.{TK -> Tv}; 
\[ScriptCapitalN]oft[tv_] :=resultvec[[23]] /.{tsec-> tv};
T\[Nu]overToft[tv_] :=resultvec[[24]] /.{tsec -> tv};
zT[T_]:=resultvec[[25]] /.{TK -> T};
znuT[T_] :=resultvec[[26]] /.{TK -> T};
zoft[tv_] :=resultvec[[27]] /.{tsec -> tv};
znuoft[tv_]:=resultvec[[28]] /.{tsec -> tv};



