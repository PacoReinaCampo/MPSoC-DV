module peripheral_design #(
  // Memory Size
  parameter MEMORY_SIZE = 256
) (
  input clk,
  input rst,

  input [31:0] adr_i,
  input [31:0] dat_i,
  input [ 3:0] sel_i,
  input        we_i,
  input [ 1:0] bte_i,
  input [ 2:0] cti_i,
  input        cyc_i,
  input        stb_i,

  output reg        ack_o,
  output reg        err_o,
  output reg [31:0] dat_o,

  output sig_read,
  output sig_write
);

  localparam [2:0] CTI_CLASSIC      = 3'b000;
  localparam [2:0] CTI_CONST_BURST  = 3'b001;
  localparam [2:0] CTI_INC_BURST    = 3'b010;
  localparam [2:0] CTI_END_OF_BURST = 3'b111;

  localparam [1:0] BTE_LINEAR  = 2'd0;
  localparam [1:0] BTE_WRAP_4  = 2'd1;
  localparam [1:0] BTE_WRAP_8  = 2'd2;
  localparam [1:0] BTE_WRAP_16 = 2'd3;

  function is_last;
    input [2:0] cti;
    begin
      case (cti)
        CTI_CLASSIC      : is_last = 1'b1;
        CTI_CONST_BURST  : is_last = 1'b0;
        CTI_INC_BURST    : is_last = 1'b0;
        CTI_END_OF_BURST : is_last = 1'b1;
      endcase
    end
  endfunction

  function [31:0] wb_next_adr;
    input [31:0] adr_i;
    input [ 2:0] cti_i;
    input [ 2:0] bte_i;

    input integer dw;

    reg [31:0] adr;

    integer shift;

    begin
      if (dw == 64) begin
        shift = 3;
      end else if (dw == 32) begin
        shift = 2;
      end else if (dw == 16) begin
        shift = 1;
      end else begin
        shift = 0;
      end
      adr = adr_i >> shift;
      if (cti_i == CTI_INC_BURST) begin
        case (bte_i)
          BTE_LINEAR  : adr = adr + 1;
          BTE_WRAP_4  : adr = {adr[31:2], adr[1:0]+2'd1};
          BTE_WRAP_8  : adr = {adr[31:3], adr[2:0]+3'd1};
          BTE_WRAP_16 : adr = {adr[31:4], adr[3:0]+4'd1};
        endcase
      end
      wb_next_adr = adr << shift;
    end
  endfunction

  reg  [31:0] adr_r;

  wire [31:0] next_adr;

  wire        valid = cyc_i & stb_i;

  reg         valid_r;

  reg         is_last_r;

  wire new_cycle = (valid & !valid_r) | is_last_r;

  wire [31:0] adr = new_cycle ? adr_i : next_adr;

  wire ram_we = we_i & valid & ack_o;

  reg [31:0] memory[0:MEMORY_SIZE-1];

  assign next_adr = wb_next_adr(adr_r, cti_i, bte_i, 32);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      is_last_r <= 0;
    end else begin
      is_last_r <= is_last(cti_i);
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      adr_r   <= 32'b0;
      valid_r <= 1'b0;
      ack_o   <= 1'b0;
    end else begin
      adr_r   <= adr;
      valid_r <= valid;
      ack_o   <= valid & (!((cti_i == 3'b000) | (cti_i == 3'b111)) | !ack_o);
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      err_o <= 1'b0;
    end else begin
      if (adr_i > MEMORY_SIZE) begin
        err_o <= 1'b1;
      end else begin
        err_o <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if (ram_we & sel_i[0]) begin
      memory[adr_r[31:2]][7:0] <= dat_i[7:0];
    end

    if (ram_we & sel_i[1]) begin
      memory[adr_r[31:2]][15:8] <= dat_i[15:8];
    end

    if (ram_we & sel_i[2]) begin
      memory[adr_r[31:2]][23:16] <= dat_i[23:16];
    end

    if (ram_we & sel_i[3]) begin
      memory[adr_r[31:2]][31:24] <= dat_i[31:24];
    end

    dat_o <= memory[adr[31:2]];
  end

endmodule
