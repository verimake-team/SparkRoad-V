module ram_24x24x3(
    input clka,
    input cea,             // ?????
    input [10:0] addra,      // ????
    input [11:0] dia,   // ????

    input clkb,
    input rstb,
    input [10:0] addrb,
    input ceb,
    output reg [11:0] dob
);

    // ROM?????????784????8?
    reg [11:0] ram [0:1727];


    // ???
    always @(posedge clka) begin
        if (cea) begin
            ram[addra] <= dia;  // ?ROM?????????????
        end
    end
 
    integer i;

    always @(posedge clkb) begin
        if(rstb) begin
            for(i=0; i<1728; i=i+1)
                ram[i] <= 0;
        end else begin
            if(ceb) begin
                dob <= ram[addrb];
            end
        end
    end

endmodule //ram_24x24x3

