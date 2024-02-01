module peripheral_design (
  input  wire        pclk,
  input  wire        presetn,

  input  wire [15:0] paddr,
  input  wire [ 1:0] pstrb,
  input  wire        pwrite,
  output reg         pready,
  input  wire        psel,
  input  wire [ 7:0] pwdata,
  output reg  [ 7:0] prdata,
  input  wire        penable,
  output reg         pslverr
);

  const logic [1:0] SETUP    = 0;
  const logic [1:0] W_ENABLE = 1;
  const logic [1:0] R_ENABLE = 2;

  // RAM Memory

  logic [7:0] memory [0:255];

  logic [1:0] apb4_state;

  always @(posedge pclk or negedge presetn) begin
    if (presetn == 0) begin
      prdata <= 0;
      pready <= 1;
 
      for (int i = 0; i < 256; i++) begin
        memory[i] = 0;
      end

      apb4_state <= 0;
    end else begin
      case (apb4_state)
        SETUP: begin
          prdata <= 0;

          if (psel && !penable) begin
            if (pwrite) begin
              apb4_state <= W_ENABLE;
            end else begin
              apb4_state <= R_ENABLE;
              prdata <= memory[paddr];
            end
          end
        end
        W_ENABLE: begin
          if (psel && penable && pwrite) begin
            memory[paddr] <= pwdata;
          end
          apb4_state <= SETUP;
        end
        R_ENABLE: begin
          apb4_state <= SETUP;
        end
      endcase
    end
  end

endmodule
