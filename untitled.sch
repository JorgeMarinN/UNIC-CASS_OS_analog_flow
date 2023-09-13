v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 120 -40 120 10 {
lab=GND}
N -30 -10 -30 20 {
lab=GND}
N -30 -70 80 -70 {
lab=#net1}
N 270 -100 270 -70 {
lab=GND}
N 120 -160 270 -160 {
lab=#net2}
N 120 -160 120 -100 {
lab=#net2}
N 120 -70 160 -70 {
lab=GND}
N 160 -70 160 -20 {
lab=GND}
N 120 -20 160 -20 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 100 -70 0 0 {name=M1
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
C {devices/gnd.sym} 120 10 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -30 -40 0 0 {name=VGS value=1.8}
C {devices/gnd.sym} -30 20 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 270 -130 0 0 {name=VDS value=1.8}
C {devices/gnd.sym} 270 -70 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -720 -170 0 0 {name=s1 only_toplevel=false value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.control

save all

dc VGS 0 1.8 0.1

plot -i(VDS)

.endc

"}
