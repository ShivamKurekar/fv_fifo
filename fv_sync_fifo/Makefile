# sync_fifo/Makefile -- run from the repo root

JG        ?= jg
JG_FLAGS  ?= -allow_unsupported_OS

TCL_DIR   := fv/run
RES_DIR   := results

SHELL       := /bin/bash
.SHELLFLAGS := -o pipefail -c

.PHONY: rr_arb rr_arb_rst regress clean

# ---------------- interactive (GUI stays on) ----------------
rstn: fv/filelist/rstn_filelist.f
	@mkdir -p $(RES_DIR)/$@
	OUT_DIR=$(RES_DIR)/$@ \
	$(JG) $(JG_FLAGS) -proj $(RES_DIR)/$@/jgproject $(TCL_DIR)/rstn.tcl \
	    2>&1 | tee $(RES_DIR)/$@/run.log

sync: fv/filelist/sync_filelist.f
	@mkdir -p $(RES_DIR)/$@
	N=$(N) OUT_DIR=$(RES_DIR)/$@ \
	$(JG) $(JG_FLAGS) -proj $(RES_DIR)/$@/jgproject $(TCL_DIR)/rr_arb.tcl \
	    2>&1 | tee $(RES_DIR)/$@/run.log

clean:
	rm -rf $(RES_DIR) jgproject jgproject_* *.log
