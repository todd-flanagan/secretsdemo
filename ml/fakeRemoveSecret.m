function fakeRemoveSecret(name)
arguments
    name {isStringScalar}
end

    if exist("fakevault.mat", "file")
        s = load("fakevault", "secrets");
        if s.secrets.isKey(name)
            secrets = s.secrets.remove(name);
            save("fakevault.mat", "secrets");
        else
            e = MException("FakeSecrets:NoSecrets", "No value for " + string(name));
            throw(e);
        end
    else
        e = MException("FakeSecrets:NoSecrets", "No secrets defined");
        throw(e);
    end
end