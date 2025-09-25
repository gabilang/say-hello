import ballerina/io;
import ballerina/jballerina.java;
import ballerina/log;

public function main() {
    io:println("Program started. Waiting for 1 minute...");
    
    // Wait for 1 minute (60000 milliseconds)
    error? result = sleep(60000);
    if (result is error) {
        io:println("Error occurred during sleep: ", result.message());
        return;
    }
    
    log:printInfo("Hello, World! (logged after 1 minute)");
}

function sleep(int millis) returns error? = @java:Method {
    'class: "java.lang.Thread",
    name: "sleep",
    paramTypes: ["long"]
} external;
