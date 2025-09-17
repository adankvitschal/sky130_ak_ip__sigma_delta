v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -635 -520 -635 -420 {}
L 4 -655 -500 -395 -500 {}
L 4 -635 -285 -635 -185 {}
L 4 40 -520 40 0 {}
L 4 20 -500 640 -500 {}
L 4 -345 -500 -85 -500 {}
L 4 -330 -520 -330 -320 {}
L 4 -660 -260 -20 -260 {}
T {System Voltages} -625 -530 0 0 0.4 0.4 {}
T {Test Voltages} -625 -295 0 0 0.4 0.4 {}
T {Test Circuit} 45 -530 0 0 0.4 0.4 {}
T {Code} -315 -530 0 0 0.4 0.4 {}
N -495 -55 -495 -35 {
lab=GND}
N 255 -110 255 -90 {
lab=GND}
N 375 -250 495 -250 {
lab=out_p}
N 375 -250 375 -210 {
lab=out_p}
N 355 -210 375 -210 {
lab=out_p}
N 375 -130 495 -130 {
lab=out_n}
N 375 -170 375 -130 {
lab=out_n}
N 355 -170 375 -170 {
lab=out_n}
N 495 -250 575 -250 {
lab=out_p}
N 495 -130 575 -130 {
lab=out_n}
N 535 -190 535 -170 {
lab=GND}
N 535 -70 535 -50 {
lab=GND}
N -245 -55 -245 -35 {
lab=GND}
N 135 -250 175 -250 {
lab=v1p}
N 135 -210 175 -210 {
lab=v1n}
N 135 -170 175 -170 {
lab=v2p}
N 135 -130 175 -130 {
lab=v2n}
N -495 -230 -405 -230 {
lab=v1p}
N -245 -230 -155 -230 {
lab=v2p}
N 295 -290 295 -270 {
lab=#net1}
N 295 -370 295 -350 {
lab=vdd}
N -495 -145 -495 -115 {
lab=v1n}
N -495 -130 -405 -130 {
lab=v1n}
N -245 -145 -245 -115 {
lab=v2n}
N -245 -130 -155 -130 {
lab=v2n}
N -495 -230 -495 -205 {
lab=v1p}
N -245 -230 -245 -205 {
lab=v2p}
N 255 -290 255 -270 {
lab=vdd}
N -575 -390 -575 -380 {
lab=GND}
N -575 -460 -575 -450 {
lab=vdd}
C {devices/vsource.sym} -575 -420 0 0 {name=Vdd value="DC \{vdd\}"}
C {devices/vdd.sym} -575 -460 0 0 {name=l7 lab=vdd}
C {devices/gnd.sym} -575 -380 0 0 {name=l8 lab=GND}
C {devices/code.sym} -160 -450 0 0 {name=stimuli
only_toplevel=false
value="
.option TEMP=\{temperature\}
.option warn=1
.control
save out_p, out_n, i(vdd)
dc Vdiff1 -0.9 0.9 0.05
wrdata \{output_file\} V(out_p) V(out_n) I(vdd)
quit
.endc
"}
C {devices/capa.sym} 535 -100 0 0 {name=C1
m=1
value=\{Cload\}
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 255 -290 0 0 {name=l11 lab=vdd}
C {sky130_fd_pr/corner.sym} -300 -450 0 0 {name=CORNER only_toplevel=false corner=\{corner\}}
C {devices/vsource.sym} -495 -175 0 0 {name=Vdiff1 value="DC \{vdiff1\}"}
C {devices/vsource.sym} -495 -85 0 1 {name=Vcm1 value="DC '(\{vcm1\}-\{vdiff1\}/2)'"}
C {devices/gnd.sym} -495 -35 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 255 -90 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 575 -250 0 1 {name=l4 sig_type=std_logic lab=out_p}
C {devices/lab_pin.sym} 575 -130 0 1 {name=l5 sig_type=std_logic lab=out_n}
C {devices/lab_pin.sym} -405 -230 2 0 {name=l6 sig_type=std_logic lab=v1p}
C {devices/lab_pin.sym} -405 -130 2 0 {name=l9 sig_type=std_logic lab=v1n}
C {devices/capa.sym} 535 -220 0 0 {name=C2
m=1
value=\{Cload\}
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 535 -170 0 0 {name=l13 lab=GND}
C {devices/gnd.sym} 535 -50 0 0 {name=l14 lab=GND}
C {devices/vsource.sym} -245 -175 0 0 {name=Vdiff2 value="DC \{vdiff2\}"}
C {devices/vsource.sym} -245 -85 0 1 {name=Vcm2 value="DC '(\{vcm2\}-\{vdiff2\}/2)'"}
C {devices/gnd.sym} -245 -35 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -155 -230 2 0 {name=l10 sig_type=std_logic lab=v2p}
C {devices/lab_pin.sym} -155 -130 2 0 {name=l12 sig_type=std_logic lab=v2n}
C {devices/lab_pin.sym} 135 -250 0 0 {name=l15 sig_type=std_logic lab=v1p}
C {devices/lab_pin.sym} 135 -210 0 0 {name=l16 sig_type=std_logic lab=v1n}
C {devices/lab_pin.sym} 135 -170 0 0 {name=l17 sig_type=std_logic lab=v2p}
C {devices/lab_pin.sym} 135 -130 0 0 {name=l18 sig_type=std_logic lab=v2n}
C {devices/isource.sym} 295 -320 0 0 {name=Ibias value=\{ibias\}}
C {devices/vdd.sym} 295 -370 0 0 {name=l19 lab=vdd}
C {/home/moduhub/work/sky130_ak_ip__sigma_delta/sch/diff_diff_amp.sym} 235 -190 0 0 {}
