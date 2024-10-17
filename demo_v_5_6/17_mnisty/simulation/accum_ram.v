module ram_accum(
    input clka,
    input cea,             // ?????
    input [7:0] addra,      // ????
    input [13:0] dia,   // ????

    input clkb,
    input [7:0] addrb,
    input ceb,
    output reg [13:0] dob
);

    // ROM?????????784????8?
    reg [13:0] ram [0:191];


    // ???
    always @(posedge clka) begin
        if (cea) begin
            ram[addra] <= dia;  // ?ROM?????????????
        end
    end
 
    integer i;

    always @(posedge clkb) begin
        if(ceb) begin
            dob <= ram[addrb];
        end
    end

endmodule 
