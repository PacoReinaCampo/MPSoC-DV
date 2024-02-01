module peripheral_design #(
  parameter MEMORY_SIZE = 256  // Memory Size
) (
  input  wire        mclk,
  input  wire        rst,

  input  wire [ 1:0] wen,
  input  wire        cen,
  input  wire [15:0] addr,
  input  wire [ 7:0] din,
  output reg  [ 7:0] dout
);

  // RAM Memory

  reg  [7:0] memory [0:(MEMORY_SIZE/2)-1];

  reg  [15:0] ram_address_register;

  wire [7:0] memory_value = memory[addr];

  always @(posedge mclk) begin
    if (~rst) begin
      memory[addr] <= 0;
    end else if (~cen & addr < (MEMORY_SIZE/2)) begin
      if (wen == 2'b00) begin
        memory[addr] <= din;
      end else if (wen == 2'b01) begin
        memory[addr] <= {din[7:4], memory_value[3:0]};
      end else if (wen == 2'b10) begin
        memory[addr] <= {memory_value[7:4], din[3:0]};
      end

      ram_address_register <= addr;
    end
  end

  assign dout = memory[ram_address_register];

endmodule
