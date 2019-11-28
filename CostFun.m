    %cost function
    %------------------------------written by : Ahmad Al-Shalabi---------------%
    % input: harmony array , output : fitness Values Array
    function fitValArry = CostFun(hm)
                    fitValArry = (hm(:,1)).^2 + (hm(:,2)).^2 +  25.* (((sin(hm(:,1))).^2 + (sin(hm(:,2))).^2 ));

    end