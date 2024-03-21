a = matlab.addons.installedAddons;
if isempty(a(strcmp(a.Name, 'ml'), :))
    matlab.addons.install("ml.mltbx")
end