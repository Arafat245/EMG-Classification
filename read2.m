function [EMGData] = read2(sub)
if nargin<1
    sub = 1;
end

data = zeros(1,20000);

% win_size = 256;
% win_inc = 128;
% ar_order = 4;

class = 5;
index = 3;
for j=1:class
    for k=1:index
        switch j
            case 1
                filename = sprintf('./S%d-Delsys-15Class/HC_%d.csv',sub,k);
            case 2
                filename = sprintf('./S%d-Delsys-15Class/T_T%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/I_I%d.csv',sub,k);
            case 3
                filename = sprintf('./S%d-Delsys-15Class/I_I%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/I_M%d.csv',sub,k);
            case 4
                filename = sprintf('./S%d-Delsys-15Class/M_M%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/IMR%d.csv',sub,k); 
            case 5 
                filename = sprintf('./S%d-Delsys-15Class/T_I%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/L_L%d.csv',sub,k);
            case 6
                filename = sprintf('./S%d-Delsys-15Class/R_R%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/M_M%d.csv',sub,k);
            case 7 
                filename = sprintf('./S%d-Delsys-15Class/T_M%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/M_R%d.csv',sub,k);
            case 8 
                filename = sprintf('./S%d-Delsys-15Class/T_R%d.csv',sub,k);
                %filename = sprintf('./S%d-Delsys-15Class/MRL%d.csv',sub,k);
            case 9 
               filename = sprintf('./S%d-Delsys-15Class/R_L%d.csv',sub,k);
            case 10 
                filename = sprintf('./S%d-Delsys-15Class/R_R%d.csv',sub,k);
            case 11 
                filename = sprintf('./S%d-Delsys-15Class/T_I%d.csv',sub,k);
            case 12 
                filename = sprintf('./S%d-Delsys-15Class/T_L%d.csv',sub,k);
            case 13 
                filename = sprintf('./S%d-Delsys-15Class/T_M%d.csv',sub,k);
            case 14 
                filename = sprintf('./S%d-Delsys-15Class/T_R%d.csv',sub,k);
            case 15 
                filename = sprintf('./S%d-Delsys-15Class/T_T%d.csv',sub,k);
        end
        %data = csvread(filename);
        temp_data = csvread(filename);
        %t1 =((temp_data(:,1)+temp_data(:,2)+temp_data(:,3)+temp_data(:,4)+temp_data(:,5)+temp_data(:,6)+temp_data(:,7)+temp_data(:,8))/8);
        %d = horzcat(temp_data,t1);
        t2 = transpose(temp_data);
        
        if data == 0 
          data = t2;
          
        else
            data = [data;t2];
        end
            
%         ch1 = temp_data(:,1);
%         ch2 = temp_data(:,2);
%         filtered_1 = filter(Hd, ch1);
%         filtered_2 =  filter(Hd, ch2);
        %t1 =((temp_data(:,1)+temp_data(:,2))/20000);
        %t1 =((filtered_1+filtered_2)/20000);
        
        %data = horzcat(temp_data,t1);
        %data = normc(data); %normalization of raw data, might not be necessary                
    end
end
Labels = labelcreator2();
EMGData.Data = data;
EMGData.Labels = Labels;
end