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

mgFunc[T1_,T2_]:=32 0.884*(T1^9-T2^9)+56 T1^4 T2^4*0.829*(T1-T2);

mg\[CapitalDelta]\[Rho]SM\[Nu]e[T\[Gamma]_,T\[Nu]e_,T\[Nu]\[Mu]_]:=   (mgGF^2)/\[Pi]^5 ((1+4 mgSW2 +8 mgSW2^2)(32 0.884*mgfann\[Nu]e[T\[Gamma]]*(T\[Gamma]^9-T\[Nu]e^9)+56 T\[Gamma]^4 *mgfsca\[Nu]e[T\[Gamma]]*T\[Nu]e^4*0.829*(T\[Gamma]-T\[Nu]e))+2mgFunc[T\[Nu]\[Mu],T\[Nu]e])/.{mgSW2-> 0.223}/.mgGF-> 1.1663787 10^-11;
mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][T\[Gamma]_,T\[Nu]e_,T\[Nu]\[Mu]_]:=   (mgGF^2)/\[Pi]^5 ((1-4 mgSW2 +8 mgSW2^2)(32 0.884*mgfann\[Nu]\[Mu][T\[Gamma]]*(T\[Gamma]^9-T\[Nu]\[Mu]^9)+56 T\[Gamma]^4 *mgfsca\[Nu]\[Mu][T\[Gamma]]*T\[Nu]\[Mu]^4*0.829*(T\[Gamma]-T\[Nu]\[Mu]))-mgFunc[T\[Nu]\[Mu],T\[Nu]e])/.{mgSW2-> 0.223}/.mgGF-> 1.1663787 10^-11;


(* ::Input::Initialization:: *)
mgme = 0.511;


(* ::Input::Initialization:: *)
(*Number and energy densities*)
mgnBE[T_,\[Mu]_]:=((2 T^3)/(2\[Pi]^2))PolyLog[3,E^(-(\[Mu]/T))];
mgnFD[T_,\[Mu]_]:=((-2 T^3)/(2\[Pi]^2)) PolyLog[3,-E^(-(\[Mu]/T))];
mg\[Rho]BE[T_,\[Mu]_]:=((6 T^4)/(2\[Pi]^2))PolyLog[4,E^(-(\[Mu]/T))];
mg\[Rho]FD[T_,\[Mu]_]:=((-6 T^4)/(2\[Pi]^2)) PolyLog[4,-E^(-(\[Mu]/T))];

mgnBEM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}];
mgnFDM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}];
mgnMBM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^3 NIntegrate[Enred Sqrt[Enred^2-m^2/T^2] 1/Exp[Enred-\[Mu]/T],{Enred,m/T,\[Infinity]}];
mg\[Rho]BEM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^4 NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}];
mg\[Rho]FDM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^4 NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}];
mgpBEM[T_,\[Mu]_,m_]:=1/(6 \[Pi]^2) T^4 NIntegrate[(Enred^2-m^2/T^2)^(3/2) 1/(Exp[Enred-\[Mu]/T]-1),{Enred,m/T,\[Infinity]}];
mgpFDM[T_,\[Mu]_,m_]:=1/(6 \[Pi]^2) T^4 NIntegrate[(Enred^2-m^2/T^2)^(3/2) 1/(Exp[Enred-\[Mu]/T]+1),{Enred,m/T,\[Infinity]}];

mgd\[Rho]dTFDM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^3 Quiet[NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] ((Enred -\[Mu]/T) Sech[(Enred -\[Mu]/T)/2]^2)/4 ,{Enred,m/T,\[Infinity]}]];
mgd\[Rho]dTBEM[T_,\[Mu]_,m_]:=1/(2 \[Pi]^2) T^4 NIntegrate[Enred^2 Sqrt[Enred^2-m^2/T^2] ((Enred T-\[Mu]) Csch[1/2 (Enred-\[Mu]/T)]^2)/(4 T^2),{Enred,m/T,\[Infinity]}];

mgPartial\[Gamma]eSM[T_,MDM_,gDM_]:=2 (2 \[Pi]^2 T^3)/15+4mgd\[Rho]dTFDM[T,0,mgme]+T mgd2PintdT2[T] ;

mgPartial\[Gamma]eFD[T_,MDM_,gDM_]:=2 (2 \[Pi]^2 T^3)/15+4mgd\[Rho]dTFDM[T,0,mgme]+gDM mgd\[Rho]dTFDM[T,0,MDM]+T mgd2PintdT2[T] ;

mgPartial\[Gamma]eBE[T_,MDM_,gDM_]:=2 (2 \[Pi]^2 T^3)/15+4mgd\[Rho]dTFDM[T,0,mgme]+gDM mgd\[Rho]dTBEM[T,0,MDM]+T mgd2PintdT2[T] ;


mgPartial\[Nu]SM[T_,MDM_,gDM_]:=6 4/T mg\[Rho]FD[T,0] ;
mgPartial\[Nu]FD[T_,MDM_,gDM_]:=6 4/T mg\[Rho]FD[T,0] +gDM mgd\[Rho]dTFDM[T,0,MDM];
mgPartial\[Nu]BE[T_,MDM_,gDM_]:=6 4/T mg\[Rho]FD[T,0] +gDM mgd\[Rho]dTBEM[T,0,MDM];


mgHubble\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:= \[Sqrt]((mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]BEM[T\[Nu],0,MDM]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/(3 (1.2209 10^19 10^3)^2));


mgHubble\[Nu]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:= \[Sqrt]((mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]FDM[T\[Nu],0,MDM]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/(3 (1.2209 10^19 10^3)^2));

mgHubble\[Gamma]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:= \[Sqrt]((mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]BEM[T\[Gamma],0,MDM]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/(3 (1.2209 10^19 10^3)^2));


mgHubble\[Gamma]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:= \[Sqrt]((mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]FDM[T\[Gamma],0,MDM]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/(3 (1.2209 10^19 10^3)^2));


mgdataX=Import["Thermo_Tables/rho_FD.cvs","Table",HeaderLines-> 0];
mg\[Rho]FDMX=Interpolation[mgdataX];
mgdataXX=Import["Thermo_Tables/rho_BE.cvs","Table",HeaderLines-> 0];
mg\[Rho]BEMX=Interpolation[mgdataXX];

mgHubbleTaboft[T\[Alpha]_,T\[Gamma]_,T\[Nu]e_,T\[Nu]\[Mu]_,\[Mu]\[Nu]_,MZ_]:= 1/T\[Gamma]^2 \[Sqrt]((mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4 T\[Gamma]^4 mg\[Rho]FDMX[T\[Gamma]/mgme]+2mg\[Rho]FD[T\[Nu]e,0]+4mg\[Rho]FD[T\[Nu]\[Mu],\[Mu]\[Nu]]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/3);



mgHubbleTaboft\[Nu]BE[T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:= 1/T\[Gamma]^2 \[Sqrt]((2 mg\[Rho]BE[T\[Gamma],0]+4 T\[Gamma]^4 mg\[Rho]FDMX[T\[Gamma]/mgme]+gDM T\[Nu]^4 mg\[Rho]BEMX[T\[Nu]/MDM]+6mg\[Rho]FD[T\[Nu],0]-mgPint[T\[Gamma]]+T\[Gamma] mgdPintdT[T\[Gamma]]) (8 \[Pi])/3);

mgHubbleTabofa\[Nu]BE[z\[Gamma]_,z\[Nu]_,gDM_,MDM_,a_]:= 1/((z\[Gamma] mgm0)/a)^2 \[Sqrt]((2 mg\[Rho]BE[(z\[Gamma] mgm0)/a,0]+4 ((z\[Gamma] mgm0)/a)^4 mg\[Rho]FDMX[(z\[Gamma] mgm0)/a/mgme]+6mg\[Rho]FD[(z\[Nu] mgm0)/a,0]+gDM ((z\[Nu] mgm0)/a)^4 mg\[Rho]BEMX[(z\[Nu] mgm0)/a/MDM]-mgPint[(z\[Gamma] mgm0)/a]+((z\[Gamma] mgm0)/a) mgdPintdT[(z\[Gamma] mgm0)/a]) (8 \[Pi])/3);



mg\[Rho]tot\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=( mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]BEM[T\[Nu],0,MDM]);

mg\[Rho]tot\[Nu]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=
( mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]FDM[T\[Nu],0,MDM]);

mg\[Rho]tot\[Gamma]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=( mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]BEM[T\[Gamma],0,MDM]);

mg\[Rho]tot\[Gamma]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=
( mg\[Rho]BE[T\[Alpha],0]+2 mg\[Rho]BE[T\[Gamma],0]+4mg\[Rho]FDM[T\[Gamma],0,mgme]+6mg\[Rho]FD[T\[Nu],0]+gDM mg\[Rho]FDM[T\[Gamma],0,MDM]);

mgptot\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=(1/3 mg\[Rho]BE[T\[Alpha],0]+1/3 2 mg\[Rho]BE[T\[Gamma],0]+4mgpFDM[T\[Gamma],0,mgme]+1/3 6mg\[Rho]FD[T\[Nu],0]+gDM mgpBEM[T\[Nu],0,MDM]);
mgptot\[Nu]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=(1/3 mg\[Rho]BE[T\[Alpha],0]+1/3 2 mg\[Rho]BE[T\[Gamma],0]+4mgpFDM[T\[Gamma],0,mgme]+1/3 6mg\[Rho]FD[T\[Nu],0]+gDM mgpFDM[T\[Nu],0,MDM]);

mgptot\[Gamma]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=(1/3 mg\[Rho]BE[T\[Alpha],0]+1/3 2 mg\[Rho]BE[T\[Gamma],0]+4mgpFDM[T\[Gamma],0,mgme]+1/3 6mg\[Rho]FD[T\[Nu],0]+gDM mgpBEM[T\[Gamma],0,MDM]);
mgptot\[Gamma]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=(1/3 mg\[Rho]BE[T\[Alpha],0]+1/3 2 mg\[Rho]BE[T\[Gamma],0]+4mgpFDM[T\[Gamma],0,mgme]+1/3 6mg\[Rho]FD[T\[Nu],0]+gDM mgpFDM[T\[Gamma],0,MDM]);

mgRHSec\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-3 mgHubble\[Nu]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM](mg\[Rho]tot\[Nu]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+ mgptot\[Nu]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+T\[Gamma] mgdPintdT[T\[Gamma]]);

mgRHSec\[Nu]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-3 mgHubble\[Nu]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM](mg\[Rho]tot\[Nu]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+ mgptot\[Nu]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+T\[Gamma] mgdPintdT[T\[Gamma]]);


mgRHSec\[Gamma]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-3 mgHubble\[Gamma]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM](mg\[Rho]tot\[Gamma]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+ mgptot\[Gamma]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+T\[Gamma] mgdPintdT[T\[Gamma]]);

mgRHSec\[Gamma]FD[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-3 mgHubble\[Gamma]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM](mg\[Rho]tot\[Gamma]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+ mgptot\[Gamma]FD[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM]+T\[Gamma] mgdPintdT[T\[Gamma]]);



(* ::Input::Initialization:: *)
mgFAC=1/(6.58212 10^-16 10^-6); (* Converts MeV to s^-1 *)

mgdT\[Gamma]dt\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-(mgFAC/mgPartial\[Gamma]eSM[T\[Gamma],MDM,gDM])( mgHubble\[Nu]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM] ( 4 2 mg\[Rho]BE[T\[Gamma],0]+ 3* 4(mg\[Rho]FDM[T\[Gamma],0,mgme]+mgpFDM[T\[Gamma],0,mgme])+ 3T\[Gamma] mgdPintdT[T\[Gamma]]) + mg\[CapitalDelta]\[Rho]SM\[Nu]e[T\[Gamma],T\[Nu],T\[Nu]]+2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][T\[Gamma],T\[Nu],T\[Nu]]);


mgdT\[Nu]dt\[Nu]BE[T\[Alpha]_,T\[Gamma]_,T\[Nu]_,gDM_,MDM_]:=-(mgFAC/mgPartial\[Nu]BE[T\[Nu],MDM,gDM])( mgHubble\[Nu]BE[T\[Alpha],T\[Gamma],T\[Nu],gDM,MDM] ( 4 6 mg\[Rho]FD[T\[Nu],0]+ 3* gDM(mg\[Rho]BEM[T\[Nu],0,MDM]+mgpBEM[T\[Nu],0,MDM])) - mg\[CapitalDelta]\[Rho]SM\[Nu]e[T\[Gamma],T\[Nu],T\[Nu]]-2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][T\[Gamma],T\[Nu],T\[Nu]]);


(* ::Input::Initialization:: *)
mgm0=mgme;
mgdz\[Gamma]da\[Nu]BE[z\[Alpha]_,z\[Gamma]_,z\[Nu]_,gDM_,MDM_,a_]:=z\[Gamma]/a (1/(z\[Gamma] mgm0/a *mgPartial\[Gamma]eSM[z\[Gamma] mgm0/a,MDM,gDM]) (z\[Gamma] mgm0/a *mgPartial\[Gamma]eSM[z\[Gamma] mgm0/a,MDM,gDM]-4*2*mg\[Rho]BE[z\[Gamma] mgm0/a,0]-3*4(mg\[Rho]FDM[z\[Gamma] mgm0/a,0,mgme]+mgpFDM[z\[Gamma] mgm0/a,0,mgme])-3*z\[Gamma] mgm0/a mgdPintdT[z\[Gamma] mgm0/a]-( mg\[CapitalDelta]\[Rho]SM\[Nu]e[z\[Gamma] mgm0/a,z\[Nu] mgm0/a,z\[Nu] mgm0/a]+2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][z\[Gamma] mgm0/a,z\[Nu] mgm0/a,z\[Nu] mgm0/a])/mgHubble\[Nu]BE[z\[Alpha] mgm0/a,z\[Gamma] mgm0/a,z\[Nu] mgm0/a,gDM,MDM]));

mgdz\[Nu]da\[Nu]BE[z\[Alpha]_,z\[Gamma]_,z\[Nu]_,gDM_,MDM_,a_]:=z\[Nu]/a (1/(z\[Nu] mgm0/a mgPartial\[Nu]BE[z\[Nu] mgm0/a,MDM,gDM]))(z\[Nu] mgm0/a mgPartial\[Nu]BE[z\[Nu] mgm0/a,MDM,gDM]+(-(  ( 4 6 mg\[Rho]FD[z\[Nu] mgm0/a,0]+ 3* gDM(mg\[Rho]BEM[z\[Nu] mgm0/a,0,MDM]+mgpBEM[z\[Nu] mgm0/a,0,MDM])) -(mg\[CapitalDelta]\[Rho]SM\[Nu]e[z\[Gamma] mgm0/a,z\[Nu] mgm0/a,z\[Nu] mgm0/a]+2 mg\[CapitalDelta]\[Rho]SM\[Nu]\[Mu][z\[Gamma] mgm0/a,z\[Nu] mgm0/a,z\[Nu] mgm0/a])/ mgHubble\[Nu]BE[z\[Alpha] mgm0/a,z\[Gamma] mgm0/a,z\[Nu] mgm0/a,gDM,MDM])));


(* ::Input::Initialization:: *)
mgWIMPsol[T\[Nu]0_,CASE_,SPIN_,gDM_,MDM_]:=(
(*Solve first as a function of the scale factor*)
mga0=mgm0/T\[Nu]0;
mgamax=mgm0/0.001;
mg\[CapitalDelta]Neff=0.00001;

mgz\[Alpha]0=(2^(1/6) 7^(1/4) mggSMi^(1/3) mg\[CapitalDelta]Neff^(1/4))/(11^(1/3) mggSMf^(1/3))/.{mggSMi-> 10.75,mggSMf-> 3.933};

(* Tnu ~= 0.01 MeV, a time at which e+e- have annihilated away *)


IF[SPIN=="BE"&&CASE== "NU",
 
mgsolEarlyUniverse=NDSolve[
{ 
mgz\[Gamma]'[a]==mgdz\[Gamma]da\[Nu]BE[mgz\[Alpha]0,mgz\[Gamma][a],mgz\[Nu][a],gDM,MDM,a],
mgz\[Nu]'[a]==mgdz\[Nu]da\[Nu]BE[mgz\[Alpha]0,mgz\[Gamma][a],mgz\[Nu][a],gDM,MDM,a],
mgz\[Gamma][mga0]==1,mgz\[Nu][mga0]==1
},
{mgz\[Gamma],mgz\[Nu]},
{a,mga0,mgamax},
PrecisionGoal->8,AccuracyGoal->8];

(*Solve as a function of time in seconds*)
mgTmin=0.01;
mgt0=1/(2 mgFAC mgHubble\[Nu]BE[T\[Nu]0 mgz\[Alpha]0,T\[Nu]0,T\[Nu]0,gDM,MDM]);
mgtmax=1/(2 mgFAC mgHubble\[Nu]BE[mgTmin mgz\[Alpha]0,1.4 mgTmin,mgTmin,gDM,MDM]);

mgsolEarlyUniverset=NDSolve[
{ 
mgT\[Gamma]'[t]==mgdT\[Gamma]dt\[Nu]BE[mgT\[Nu][t]*mgz\[Alpha]0,mgT\[Gamma][t],mgT\[Nu][t],gDM,MDM],
mgT\[Nu]'[t]==mgdT\[Nu]dt\[Nu]BE[mgT\[Nu][t]*mgz\[Alpha]0,mgT\[Gamma][t],mgT\[Nu][t],gDM,MDM],
mgT\[Gamma][mgt0]==T\[Nu]0,mgT\[Nu][mgt0]==T\[Nu]0
},
{mgT\[Gamma],mgT\[Nu]},
{t,mgt0,mgtmax},
PrecisionGoal->8,AccuracyGoal->8];

];

(*Compute all relevant stuff*)

mgNeffres=(8/7 (11/4)^(4/3) (6 mg\[Rho]FD[Re[mgz\[Nu][mga]],0]+ mg\[Rho]BE[mgz\[Alpha]0,0])/(2mg\[Rho]BE[Re[mgz\[Gamma][mga]],0])/.mgsolEarlyUniverse/.{mga-> mgamax})[[1]]//N;

mgz\[Gamma]ofafunc[a1_]:=(Re[mgz\[Gamma][mga]]/.mgsolEarlyUniverse)[[1]]/.{mga-> a1};

mgz\[Nu]ofafunc[a1_]:=(Re[mgz\[Nu][mga]]/.mgsolEarlyUniverse)[[1]]/.{mga-> a1};

mgNaParthenope[a1_]:=Re[((4/mgz\[Gamma][mga]^4 7/8 \[Pi]^2/15 ( 3 mga/mgz\[Nu][mga] D[mgz\[Nu][mga],mga]))/.mgsolEarlyUniverse/.mga-> a1)[[1]]];

mgHubbleofa[a1_]:=(mgHubbleTabofa\[Nu]BE[Re[mgz\[Gamma][mga]]/.mgsolEarlyUniverse,Re[mgz\[Nu][mga]]/.mgsolEarlyUniverse,gDM,MDM,a1])[[1]]/.mga-> a1;

mgHubbleoftfunc[tt_]:=(mgHubbleTaboft\[Nu]BE[Re[mgT\[Gamma][mgt]]/.mgsolEarlyUniverset,Re[mgT\[Nu][mgt]]/.mgsolEarlyUniverset,gDM,MDM])[[1]]/.mgt-> tt;

mgT\[Gamma]ofafunc[a1_]:=(mgm0 (Re[mgz\[Gamma][mga]]/.mgsolEarlyUniverse)[[1]])/mga/.{mga-> a1};

mgaofT\[Gamma]func[Tgam_]:=InverseFunction[mgT\[Gamma]ofafunc][Tgam];

mgToftfunc[tt_]:=(Re[mgT\[Gamma][mgt]]/.mgsolEarlyUniverset)[[1]]/.{mgt->tt };

mgaoftfunc[tt_]:=mgaofT\[Gamma]func[mgToftfunc[tt]];

mgT\[Gamma]oftfunc[tt_]:=(Re[mgT\[Gamma][mgt]]/.mgsolEarlyUniverset)[[1]]/.{mgt-> tt};

mgT\[Gamma]T\[Nu]oftfunc[tt_]:=(Re[mgT\[Gamma][mgt]/mgT\[Nu][mgt]]/.mgsolEarlyUniverset)[[1]]/.{mgt-> tt};
mgT\[Gamma]T\[Nu]ofT\[Gamma]func[Tgam_]:=(Re[mgz\[Gamma][mga]/mgz\[Nu][mga]]/.mgsolEarlyUniverse)[[1]]/.{mga-> mgaofT\[Gamma]func[Tgam]};

(*1 Neff
2 the asymtotic value of z\[Gamma]
3 the asymtotic value of z\[Nu]
4 Interpolating function z\[Gamma](a)
5 Interpolating function z\[Nu](a)
6 Interpolating function N(a)
7 Interpolating function Mpl H/T\[Gamma]^2 (a),Mpl=1.2209 10^19 10^3MeV
8 a(T\[Gamma] in MeV)
9 a(t in seconds)
10 T\[Gamma](a) in MeV
11 T\[Gamma](t in seconds) in MeV
12 T\[Nu]/T\[Gamma](t in seconds)
13 T\[Nu]/T\[Gamma](T\[Gamma] in MeV)
14 Mpl H/T\[Gamma]^2 (t in seconds),Mpl=1.2209 10^19 10^3MeV*)


mgascaling=(2.7255/(1.16045*10^10))/(0.001*mgaofT\[Gamma]func[0.001]);
mgKtoMeV = 1/(11604.51812*10^6);
mgMpl=1.2209 10^19 10^3;
mgMeVtopers = 6.58*10^-22;

a[Tkel_]:= Re[mgaofT\[Gamma]func[Tkel*mgKtoMeV]*mgascaling];
aoft[ts_]:= mgaoftfunc[ts]*mgascaling;
T\[Nu]overT[Tkel_] := 1/mgT\[Gamma]T\[Nu]ofT\[Gamma]func[Tkel*mgKtoMeV];
TofaMeV[as_] := mgT\[Gamma]ofafunc[as/mgascaling];
Tofa[as_]:=TofaMeV[as]/mgKtoMeV;
H[as_] := mgHubbleofa[as/mgascaling]*TofaMeV[as]^2/(mgMpl*mgMeVtopers);
Hoft[ts_]:= H[aoft[ts]];
T\[Gamma]oft[ts_]:= mgToftfunc[ts]/mgKtoMeV;
\[ScriptCapitalN]T[Tkel_]:=mgNaParthenope[a[Tkel]/mgascaling];
\[ScriptCapitalN]oft[ts_]:=\[ScriptCapitalN]T[T\[Gamma]oft[ts]];
T\[Nu]overToft[ts_]:=T\[Nu]overT[T\[Gamma]oft[ts]];
zT[Tkel_]:=(a[Tkel]*Tkel)/(a[10^11]*10^11);
znuT[Tkel_]:=(a[Tkel]*Tkel*T\[Nu]overT[Tkel])/(a[10^11]*T\[Nu]overT[10^11]*10^11);
zoft[ts_]:=zT[T\[Gamma]oft[ts]];
znuoft[ts_]:=znuT[T\[Gamma]oft[ts]];


{mgNeffres,mgz\[Gamma]ofafunc[mgamax],mgz\[Nu]ofafunc[mgamax],mgz\[Gamma]ofafunc[mga],mgz\[Nu]ofafunc[mga],mgNaParthenope[mga],mgHubbleofa[mga],mgaofT\[Gamma]func[mgT],mgaoftfunc[mgt],mgT\[Gamma]ofafunc[mga],mgT\[Gamma]oftfunc[mgt],mgT\[Gamma]T\[Nu]oftfunc[mgt],mgT\[Gamma]T\[Nu]ofT\[Gamma]func[mgT],mgHubbleoftfunc[mgt], a[TK], aoft[tsec], T\[Nu]overT[TK], Tofa[as], H[as],Hoft[tsec], T\[Gamma]oft[tsec], \[ScriptCapitalN]T[TK], \[ScriptCapitalN]oft[tsec], T\[Nu]overToft[tsec], zT[TK], znuT[T]K, zoft[tsec], znuoft[tsec]});


(* ::Input::Initialization:: *)
mgresultvec=Quiet[mgWIMPsol[TnuStart,"NU","BE",2,MassDM]];
Print["\!\(\*SubscriptBox[\(N\), \(eff\)]\) = ", mgresultvec[[1]]]
Print["z\[Gamma] = ", mgresultvec[[2]]]
Print["z\[Nu] = ", mgresultvec[[3]]]
Print["T\[Gamma]/T\[Nu] = ", mgresultvec[[2]]/mgresultvec[[3]]]

(*mgz\[Gamma]ofafunc[a1_]:=mgresultvec[[4]]/.{mga\[Rule] a1};
mgz\[Nu]ofafunc[a1_]:=mgresultvec[[5]]/.{mga\[Rule] a1};mgNaParthenope[a1_]:=mgresultvec[[6]]/.{mga\[Rule] a1};mgHubbleofa[a1_]:=mgresultvec[[7]]/.{mga\[Rule] a1};mgaofT\[Gamma]func[Tgam_]:=mgresultvec[[8]]/.{mgT\[Rule] Tgam};mgaoftfunc[t1_]:=mgresultvec[[9]]/.{mgt\[Rule] t1};
mgT\[Gamma]ofafunc[a1_]:=mgresultvec[[10]]/.{mga\[Rule] a1};
mgT\[Gamma]oftfunc[t1_]:=mgresultvec[[11]]/.{mgt\[Rule] t1};
mgT\[Gamma]T\[Nu]ofT\[Gamma]func[t1_]:=mgresultvec[[12]]/.{mgt\[Rule] t1};
mgT\[Gamma]T\[Nu]ofT\[Gamma]func[Tgam_]:=mgresultvec[[13]]/.{mgT\[Rule] Tgam};
mgHubbleoft[t1_]:=mgresultvec[[14]]/.{mgt\[Rule] t1};*)

a[T_]:=Re[mgresultvec[[15]] /. {TK -> T}];
aoft[tv_]:= Re[mgresultvec[[16]] /. {tsec -> tv}];
T\[Nu]overT[Tv_]:=Re[mgresultvec[[17]]/.{TK-> Tv}];
Tofa[a_]:= Re[mgresultvec[[18]] /.{as -> a}];
H[a_]:=Re[mgresultvec[[19]] /.{as -> a}];
Hoft[tv_]:=Re[mgresultvec[[20]] /.{tsec -> tv}];
T\[Gamma]oft[tv_]:=Re[mgresultvec[[21]] /.{tsec -> tv}]; 
\[ScriptCapitalN]T[Tv_] :=Re[mgresultvec[[22]] /.{TK -> Tv}];
\[ScriptCapitalN]oft[tv_] :=Re[mgresultvec[[23]] /.{tsec-> tv}];
T\[Nu]overToft[tv_] :=Re[mgresultvec[[24]] /.{tsec -> tv}];
zT[T_]:=Re[mgresultvec[[25]] /.{TK -> T}];
znuT[T_] :=Re[mgresultvec[[26]] /.{TK -> T}];
zoft[tv_] :=Re[mgresultvec[[27]] /.{tsec -> tv}];
znuoft[tv_]:=Re[mgresultvec[[28]] /.{tsec -> tv}];


