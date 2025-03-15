function ptCloudProcessed = helperPreprocessPC(ptCloud)
    %helperPreprocessPtCloud Preprocess point cloud
    %
    %   ptCloudProcessed = helperPreprocessPtCloud(ptCloud) returns a processed
    %   point cloud. ptCloud and ptCloudProcessed are of type pointCloud.
    %
    %   Note: This is a helper function and might be modified or removed in a
    %   future release.
    
    %   Copyright 2021 The MathWorks, Inc.
    
    % Remove outliers in the point cloud
    ptCloudDenoised = pcdenoise(ptCloud);
    
    % Clip the point cloud. This is done to improve the processing performance
    % and also to include only the areas of interest
    
    % Set the limits to select the point cloud
    selectLimitX = [-40 40];
    selectLimitY = [-40 40];
    
    % In order to not include ground in the processing, add a buffer value to
    % the lower Z limit of the point cloud. Clip anything above 5m.
    minZValue = ptCloudDenoised.ZLimits(1) + 0.2;
    maxZValue = 5;
    selectLimitZ = [minZValue maxZValue];
    
    roi = [selectLimitX selectLimitY selectLimitZ];
    indices = findPointsInROI(ptCloudDenoised,roi);
    ptCloudClipped = select(ptCloudDenoised,indices);
    
    % Segment and remove ego vehicle
    
    % Set location of the sensor and vehicle radius
    sensorLocation = [0 0 0];
    vehicleRadius = 3.5;
    
    % Find the indices of the points other than the ego vehicle and create a
    % point cloud with these points
    egoIndices = findNeighborsInRadius(ptCloudClipped,sensorLocation,vehicleRadius);
    
    egoFixed = false(ptCloudClipped.Count,1);
    egoFixed(egoIndices) = true;
    ptCloudProcessed = select(ptCloudClipped,~egoFixed);

end