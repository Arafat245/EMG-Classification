function [Labels] = labelcreator()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Labels = cell(144,1);
% Labels(1:12) = {'HC'};
% Labels(13:24) = {'T-T'};
% Labels(25:36) = {'I-I'};
% Labels(37:48) = {'M-M'};
% Labels(49:60) = {'T-I'};
% Labels(61:72) = {'R-R'};
% Labels(73:84) = {'T-M'};
% Labels(85:96) = {'T-R'};
% Labels(97:108) = {'T-L'};
% Labels(109:120) = {'L-L'};
i = 1;
% Labels = cell(144,1);
%sub = 3;
%for j=1:sub
    Labels(i:i+17) = {'HC'};
    Labels(i+18:i+35) = {'T-T'};
    Labels(i+36:i+53) = {'I-I'};
    Labels(i+54:i+71) = {'M-M'};
    Labels(i+72:i+89) = {'T-I'};
    Labels(i+90:i+107) = {'R-R'};
    Labels(i+108:i+125) = {'T-M'};
    Labels(i+126:i+143) = {'T-R'};
    %i = i+96;
%end
%Labels(49:54) = {'T-L'};
%Labels(55:60) = {'L-L'};
% Labels(1:6) = {'HC'};
% Labels(7:12) = {'T-T'};
% Labels(13:18) = {'I-I'};
% Labels(19:24) = {'M-M'};
% Labels(25:30) = {'T-I'};
% Labels(31:36) = {'R-R'};
% Labels(37:42) = {'T-M'};
% Labels(43:48) = {'T-R'};
end

