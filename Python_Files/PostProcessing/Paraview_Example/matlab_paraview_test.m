% Cleaning Section:
clear all       % clear all variables at workspace
close all       % close all external windows of matlab
clc             % clear command window

sofc = cd	% assign the sofc path to a variable

% find paraview path in PC
name_file = 'paraview.exe';                     % assign the file to search to a variable
path_file = py.find_path.find_path(name_file);	% run a "path_file.py" code from MatLab 
x = length(path_file);                          % return the length of the 'path_file' variable
y = length(name_file);          % return the length of the 'name_file' variable
z = x-y;                        % return the diffence between the lengths of 'path_file' and 'name_file'
path_file = path_file(1,1:z);   % return the directory path where is the file 
path_file = string(path_file);	% convert 


try
    [status,message,messageID] = copyfile('testpv205.py',path_file);
    paraview_file_status = exist testpv205.py				% verify if the file was copied
    if (paraview_file_status == 0)
	disp("Warning: The file was not copied!")
    end
catch
    if (status~=0)
        disp("This program must be run as administrator mode")
    end
end
    
cd (path_file)

exist pvpython.exe


!pvpython testpv205.py

% If I have problems with the programa execution, show me a message
% Use commands try - catch

cd (sofc)


