`timescale 1ns / 1ps

module test_bench;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg clk;

    // Outputs
    wire cout;
    wire [3:0] s;

    // Instantiate the adder module
    adder uut (
        .a(a),
        .b(b),
        .clk(clk),
        .cout(cout),
        .s(s)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test cases
    initial begin
        // Display headers
        $display("Time\tClk\tA\tB\tS\tCout");

        // Monitor signals
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, a, b, s, cout);

        // Test case 1: Add 0 + 0
        a = 4'b0000; b = 4'b0000; #20;

        // Test case 2: Add 1 + 1
        a = 4'b0001; b = 4'b0001; #20;

        // Test case 3: Add 4 + 3
        a = 4'b0100; b = 4'b0011; #20;

        // Test case 4: Add 15 + 15
        a = 4'b1111; b = 4'b1111; #20;

        // Test case 5: Add 8 + 7
        a = 4'b1000; b = 4'b0111; #20;

        // End simulation
        $finish;
    end
endmodule
