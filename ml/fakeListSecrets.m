function names = fakeListSecret()

    if exist("fakevault.mat", "file")
        s = load("fakevault", "secrets");
        names = s.secrets.keys;
    else
        e = MException("FakeSecrets:NoSecrets", "No secrets defined");
        throw(e);
    end
end
