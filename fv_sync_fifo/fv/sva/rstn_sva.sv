module sync_fifo_rstn_sva #(parameter DATA_WIDTH = 64,
                   parameter DEPTH = 512)(
    
    input i_rstn,

    /* wr clk domain */
    input i_wr_clk,
    input i_wr_en,
    input [DATA_WIDTH-1: 0] i_wr_data,

    input o_full,
    input [$clog2(DEPTH): 0] wr_data_count,
    
    /* rd clk domain */
    // input i_rd_clk,
    input i_rd_en,
    
    input [DATA_WIDTH-1: 0] o_rd_data,
    input o_empty,
    input [$clog2(DEPTH): 0] rd_data_count,
    input count
);

// when reset is asserted it should clear the registers
sf_rst_01: assert property (
	!i_rstn |-> (count == '0 && o_empty == '1 && o_full == '0)
);

endmodule


bind sync_fifo sync_fifo_rstn_sva #(.DATA_WIDTH(1), .DEPTH(4)) inst (.*);
