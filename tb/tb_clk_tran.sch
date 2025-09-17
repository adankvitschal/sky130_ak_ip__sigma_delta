v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -380 -400 -380 -300 {}
L 4 -400 -380 -140 -380 {}
T {System Voltages} -370 -410 0 0 0.4 0.4 {}
N -320 -340 -290 -340 {
lab=clk}
N -320 -340 -320 -320 {
lab=clk}
N -320 -260 -320 -240 {
lab=GND}
N -160 -40 -160 -30 {
lab=in_p}
N -160 -40 -100 -40 {
lab=in_p}
N -100 -40 -100 -20 {
lab=in_p}
N -100 -20 -80 -20 {
lab=in_p}
N -160 30 -160 40 {
lab=in_n}
N -160 40 -100 40 {
lab=in_n}
N -100 20 -100 40 {
lab=in_n}
N -100 20 -80 20 {
lab=in_n}
N -160 40 -160 60 {
lab=in_n}
N -160 120 -160 140 {
lab=GND}
N -20 60 -20 80 {
lab=GND}
N 100 -60 220 -60 {
lab=out_p}
N 100 -60 100 -20 {
lab=out_p}
N 80 -20 100 -20 {
lab=out_p}
N 100 60 220 60 {
lab=out_n}
N 100 20 100 60 {
lab=out_n}
N 80 20 100 20 {
lab=out_n}
N 220 -60 300 -60 {
lab=out_p}
N 220 60 300 60 {
lab=out_n}
N -260 -40 -160 -40 {
lab=in_p}
N -260 40 -160 40 {
lab=in_n}
N 0 -80 0 -60 {
lab=clk}
N 0 -80 20 -80 {
lab=clk}
N 260 0 260 20 {
lab=GND}
N 260 120 260 140 {
lab=GND}
C {devices/vsource.sym} -190 -270 0 0 {name=Vdd value="DC \{vdd\}"}
C {devices/vdd.sym} -190 -300 0 0 {name=l7 lab=vdd}
C {devices/gnd.sym} -190 -240 0 0 {name=l8 lab=GND}
C {devices/code.sym} 190 -330 0 0 {name=stimuli
only_toplevel=false
value="
.option TEMP=\{temperature\}
.option warn=1
.control
save clk, out_p, out_n, i(vdd)
tran \{tran_step\} \{tran_stop\} \{tran_start\}
let vref_data = V(clk)
wrdata \{output_file\} V(clk) V(out_p) V(out_n) I(vdd)
quit
.endc
"}
C {devices/capa.sym} 260 90 0 0 {name=C1
m=1
value=\{Cload\}
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} -20 -60 0 0 {name=l11 lab=vdd}
C {devices/vsource.sym} -320 -290 0 1 {name=Vclk value="PULSE (\{clk_low_voltage\} \{clk_high_voltage\} \{clk_period\} \{clk_rise_time\} \{clk_fall_time\} '(\{clk_period\}/2)' \{clk_period\} 2)"}
C {devices/gnd.sym} -320 -240 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/corner.sym} 50 -330 0 0 {name=CORNER only_toplevel=false corner=\{corner\}}
C {devices/lab_pin.sym} -290 -340 0 1 {name=l12 sig_type=std_logic lab=clk}
C {/home/moduhub/work/sky130_ak_ip__sigma_delta/sch/clk_comp.sym} 0 0 0 0 {name=x1}
C {devices/vsource.sym} -160 0 0 1 {name=Vdiff value="DC \{vdiff\}"}
C {devices/vsource.sym} -160 90 0 1 {name=Vcm value="DC \{vcm\}"}
C {devices/gnd.sym} -160 140 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -20 80 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 300 -60 0 1 {name=l4 sig_type=std_logic lab=out_p}
C {devices/lab_pin.sym} 300 60 0 1 {name=l5 sig_type=std_logic lab=out_n}
C {devices/lab_pin.sym} -260 -40 0 0 {name=l6 sig_type=std_logic lab=in_p}
C {devices/lab_pin.sym} -260 40 0 0 {name=l9 sig_type=std_logic lab=in_n}
C {devices/lab_pin.sym} 20 -80 0 1 {name=l10 sig_type=std_logic lab=clk}
C {devices/capa.sym} 260 -30 0 0 {name=C2
m=1
value=\{Cload\}
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 260 20 0 0 {name=l13 lab=GND}
C {devices/gnd.sym} 260 140 0 0 {name=l14 lab=GND}
