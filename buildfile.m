function plan = buildfile()

plan = buildplan(localfunctions);
plan("test") = matlab.buildtool.tasks.TestTask("test", SourceFiles="src");
plan.DefaultTasks = "test";

plan("clean") = matlab.buildtool.tasks.CleanTask();

end

