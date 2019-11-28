    %testing HSO algorithm
    %------------------------------written by : Ahmad Al-Shalabi---------------%
    clc;
    clear all;
    close all;
    %initialization
    numberOfHarmonies=50;
    numberOfVariables= 2;
    higherBounds=[5 5];
    lowerBounds= [-5 -5];
    numberOfIterations= 1000;
    HMCR= 0.7;
    PAR= 0.3;

    hso = harmonySearch(numberOfHarmonies,numberOfVariables,higherBounds,lowerBounds,numberOfIterations...
        ,HMCR,PAR);
    %starting the HSO algorithm
    [hso,sol,fitval]=RunAlgorithm(hso);
    % dispaly results
    disp(sol);
    disp(fitval);

