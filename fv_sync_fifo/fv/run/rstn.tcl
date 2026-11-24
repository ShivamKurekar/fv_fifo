clear -all

analyze -sv17 -f fv/filelist/rstn_filelist.f

elaborate -top sync_fifo -parameter DATA_WIDTH 1 -parameter DEPTH 4 -create_related_covers {precondition witness}

clock i_wr_clk

reset -none
