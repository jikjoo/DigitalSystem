
module sram_ff(clka, rst,ena, wea, addra, dina, douta);
parameter ADDR_WIDTH = 4;
parameter BIT_WIDTH = 8;
input clka, rst, ena,wea;
input [ADDR_WIDTH-1:0] addra;
input [BIT_WIDTH-1:0] dina;
output reg [BIT_WIDTH-1:0] douta;
reg [BIT_WIDTH-1:0] SRAM [(1<<ADDR_WIDTH)-1:0];
integer i;

always@(posedge clka)
begin
	if(!rst) douta <= 0;
	else douta <= SRAM[addra];
end
always@(posedge clka)
begin
	if(wea) SRAM[addra] <= dina;
end

endmodule

