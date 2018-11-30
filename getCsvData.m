function data_reshape = getCsvData(filename)
%GETCSVDATA load the csv data into cell array
%   
%

    fileID = fopen(filename,'r');
    % Start row is 1 since the first line is the heading (name of the columns)
    startRow = 1;
    data = textscan(fileID, '%d %d\n', 'Delimiter', ';',...
        'HeaderLines', startRow,'ReturnOnError', false);
    fclose(fileID);

    [M N] = size(data{1,1});
    data_reshape = cell(M,2);

    for i=1:M
        data_reshape{i, 1} = data{1,1}(i);
        data_reshape{i, 2} = data{1,2}(i);
    end



end