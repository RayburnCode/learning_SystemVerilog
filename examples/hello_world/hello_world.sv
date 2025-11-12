module test ();
 initial begin
    $display("hello world");
// Delay to allow message to be printed before simulation ends
    #1ns;
    $display("hello again!");
 end    
endmodule



// clk = clock
// posiedge = positive edge. 0 to 1
// negedge = negative edge 1 to 0