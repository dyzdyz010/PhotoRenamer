import Foundation

var rawPath = ""
//print(CommandLine.arguments[1])
print(FileManager.default.currentDirectoryPath)

if CommandLine.argc == 1 {
    rawPath = FileManager.default.currentDirectoryPath
} else {
    rawPath = buildPath(filename: CommandLine.arguments[1])
    print(rawPath)
}

process(path: rawPath)

print("Complete!")
