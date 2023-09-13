v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 -280 30 -240 {
lab=GND}
N 30 -260 60 -260 {
lab=GND}
N 60 -310 60 -260 {
lab=GND}
N 30 -310 60 -310 {
lab=GND}
N -120 -310 -120 -300 {
lab=#net1}
N -120 -310 -10 -310 {
lab=#net1}
N -120 -240 -120 -200 {
lab=GND}
N 190 -410 190 -400 {
lab=#net2}
N 190 -340 190 -300 {
lab=GND}
N 30 -410 30 -340 {
lab=#net2}
N 30 -410 190 -410 {
lab=#net2}
C {devices/gnd.sym} 30 -240 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 10 -310 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/vsource.sym} -120 -270 0 0 {name=VGS value=0}
C {devices/gnd.sym} -120 -200 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 190 -370 0 0 {name=VDS value=1.8}
C {devices/gnd.sym} 190 -300 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -820 -420 0 0 {name=SPICE_CODE only_toplevel=false value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.control

save all


dc VDS 0 1.8 0.1 VGS 0 1.8 0.1

plot -i(VDS)

.endc


"}
