%Harmony search optimization
%------------------------------written by : Ahmad Al-Shalabi---------------%
classdef harmonySearch
    properties
        numberOfHarmonies;
        numberOfVariables;
        higherBounds;
        lowerBounds;
        numberOfIterations;
        harmonyMemory;
        fitnessValue;
        HMCR;
        PAR;
    end
    methods
        %constructor function
        function hso = harmonySearch(numberOfHarmonies,numberOfVariables,higherBounds,lowerBounds,numberOfIterations...
                ,HMCR,PAR)
            
            hso.numberOfHarmonies=numberOfHarmonies;
            hso.numberOfVariables=numberOfVariables;
            hso.higherBounds=higherBounds;
            hso.lowerBounds=lowerBounds;
            hso.numberOfIterations=numberOfIterations;
            hso.HMCR=HMCR;
            hso.PAR=PAR;
            hso.harmonyMemory = ones(numberOfHarmonies,numberOfVariables);
            hso.fitnessValue = zeros(numberOfHarmonies,1);
        end
        
        [hso,sol,fitval]=RunAlgorithm(hso);
        
    end
    
end