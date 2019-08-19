function [EMGData] = read2(sub,f)
if nargin<1
    sub = 1;
end

Labels = cell(12,1);
lvalue = {'HC';'T-T';'I-I';'M-M';'T-I';'R-R';'T-M';'T-R'};
data = zeros(3,20000);

class = 8;
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
%             case 9 
%                filename = sprintf('./S%d-Delsys-15Class/R_L%d.csv',sub,k);
%             case 10 
%                 filename = sprintf('./S%d-Delsys-15Class/R_R%d.csv',sub,k);
%             case 11 
%                 filename = sprintf('./S%d-Delsys-15Class/T_I%d.csv',sub,k);
%             case 12 
%                 filename = sprintf('./S%d-Delsys-15Class/T_L%d.csv',sub,k);
%             case 13 
%                 filename = sprintf('./S%d-Delsys-15Class/T_M%d.csv',sub,k);
%             case 14 
%                 filename = sprintf('./S%d-Delsys-15Class/T_R%d.csv',sub,k);
%             case 15 
%                 filename = sprintf('./S%d-Delsys-15Class/T_T%d.csv',sub,k);
        end
      
        temp_data = csvread(filename);
    
        t2 = temp_data;
        t = zeros(3,1000);
        
        for m=1:1000:size(t2,1)     
            n = m+999;
            win = t2(m:n,:);
            if t == 0
               t = transpose(win);
            else
               t = [t;transpose(win)];
            end
        end
        
        ft = filter(f,t);
        
        l(1:size(ft,1),1) = lvalue(j);
        
        if data == 0 
           data = ft;
           Labels = l;
        else
           data = [data;ft];
           Labels = [Labels;l];
        end              
    end
end
EMGData.Data = data;
EMGData.Labels = Labels;
end