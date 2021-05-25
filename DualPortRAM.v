module dual_port_ram 
    (   input clk,
        input wr_en,
        input [7:0] data_in,
        input [3:0] addr_in_0,
        input [3:0] addr_in_1,
        input port_en_0,
        input port_en_1,
        output [7:0] data_out_0,
        output [7:0] data_out_1
    );

//memory declaration.
reg [7:0] mem[0:15];

//writing to the RAM
always@(posedge clk)
begin
    if(port_en_0 == 1 && wr_en == 1)    //check enable signal and if write enable is ON
        mem[addr_in_0] <= data_in;
end

//always reading from the ram, irrespective of clock.
assign data_out_0 = port_en_0 ? mem[addr_in_0] : 'dZ;   
assign data_out_1 = port_en_1 ? mem[addr_in_1] : 'dZ;   

endmodule 