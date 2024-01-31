module peripheral_design (
  input  wire        pclk,
  input  wire        presetn,
  input  wire [15:0] paddr,
  input  wire [ 1:0] pstrb,
  output reg         pwrite,
  output reg         pready,
  input  wire        psel,
  input  wire [ 7:0] pwdata,
  output reg  [ 7:0] prdata,
  input  wire        penable,
  input  wire        pslverr
);

  bit [2:0] st;

  // Basic arbiter, supports two masters, 0 has priority over 1

  always @(posedge pclk or posedge presetn) begin
    if (presetn) begin
      pready <= 1'b0;
      st     <= 3'h0;
    end else begin
      case (st)
        0: begin  // Begin out of Reset
          pready <= 1'b1;
          st     <= 3'h3;
        end
        3: begin  // Start state
          pready <= 1'b0;
          st <= 3'h1;
        end
        4: begin  // No-op state
          pready <= 1'b1;
          st     <= 3'h3;
        end
        1: begin  // Addr state
          pready <= 1'b0;
          st     <= 3'h2;
        end
        2: begin  // Data state
          if ((pslverr == 1) || ((psel == 0) && (penable == 0))) begin
            pready <= 1'b1;
            st     <= 3'h3;
          end else begin
            pready <= 1'b0;
            st     <= 3'h2;
          end
        end
      endcase
    end
  end

  always @(posedge pclk or posedge presetn) begin
    if (presetn) begin
      pwrite <= 1'bZ;
    end else if (pready) begin
      pwrite <= 1'b0;
    end else begin
      pwrite <= 1'bZ;
    end
  end

endmodule
