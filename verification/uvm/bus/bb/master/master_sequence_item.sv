class master_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(master_sequence_item)

  //ADDRESS
  static int WRITE_DATA_TRANS;
  static int NO_OF_TRANS = 5;

  randc bit [3:0] AWID;
  randc bit [31:0] AWADDR;
  randc bit [3:0] AWLEN;
  randc bit [2:0] AWSIZE;
  randc bit [1:0] AWBURST;

  bit AWVALID;
  bit AWREADY;

  //DATA
  randc bit [3:0] WID;
  randc bit [31:0] WDATA[];

  bit [3:0] WSTRB[$];
  bit [31:0] MDATA[$];
  bit WVALID;
  bit WREADY;

  //RESP
  randc bit BREADY;

  bit BVALID;

  //READ ADDRESS
  randc bit [3:0] ARID;
  randc bit [31:0] ARADDR;
  randc bit [3:0] ARLEN;
  randc bit [2:0] ARSIZE;
  randc bit [1:0] ARBURST;

  //DELAYS
  randc bit [2:0] b_delay;
  randc bit [2:0] a_delay;
  randc bit [2:0] d_delay[];
  randc bit [2:0] rd_a_delay;
  randc bit [2:0] rd_d_delay;

  bit [31:0] Address_N;
  bit [2:0] Data_Bus_Bytes = 4;
  bit [2:0] Number_Bytes;
  bit [31:0] Aligned_Address;

  //bit [7:0] Wrap_Boundary;

  randc bit [4:0] Burst_Length;

  bit [2:0] Lower_Byte_Lane;
  bit [2:0] Upper_Byte_Lane;

  bit [3:0] temp;

  bit [31:0] address[];

  constraint a1 {AWADDR inside {[1 : 1000]};}

  constraint a2 {WDATA.size == Burst_Length;}

  constraint a3 {Burst_Length == AWLEN + 1;}

  constraint a4 {AWSIZE == 1;}

  constraint a5 {
    AWBURST != 2'b11;
    AWBURST == 2'b10;
  }

  constraint a7 {ARBURST != 2'b11;}

  constraint a6 {AWID == WID;}

  constraint a9 {d_delay.size == Burst_Length;}
  constraint a8 {ARADDR inside {[1 : 500]};}
  constraint a10 {AWLEN > 3;}

  constraint a11 {foreach (d_delay[i]) d_delay[i] >= 2;}
  //constraint a12{rd_d_delay!=0;}

  function void post_randomize;
    Number_Bytes = 2 ** AWSIZE;

    Aligned_Address = (AWADDR / Number_Bytes) * Number_Bytes;

    $display("Starting address is %0d", AWADDR);
    $display("Aligned_AWADDR is %0d", Aligned_Address);
    $display("AWSIZE is %0d", AWSIZE);

    $display("Number_Bytes is %0d", Number_Bytes);

    if (AWBURST == 2'b00) begin
      for (int i = 0; i < Burst_Length; i++) begin
        for (int j = 0; j < Number_Bytes; j++) begin
          temp[j] = 1'b1;
        end

        WSTRB.insert(i, temp);
        temp = 4'b0;
      end
    end
    else if (AWBURST == 2'b01 || AWBURST == 2'b10) begin
      for (int N = 1; N <= Burst_Length; N++) begin
        if (N == 1) begin
          Lower_Byte_Lane = AWADDR - (AWADDR / Data_Bus_Bytes) * Data_Bus_Bytes;
          $display("Lower_Byte_Lane is %0d", Lower_Byte_Lane);

          Upper_Byte_Lane = Aligned_Address +(Number_Bytes -1)-(AWADDR / Data_Bus_Bytes)*Data_Bus_Bytes;
          $display("Upper_Byte_Lane is %0d", Upper_Byte_Lane);

          for (int i = Lower_Byte_Lane; i <= Upper_Byte_Lane; i++) temp[i] = 1'b1;

          WSTRB.insert((N - 1), temp);

          //$display("strb %0b",temp);

          temp = 4'b0;
        end

        if (N != 1) begin
          Address_N = Aligned_Address + (N - 1) * Number_Bytes;

          Lower_Byte_Lane = Address_N - (Address_N / Data_Bus_Bytes) * Data_Bus_Bytes;

          Upper_Byte_Lane = Lower_Byte_Lane + Number_Bytes - 1;

          for (int i = Lower_Byte_Lane; i <= Upper_Byte_Lane; i++) temp[i] = 1'b1;

          WSTRB.insert((N - 1), temp);

          //$display("strb %0b",temp);

          temp = 4'b0;
        end
      end
    end
  endfunction

  extern function void do_print(uvm_printer printer);

  extern function new(string name = "master_sequence_item");
endclass

function void master_sequence_item::do_print(uvm_printer printer);
  super.do_print(printer);

  printer.print_field("AWID", this.AWID, 4, UVM_DEC);
  printer.print_field("AWADDR", this.AWADDR, 32, UVM_DEC);
  printer.print_field("AWLEN", this.AWLEN, 4, UVM_HEX);
  printer.print_field("AWBURST", this.AWBURST, 2, UVM_HEX);
  printer.print_field("AWSIZE", this.AWADDR, 3, UVM_HEX);

  foreach (WDATA[i]) printer.print_field($sformatf("WDATA[%0d]", i), this.WDATA[i], 32, UVM_HEX);

  foreach (WSTRB[i]) printer.print_field($sformatf("WSTRB[%0d]", i), this.WSTRB[i], 4, UVM_BIN);

  foreach (MDATA[i]) printer.print_field($sformatf("MDATA[%0d]", i), this.MDATA[i], 32, UVM_HEX);
endfunction

function master_sequence_item::new(string name = "master_sequence_item");
  super.new(name);
endfunction
