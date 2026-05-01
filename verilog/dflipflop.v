module dflipflop(
    input d,
    input enable,
    output res
);


reg resreg;

always @(posedge enable) begin    
    if(enable)
        resreg <= d;
end

assign res = resreg;

endmodule
