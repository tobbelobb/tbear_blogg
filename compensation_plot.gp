set terminal svg enhanced size 500,375 linewidth 2 font "Times New Roman"
set output 'compensation_plot.svg'

set xrange [0:5000]
set xlabel 'hot end position/mm (measured from origo towards anchor)'
set ylabel 'compensation/mm'
set key left
#set ytics nomirror
#set y2tics nomirror
#set ytics ("50k" 50000, "100k" 100000, "150k" 150000, "200k" 200000)
#set y2tics ("1k" 1000, "2k" 2000, "3k" 3000, "4k" 4000, "5k" 5000)
#set y2tics ("10" 10, "20" 20, "100" 100)
set grid

STEPS_PER_SPOOL_RADIANABC = 1216.651
STEPS_PER_SPOOL_RADIAND = 10949.860
steps_per_unit_times_rd = 2*STEPS_PER_SPOOL_RADIAND
steps_per_unit_times_rabc = 2*STEPS_PER_SPOOL_RADIANABC
spool_buildup_factor = 0.010525
k2abc = -2*spool_buildup_factor
k2d = -6*spool_buildup_factor
k0abc = 2*steps_per_unit_times_rabc/k2abc;
k0d = 2*steps_per_unit_times_rd/k2d
SPOOL_RADIUS2 = 1089.0
LINE_ON_SPOOL_ORIGOA = 7240.0
LINE_ON_SPOOL_ORIGOB = 6260.0
LINE_ON_SPOOL_ORIGOC = 6900.0
LINE_ON_SPOOL_ORIGOD = 6000.0
INITIAL_DISTANCEA = sqrt(573.0*573.0 + 1331.0*1331.0 + 162.5*162.5)
INITIAL_DISTANCEB = sqrt(1548.0*1548.0 + 148.0*148.0)
INITIAL_DISTANCEC = sqrt(609.0*609.0 + 1209.0*1209.0 + 133.5*133.5)
INITIAL_DISTANCED = 2295.0
k1a = spool_buildup_factor*(LINE_ON_SPOOL_ORIGOA + 2*INITIAL_DISTANCEA) + SPOOL_RADIUS2;
k1b = spool_buildup_factor*(LINE_ON_SPOOL_ORIGOB + 2*INITIAL_DISTANCEB) + SPOOL_RADIUS2;
k1c = spool_buildup_factor*(LINE_ON_SPOOL_ORIGOC + 2*INITIAL_DISTANCEC) + SPOOL_RADIUS2;
k1d = spool_buildup_factor*(LINE_ON_SPOOL_ORIGOD + 6*INITIAL_DISTANCED) + SPOOL_RADIUS2;

a(x) = -(k0abc*(sqrt(k1a + k2abc*(INITIAL_DISTANCEA - x)) - sqrt(k1a + k2abc*INITIAL_DISTANCEA)));
b(x) = -(k0abc*(sqrt(k1b + k2abc*(INITIAL_DISTANCEB - x)) - sqrt(k1b + k2abc*INITIAL_DISTANCEB)));
c(x) = -(k0abc*(sqrt(k1c + k2abc*(INITIAL_DISTANCEC - x)) - sqrt(k1c + k2abc*INITIAL_DISTANCEC)));
d(x) = -(k0d*(sqrt(k1d + k2d*(INITIAL_DISTANCED - x)) - sqrt(k1d + k2d*INITIAL_DISTANCED)));

plot \
     x - c(x)/c(1) title 'A, B and C-axes' ,\
     x - d(x)/d(1) title 'D-axis'


#     optimal_constant(x) title 'Constant steps/mm, optimal', \
#     default_constant(x) title 'Constant steps/mm, default', \


reset
