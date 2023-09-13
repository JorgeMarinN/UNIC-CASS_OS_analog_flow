v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -290 1180 -230 {
lab=GND}
N 1180 -360 1260 -360 {
lab=GND}
N 1260 -360 1260 -290 {
lab=GND}
N 1180 -290 1260 -290 {
lab=GND}
N 1180 -530 1180 -400 {
lab=d1}
N 1180 -530 1330 -530 {
lab=d1}
N 1180 -330 1180 -290 {
lab=GND}
N 1180 -400 1180 -390 {
lab=d1}
C {devices/code_shown.sym} 200 -660 0 0 {name=NGSPICE
only_toplevel=true
value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
*.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice ss
*.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice ff
.option scale=1e-6

vgs g1 0 dc=0.9
vds d1 0 dc=0.9

.control
save all

save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]


dc vgs 0 1.8 0.01

let idn = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
let gmn = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
let vthn = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vth]
let vgsn = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vgs]
let vdsatn = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
let vov1 = v(g1) - vthn
let vov2 = 2*idn/gmn

plot idn
*plot idn vs vov1 
*plot idn vs vov2 
*plot vov2
*plot gmn vs vov2
*plot idn vs vdsatn

let W = 5e-6
let a = gmn/idn
setscale a
plot idn/W
plot vov2



wrdata /foss/designs/UNIC-CASS_OS_analog_flow/data_nmos_idvgs.txt idn



.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} 1180 -230 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1160 -360 0 0 {name=M1
L=0.5
W=5
nf=5
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
