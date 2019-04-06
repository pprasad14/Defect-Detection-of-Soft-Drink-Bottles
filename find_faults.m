function [fault_list] = find_faults(I)
    
    fault_list = string(zeros(6,2));
    fault_list(1,1) = "Cap: ";
    fault_list(2,1) = "Filled Level: ";
    fault_list(3,1) = "Label: ";
    fault_list(4,1) = "Label Print: ";
    fault_list(5,1) = "Label Straight: ";
    fault_list(6,1) = "Deformed: ";
    
    %% cap missing
    cap_missing = cap(I);
    if cap_missing == 0
        fault_list(1,2) = "Cap Present";
    else
        fault_list(1,2) = "Cap Missing";
    end
    
    %% filled level
    filled_level = filled(I);
    if filled_level == 1
        fault_list(2,2) = "Over-filled";
    elseif filled_level == 0
        fault_list(2,2) = "Normal-filled";
    else
        fault_list(2,2) = "Under-filled";
    end
       
    %% label missing
    label_missing = label(I);
    if label_missing == 1
        fault_list(3,2) = "Label missing";
    else 
        fault_list(3,2) = "Label Present";
    end
    
    %% label print
    if label_missing == 0
        
        label_print = labelprint(I);
        if label_print == 1
            fault_list(4,2) = "Label Print Missing";
        else
            fault_list(4,2) = "Label Print Present";
        end
    else
        fault_list(4,2) = "NULL since no Label";
    end
                    
    %% label straight
    if label_missing == 0
        
        label_straight = labelstraight(I);
        if label_straight == 1
            fault_list(5,2) = "Label Not Straight";
        else
            fault_list(5,2) = "Label Straight";
        end
    else
        fault_list(5,2) = "NULL since no Label";
    end
    
    %% deformed
    
    if filled_level == -1
        fault_list(6,2) = "Uncertain since Underfilled";
    else
        is_deformed = deformed(I);
        if is_deformed == 1
            fault_list(6,2) = "Deformed";
        else
            fault_list(6,2) = "Not Deformed";
        end
    end
end

