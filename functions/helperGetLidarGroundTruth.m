function gTruth = helperGetLidarGroundTruth(out)
numFrames = size(out.lidarLocation.time,1);

gTruth = repmat(rigidtform3d, numFrames-1, 1);

for i = 2:numFrames
    gTruth(i-1).Translation = squeeze(out.lidarLocation.signals.values(:, :, i));
    % Ignore the roll and the pitch rotations since the ground is flat
    yaw = double(out.lidarOrientation.signals.values(:, 3, i));
    gTruth(i-1).R = [cos(yaw), -sin(yaw),  0; ...
        sin(yaw), cos(yaw), 0; ...
        0,         0,    1];
end
end