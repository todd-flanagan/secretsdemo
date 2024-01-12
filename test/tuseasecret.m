classdef tuseasecret < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (Test)
        % Test methods

        function valueTest(testCase)
            disp("secret value[" + getenv("isasecret") + "]");
            testCase.verifyEqual("secretValue", useasecret());
        end
    end

end
