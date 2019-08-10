function [Labels] = labelcreator2()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Labels = cell(24,1);

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

Labels(1:24) = {'HC'};
Labels(25:48) = {'T-T'};
Labels(49:72) = {'I-I'};
Labels(73:96) = {'M-M'};
Labels(97:120) = {'T-I'};
% Labels(121:144) = {'M-M'};
% Labels(145:168) = {'M-R'};
% Labels(169:192) = {'MRL'};
% Labels(193:216) = {'R-L'};
% Labels(217:240) = {'R-R'};
% Labels(241:264) = {'T-I'};
% Labels(265:288) = {'T-L'};
% Labels(289:312) = {'T-M'};
% Labels(313:336) = {'T-R'};
% Labels(337:360) = {'T-T'};

% Labels(1:27) = {'HC'};
% Labels(28:54) = {'T-T'};
% Labels(55:81) = {'I-I'};
% Labels(82:108) = {'M-M'};
% Labels(109:135) = {'T-I'};
% Labels(136:162) = {'R-R'};
% Labels(163:189) = {'T-M'};
% Labels(190:216) = {'T-R'};

% Labels(1:3) = {'HC'};
% Labels(4:6) = {'T-T'};
% Labels(7:9) = {'I-I'};
% Labels(10:12) = {'M-M'};
% Labels(13:15) = {'T-I'};
% Labels(16:18) = {'R-R'};
% Labels(19:21) = {'T-M'};
% Labels(22:24) = {'T-R'};
end

