v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 60 0 100 {
lab=#net1}
N -100 60 0 60 {
lab=#net1}
N -100 30 -100 60 {
lab=#net1}
N 0 60 100 60 {
lab=#net1}
N 100 30 100 60 {
lab=#net1}
N -90 130 -40 130 {
lab=clk}
N -100 -220 -100 -150 {
lab=out_n}
N -60 -250 -30 -250 {
lab=out_p}
N -30 -250 -30 -120 {
lab=out_p}
N -60 -120 -30 -120 {
lab=out_p}
N 30 -250 60 -250 {
lab=out_n}
N 30 -250 30 -120 {
lab=out_n}
N 30 -120 60 -120 {
lab=out_n}
N -100 -90 -100 -30 {
lab=#net2}
N 100 -90 100 -30 {
lab=#net3}
N 100 -220 100 -150 {
lab=out_p}
N -30 -200 100 -200 {
lab=out_p}
N -100 -180 30 -180 {
lab=out_n}
N -280 -310 -280 -280 {
lab=vdd}
N -100 -310 -100 -280 {
lab=vdd}
N 100 -310 100 -280 {
lab=vdd}
N 280 -310 280 -280 {
lab=vdd}
N -280 -310 280 -310 {
lab=vdd}
N 0 -340 0 -310 {
lab=vdd}
N 0 160 0 180 {
lab=vss}
N -280 -220 -280 -180 {
lab=out_n}
N -280 -180 -100 -180 {
lab=out_n}
N 280 -220 280 -180 {
lab=out_p}
N 100 -180 280 -180 {
lab=out_p}
N 320 -250 350 -250 {
lab=clk}
N 140 0 170 0 {
lab=in_n}
N -170 0 -140 0 {
lab=in_p}
N -350 -250 -320 -250 {
lab=clk}
N 280 -180 300 -180 {
lab=out_p}
N -300 -180 -280 -180 {
lab=out_n}
N -160 -120 -100 -120 {
lab=vss}
N 100 -120 160 -120 {
lab=vss}
N -280 -250 -100 -250 {
lab=vdd}
N -190 -310 -190 -250 {
lab=vdd}
N 100 -250 280 -250 {
lab=vdd}
N 190 -310 190 -250 {
lab=vdd}
N 0 130 60 130 {
lab=vss}
N -160 -120 -100 -120 {
lab=vss}
N -100 -0 -50 0 {
lab=vss}
N 50 -0 100 0 {
lab=vss}
N -540 -250 -510 -250 {
lab=clk}
N -470 -310 -470 -280 {
lab=vdd}
N -470 -310 -280 -310 {
lab=vdd}
N -470 -250 -400 -250 {
lab=vdd}
N -400 -310 -400 -250 {
lab=vdd}
N 510 -250 540 -250 {
lab=clk}
N 470 -310 470 -280 {
lab=vdd}
N 280 -310 470 -310 {
lab=vdd}
N 400 -250 470 -250 {
lab=vdd}
N 400 -310 400 -250 {
lab=vdd}
N 470 -220 470 -60 {
lab=#net3}
N 100 -60 470 -60 {
lab=#net3}
N -470 -220 -470 -60 {
lab=#net2}
N -470 -60 -100 -60 {
lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -20 130 0 0 {name=M1
W=5
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} -120 0 0 0 {name=M2
W=5
L=1
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
C {sky130_fd_pr/nfet_01v8.sym} 120 0 0 1 {name=M3
W=5
L=1
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
C {sky130_fd_pr/nfet_01v8.sym} -80 -120 0 1 {name=M4
W=2
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 80 -120 0 0 {name=M5
W=2
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} -300 -250 0 0 {name=M6
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -80 -250 0 1 {name=M7
W=5
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 80 -250 0 0 {name=M8
W=5
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 300 -250 0 1 {name=M9
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} -170 0 0 0 {name=p2 lab=in_p}
C {devices/ipin.sym} 170 0 0 1 {name=p3 lab=in_n}
C {devices/ipin.sym} 0 180 0 1 {name=p4 lab=vss}
C {devices/ipin.sym} 0 -340 0 1 {name=p5 lab=vdd}
C {devices/ipin.sym} -90 130 0 0 {name=p6 lab=clk}
C {devices/lab_pin.sym} -350 -250 0 0 {name=p7 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 350 -250 0 1 {name=p1 sig_type=std_logic lab=clk}
C {devices/opin.sym} 300 -180 0 0 {name=p8 lab=out_p}
C {devices/opin.sym} -300 -180 0 1 {name=p9 lab=out_n}
C {devices/lab_pin.sym} -50 0 0 1 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -160 -120 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 160 -120 0 1 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 60 130 0 1 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 50 0 0 0 {name=p15 sig_type=std_logic lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} -490 -250 0 0 {name=M10
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -540 -250 0 0 {name=p14 sig_type=std_logic lab=clk}
C {sky130_fd_pr/pfet_01v8.sym} 490 -250 0 1 {name=M11
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 540 -250 0 1 {name=p17 sig_type=std_logic lab=clk}
