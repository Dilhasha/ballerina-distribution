import ballerina/test;
import ballerina/io;

any[] outputs = [];
int counter = 0;

// This is the mock function which will replace the real function
@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
public function mockPrint(any... s) {
    outputs[counter] = s[0];
    counter += 1;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main();
    test:assertEquals(outputs[0], 10);
    test:assertEquals(outputs[1], "error: 'string' cannot be converted to 'int'");
    test:assertEquals(outputs[2], 1);
    test:assertEquals(outputs[3], true);
    test:assertEquals(outputs[4], true);
    test:assertEquals(outputs[5], 3.14);
}