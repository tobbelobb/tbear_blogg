STEPS_PER_SPOOL_RADIAN = [1216.651,1216.651,1216.651,10949.860];
steps_per_unit_times_r =   [STEPS_PER_SPOOL_RADIAN(1),
                            STEPS_PER_SPOOL_RADIAN(2),
                            STEPS_PER_SPOOL_RADIAN(3),
                          2*STEPS_PER_SPOOL_RADIAN(4)];
spool_buildup_factor = 0.010525;
k2a = -2*spool_buildup_factor;
k2b = -2*spool_buildup_factor;
k2c = -2*spool_buildup_factor;
k2d = -6*spool_buildup_factor;
k0a = 2*steps_per_unit_times_r(1)/k2a;
k0b = 2*steps_per_unit_times_r(2)/k2b;
k0c = 2*steps_per_unit_times_r(3)/k2c;
k0d = 2*steps_per_unit_times_r(4)/k2d;

SPOOL_RADIUS2 = 1089.0;
LINE_ON_SPOOL_ORIGO = [7240.0,6260.0,6900.0,23000.0];
INITIAL_DISTANCES = [sqrt(573.0^2 + 1331.0^2 + 162.5^2),
                     sqrt(1548.0^2 + 148.0^2),
                     sqrt(609.0^2 + 1209.0^2 + 133.5^2),
                     2295.0];
k1a = spool_buildup_factor*(LINE_ON_SPOOL_ORIGO(1) + 2*INITIAL_DISTANCES(1)) + SPOOL_RADIUS2;
k1b = spool_buildup_factor*(LINE_ON_SPOOL_ORIGO(2) + 2*INITIAL_DISTANCES(2)) + SPOOL_RADIUS2;
k1c = spool_buildup_factor*(LINE_ON_SPOOL_ORIGO(3) + 2*INITIAL_DISTANCES(3)) + SPOOL_RADIUS2;
k1d = spool_buildup_factor*(LINE_ON_SPOOL_ORIGO(4) + 6*INITIAL_DISTANCES(4)) + SPOOL_RADIUS2;

steps = 100;
distance = 10000;
target = zeros(steps,5);
target(:,1) = linspace(0,distance,steps)';
% make target contain the correct compensated step count
% for individual motors at 100 positions when moving 2 m closer to anchor point from origo.
target(:,2) = ceil(k0a*(sqrt(k1a + k2a*(INITIAL_DISTANCES(1) - target(:,1))) - sqrt(k1a)));
target(:,3) = ceil(k0b*(sqrt(k1b + k2b*(INITIAL_DISTANCES(2) - target(:,1))) - sqrt(k1b)));
target(:,4) = ceil(k0c*(sqrt(k1c + k2c*(INITIAL_DISTANCES(3) - target(:,1))) - sqrt(k1c)));
target(:,5) = ceil(k0d*(sqrt(k1d + k2d*(INITIAL_DISTANCES(4) - target(:,1))) - sqrt(k1d)));

DEFAULT_AXIS_STEPS_PER_UNIT = [36.87, 36.87, 36.87, 663.7];

% Plot how this looks in the d axis
plot(target(:,1), -(target(:,5) - target(1,5)), 'color', 'red', % compensated line
    [target(1,1), target(steps,1)], [target(1,1), target(steps,1)*DEFAULT_AXIS_STEPS_PER_UNIT(4)], 'color', 'blue',
    [target(1,1), target(steps,1)], [target(1,1), -target(steps,1)*((target(2,5)-target(1,5))/target(2,1))], 'color', 'green');
