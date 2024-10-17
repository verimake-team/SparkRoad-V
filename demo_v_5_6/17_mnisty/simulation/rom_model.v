module rom_8x784 (
    input wire clk,
    input wire ren,             // ?????
    input wire [9:0] addr,      // ????
    output reg [7:0] data_out   // ????
);

    // ROM?????????784????8?
    reg [7:0] rom [0:783];

    integer i;

    // ???ROM??
    initial begin
        $readmemh("C:/Users/VeriMake_C1/Desktop/lyj/mnisty/mnist_input/0_04.txt", rom);
    end

    // ???
    always @(posedge clk) begin
        if (ren) begin
            data_out <= rom[addr];  // ?ROM?????????????
        end
    end

endmodule

