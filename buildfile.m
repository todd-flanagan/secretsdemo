function plan = buildfile()

plan = buildplan(localfunctions)
plan("test") = matlab.buildtool.tasks.TestTask("test", Source="src");