classdef tuseasecret < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (Test)
        % Test methods

        function valueTest(testCase)
            testCase.verifyEqual("secretValue", useasecret());
            testCase.verifyEqual(fakeGetSecret("isasecret"), "testvale");
        end
    end

end