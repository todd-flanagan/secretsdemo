classdef tml < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (Test)
        % Test methods

        function getSecretTest(testCase)
            name = "isasecret";
            notAName = "notasecret";
            if exist("fakevault.mat", "file")
                delete("fakevault.mat")
            end
            v = getenv(name);
            if isempty(v)
                o = onCleanup(@()unsetenv(name));
            else
                o = onCleanup(@()setenv(name, v));
            end
            testCase.verifyError(@()fakeGetSecret(name), "FakeSecrets:NoSecrets");

            copyfile("data/fakevault.mat.data", "fakevault.mat");
            testCase.verifyError(@()fakeGetSecret(notAName), "FakeSecrets:NoSecretValue");

            testCase.verifyEqual(fakeGetSecret(name), "testvalue");

            setenv(name, "overridden");
            testCase.verifyEqual(fakeGetSecret(name), "overridden");

        end
        function setSecretTest(testCase)
            
        end
        function listSecretsTest(testCase)
            if exist("fakevault.mat", "file")
                delete("fakevault.mat")
            end
            name = "isasecret";
            testCase.verifyError(@()fakeGetSecret(name), "FakeSecrets:NoSecrets");

            copyfile("data/fakevault.mat.data", "fakevault.mat");

            testCase.verifyEqual(fakeListSecrets(), name);
        end

        function removeSecretTest(testCase)
            if exist("fakevault.mat", "file")
                delete("fakevault.mat")
            end
            name = "isasecret";
            notAName = "notasecret";

            testCase.verifyError(@()fakeRemoveSecret(name), "FakeSecrets:NoSecrets");

            copyfile("data/fakevault.mat.data", "fakevault.mat");
            testCase.verifyError(@()fakeRemoveSecret(notAName), "FakeSecrets:NoSecretValue");

            fakeRemoveSecret(name);
            testCase.verifyEmpty(fakeListSecrets());
         end
    end

end