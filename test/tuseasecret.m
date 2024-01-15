classdef tuseasecret < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (Test)
        % Test methods

        function valueTest(testCase)
            testCase.verifyEqual("testSecretValue", useasecret());
        end
    end

end