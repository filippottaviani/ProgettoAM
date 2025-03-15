function hFig = helperSuperimposeMapOnSceneImage(sceneName, ptCloudAccum)

    hFig = figure(Name="Point Cloud Map");
    hIm = helperShowSceneImage(sceneName);
    
    hold(hIm.Parent,"on")
    pcshow(ptCloudAccum);
    hold(hIm.Parent,"off")
    
    xlim(hIm.Parent, [-10 35]);
    ylim(hIm.Parent, [-23 20]);
end