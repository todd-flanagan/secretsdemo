function setSecret(name)

prompt = {'Enter a value:'};
dlgtitle = 'Set a secret';
dims = [1 35]; % Specifies the number of rows and columns in the dialog

% Show the input dialog
answer = inputdlg(prompt, dlgtitle, dims);

% Check if user provided an answer or pressed cancel
if ~isempty(answer)
    % Retrieve the value entered by the user
    value = answer{1};
    if exist("fakevault.mat", "file")
        s = load("fakevault", "secrets");
        secrets = s.secrets;
    else
        secrets = dictionary;
    end
    secrets(name) = value;
    save("fakevault", "secrets");
else
    disp('User pressed cancel.');
end