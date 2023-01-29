module fsm (
  input clk,
  input rst,
  input in,
  output out
);
  
  parameter IDLE  = 0;
  parameter S0001 = 1;
  parameter S0010 = 2;
  parameter S0101 = 3;
  parameter S1011 = 4;

  reg [2:0] current_state;
  reg [2:0] next_state;

  assign out = current_state == S1011 ? 1 : 0;

  always @ (posedge clk) begin
    if (!rst)
      current_state <= IDLE;
    else 
      current_state <= next_state;
  end

  always @ (current_state or in) begin
    case (current_state)
      IDLE : begin
        if (in)
          next_state = S0001;
        else
          next_state = IDLE;
      end

      S0001: begin
        if (in)
          next_state = IDLE;
        else
          next_state = S0010;
      end

      S0010 : begin
        if (in)
          next_state = S0101;
        else
          next_state = IDLE;
      end

      S0101 : begin
        if (in)
          next_state = S1011;
        else
          next_state = IDLE;
      end

      S1011: begin
        next_state = IDLE;
      end
    endcase
  end
endmodule
