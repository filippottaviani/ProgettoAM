function ptCloudArr = helperPointClouds(out)

    % Extract signal
    ptCloudData = out.lidarScans.signals.values;
    
    % Create a pointCloud array
    ptCloudArr = pointCloud(ptCloudData(:,:,:,2)); % Ignore first frame
    for n = 3 : size(ptCloudData,4)
        ptCloudArr(end+1) = pointCloud(ptCloudData(:,:,:,n));  %#ok<AGROW>
    end

end