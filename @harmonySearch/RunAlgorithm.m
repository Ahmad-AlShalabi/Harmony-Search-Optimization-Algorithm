

    %------------------------------written by : Ahmad Al-Shalabi---------------%


    function [hso,sol,fitval]=RunAlgorithm(hso)

    %initialization the harmony memory
    % creat random harmonyMemory

    hso.harmonyMemory = repmat((hso.lowerBounds+(hso.higherBounds-hso.lowerBounds)),hso.numberOfHarmonies,1)...
                       .*hso.harmonyMemory.*rand(hso.numberOfHarmonies,hso.numberOfVariables);

    % calculate fittness value for each harmony
    hso.fitnessValue =CostFun(hso.harmonyMemory) ;
    
    %initialization the new harmony
    newHarmony=zeros(1,hso.numberOfVariables);

    %start algorithm
    for j=1:hso.numberOfIterations
        for i=1:hso.numberOfVariables

            % generate random HMSR "harmony memory considering rate "  and PAR "pitch adjusting rate"
            randHMCR = rand();
            randPAR = rand();
            if randHMCR > hso.HMCR
                %generate random pitch
                newHarmony(i)= hso.lowerBounds(i)+(hso.higherBounds(i)-hso.lowerBounds(i)) .* rand();
            else
                % or selection pitch from harmony memory randomly
                selectVar = randi(hso.numberOfHarmonies);
                newHarmony(i) = hso.harmonyMemory(selectVar,i);
            end
            if randPAR < hso.PAR
                %adjust the i pitch
                newHarmony(i) = newHarmony(i) + rand *(hso.lowerBounds(i)+(hso.higherBounds(i)-hso.lowerBounds(i))) ;
            end
        end
        %         %find index the value which smaller than the lower bound
        %         indexValSmallerLowerBound = newHarmony < hso.lowerBounds ;
        %         %find index the value which bigger than the higher bound
        %         indexValBiggerHigherBound = newHarmony > hso.higherBounds;

        %replace the value which smaller than the lower bound value to lower bound value %
        newHarmony(newHarmony < hso.lowerBounds) = hso.lowerBounds(newHarmony < hso.lowerBounds);

        %replace the value which bigger than the higher bound value to higher bound value %
        newHarmony(newHarmony > hso.higherBounds) = hso.higherBounds(newHarmony > hso.higherBounds);

        %calculate fitness value for the new harmony
        newHarmonyFitVal = CostFun(newHarmony);

        % calculate the maximum fitness in fitnesses array
        [maxVal,indexMaxVal]=  max(hso.fitnessValue);

        if newHarmonyFitVal < maxVal
            %insert the new harmony to harmony memory
            hso.harmonyMemory(indexMaxVal,:) = newHarmony;
            hso.fitnessValue(indexMaxVal)= newHarmonyFitVal;
        end
    end

     semilogy(hso.fitnessValue,'LineWidth',2);
    [minValFinal,indexMinValFinal]=  min(hso.fitnessValue);
    fitval=minValFinal;
    sol = hso.harmonyMemory(indexMinValFinal,:);


    end

