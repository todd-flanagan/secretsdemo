function v = fakeGetSecret(name)
arguments
    name {isStringScalar}
end

    if exist("fakevault.mat", "file")
        s = load("fakevault", "secrets");
        if s.secrets.isKey(name)
            v = s.secrets(name);
        else
            e = MException("FakeSecrets:NoSecretValue", "No value for " + string(name));
            throw(e);
        end
    else
        e = MException("FakeSecrets:NoSecrets", "No secrets defined");
        throw(e);
    end
end
