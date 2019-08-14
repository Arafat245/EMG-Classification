function [EMGData] = read(sub,f)
if nargin<1
    sub = 1;
end

Labels = cell(12,1);
lvalue = {'HC';'T-T';'I-I';'M-M';'T-I';'R-R';'T-M';'T-R'};
data = zeros(3,20000);

% win_size = 256;
% win_inc = 128;
% ar_order = 4;

class = 8;
index = 6;

for i=1:sub
  for j=1:class
    for k=1:index
        switch j
            case 1
                filename = sprintf('./EMG-S%d/HC-%d.csv',i,k);
            case 2
                filename = sprintf('./EMG-S%d/T-T%d.csv',i,k);
            case 3
                filename = sprintf('./EMG-S%d/I-I%d.csv',i,k);
            case 4
                filename = sprintf('./EMG-S%d/M-M%d.csv',i,k); 
            case 5 
                filename = sprintf('./EMG-S%d/T-I%d.csv',i,k);
            case 6
                filename = sprintf('./EMG-S%d/R-R%d.csv',i,k);
            case 7 
                filename = sprintf('./EMG-S%d/T-M%d.csv',i,k);
            case 8 
                filename = sprintf('./EMG-S%d/T-R%d.csv',i,k);
            %case 9 
               %filename = sprintf('./EMG-S%d/T-L%d.csv',sub,k);
            %case 10 
                %filename = sprintf('./EMG-S%d/L-L%d.csv',sub,k);
        end
        %data = csvread(filename);
        temp_data = csvread(filename);
        %t1 =((temp_data(:,1)+temp_data(:,2))/2);
        %t2 = horzcat(temp_data, t1);
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
end  
EMGData.Data = data;
EMGData.Labels = Labels;
end