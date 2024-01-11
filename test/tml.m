classdef tml < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (Test)
        % Test methods

        function getSecretTest(testCase)
            if exist("fakevault.mat", "file")
                delete("fakevault.mat")
            end
            name = "isasecret";
            notAName = "notasecret";
            testCase.verifyError(@()fakeGetSecret(name), "FakeSecrets:NoSecrets");

            copyfile("data/fakevault.mat.data", "fakevault.mat");
            testCase.verifyError(@()fakeGetSecret(notAName), "FakeSecrets:NoSecretValue");

            testCase.verifyEqual(fakeGetSecret(name), "testvalue");
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