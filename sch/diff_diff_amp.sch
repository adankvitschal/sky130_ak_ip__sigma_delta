v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -280 -20 -280 20 {
lab=#net1}
N -280 20 -120 20 {
lab=#net1}
N -120 -20 -120 20 {
lab=#net1}
N -200 20 -200 60 {
lab=#net1}
N 160 -20 160 20 {
lab=#net2}
N 160 20 320 20 {
lab=#net2}
N 320 -20 320 20 {
lab=#net2}
N 240 20 240 60 {
lab=#net2}
N -280 90 -240 90 {
lab=ibias}
N 160 90 200 90 {
lab=ibias}
N -400 90 -280 90 {
lab=ibias}
N -440 120 -440 200 {
lab=vss}
N 240 120 240 200 {
lab=vss}
N -200 120 -200 200 {
lab=vss}
N -280 -50 -240 -50 {
lab=vss}
N -160 -50 -120 -50 {
lab=vss}
N 280 -50 320 -50 {
lab=vss}
N 160 -50 200 -50 {
lab=vss}
N -340 -50 -320 -50 {
lab=v1p}
N -80 -50 -60 -50 {
lab=v1n}
N 100 -50 120 -50 {
lab=v2p}
N 360 -50 380 -50 {
lab=v2n}
N -330 90 -330 140 {
lab=ibias}
N -330 140 160 140 {
lab=ibias}
N 160 90 160 140 {
lab=ibias}
N -440 200 240 200 {
lab=vss}
N -280 -160 -280 -80 {
lab=vo_n}
N -280 -160 -120 -160 {
lab=vo_n}
N -120 -200 -120 -160 {
lab=vo_n}
N -120 -120 -120 -80 {
lab=vo_p}
N 160 -120 160 -80 {
lab=vo_n}
N 320 -160 320 -80 {
lab=vo_p}
N 160 -160 320 -160 {
lab=vo_p}
N 160 -200 160 -160 {
lab=vo_p}
N -120 -300 -120 -260 {
lab=vdd}
N -120 -300 160 -300 {
lab=vdd}
N 160 -300 160 -260 {
lab=vdd}
N 20 -340 20 -300 {
lab=vdd}
N 20 200 20 240 {
lab=vss}
N -440 20 -440 60 {
lab=ibias}
N -480 20 -440 20 {
lab=ibias}
N -120 -120 -40 -120 {
lab=vo_p}
N -40 -120 60 -160 {
lab=vo_p}
N 60 -160 160 -160 {
lab=vo_p}
N 60 -120 160 -120 {
lab=vo_n}
N -40 -160 60 -120 {
lab=vo_n}
N -120 -160 -40 -160 {
lab=vo_n}
N -300 -160 -280 -160 {
lab=vo_n}
N 320 -160 340 -160 {
lab=vo_p}
N -440 20 -330 20 {
lab=ibias}
N -330 20 -330 90 {
lab=ibias}
N -490 90 -440 90 {
lab=vss}
N -200 90 -120 90 {
lab=vss}
N -120 90 -120 200 {
lab=vss}
N -490 90 -490 200 {
lab=vss}
N -490 200 -440 200 {
lab=vss}
N 240 90 320 90 {
lab=vss}
N 320 90 320 200 {
lab=vss}
N 240 200 320 200 {
lab=vss}
N -180 -230 -140 -230 {
lab=vdd}
N -180 -300 -180 -230 {
lab=vdd}
N -180 -300 -120 -300 {
lab=vdd}
N 180 -230 240 -230 {
lab=vdd}
N 240 -300 240 -230 {
lab=vdd}
N 160 -300 240 -300 {
lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -220 90 0 0 {name=M1
W=10
L=0.5
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
C {sky130_fd_pr/nfet_01v8.sym} 220 90 0 0 {name=M2
W=10
L=0.5
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
C {sky130_fd_pr/nfet_01v8.sym} -420 90 0 1 {name=M3
W=1
L=0.5
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
C {sky130_fd_pr/nfet_01v8.sym} -300 -50 0 0 {name=M4
W=4
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
C {sky130_fd_pr/nfet_01v8.sym} -100 -50 0 1 {name=M5
W=4
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
C {sky130_fd_pr/nfet_01v8.sym} 140 -50 0 0 {name=M6
W=4
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
C {devices/lab_pin.sym} -240 -50 0 1 {name=p1 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 340 -50 0 1 {name=M7
W=4
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
C {devices/lab_pin.sym} -160 -50 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 280 -50 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 200 -50 0 1 {name=p5 sig_type=std_logic lab=vss}
C {devices/ipin.sym} -340 -50 0 0 {name=p6 lab=v1p}
C {devices/ipin.sym} -60 -50 0 1 {name=p7 lab=v1n}
C {devices/ipin.sym} 100 -50 0 0 {name=p8 lab=v2p}
C {devices/ipin.sym} 380 -50 0 1 {name=p9 lab=v2n}
C {devices/ipin.sym} 20 240 0 0 {name=p10 lab=vss}
C {devices/ipin.sym} 20 -340 0 0 {name=p11 lab=vdd}
C {devices/ipin.sym} -480 20 0 0 {name=p12 lab=ibias}
C {devices/opin.sym} -300 -160 0 1 {name=p13 lab=vo_n}
C {devices/opin.sym} 340 -160 0 0 {name=p14 lab=vo_p}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} -120 -230 0 0 {name=R1
L=100
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 160 -230 0 1 {name=R2
L=100
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
