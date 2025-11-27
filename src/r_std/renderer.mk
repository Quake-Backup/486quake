
$(BUILDDIR)/486quake/r_${RENDERER}/draw.o :   $(SRC_DIR)/r_${RENDERER}/draw.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_${RENDERER}/d_edge.o :   $(SRC_DIR)/r_${RENDERER}/d_edge.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_${RENDERER}/d_fill.o :   $(SRC_DIR)/r_${RENDERER}/d_fill.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_${RENDERER}/d_init.o :   $(SRC_DIR)/r_${RENDERER}/d_init.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_${RENDERER}/d_modech.o : $(SRC_DIR)/r_${RENDERER}/d_modech.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_part.o :   $(SRC_DIR)/r_${RENDERER}/d_part.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_polyse.o : $(SRC_DIR)/r_${RENDERER}/d_polyse.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_scan.o :   $(SRC_DIR)/r_${RENDERER}/d_scan.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_sky.o :    $(SRC_DIR)/r_${RENDERER}/d_sky.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_sprite.o : $(SRC_DIR)/r_${RENDERER}/d_sprite.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_surf.o :   $(SRC_DIR)/r_${RENDERER}/d_surf.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_vars.o :   $(SRC_DIR)/r_${RENDERER}/d_vars.c
	$(DO_CC)

$(BUILDDIR)/486quake/d_zpoint.o : $(SRC_DIR)/r_${RENDERER}/d_zpoint.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_${RENDERER}/r_aclip.o :  $(SRC_DIR)/r_${RENDERER}/r_aclip.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_alias.o :  $(SRC_DIR)/r_${RENDERER}/r_alias.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_bsp.o :    $(SRC_DIR)/r_${RENDERER}/r_bsp.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_light.o :  $(SRC_DIR)/r_${RENDERER}/r_light.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_draw.o :   $(SRC_DIR)/r_${RENDERER}/r_draw.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_efrag.o :  $(SRC_DIR)/r_${RENDERER}/r_efrag.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_edge.o :   $(SRC_DIR)/r_${RENDERER}/r_edge.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_misc.o :   $(SRC_DIR)/r_${RENDERER}/r_misc.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_main.o :   $(SRC_DIR)/r_${RENDERER}/r_main.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_sky.o :    $(SRC_DIR)/r_${RENDERER}/r_sky.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_sprite.o : $(SRC_DIR)/r_${RENDERER}/r_sprite.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_surf.o :   $(SRC_DIR)/r_${RENDERER}/r_surf.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_part.o :   $(SRC_DIR)/r_${RENDERER}/r_part.c
	$(DO_CC)

$(BUILDDIR)/486quake/r_vars.o :   $(SRC_DIR)/r_${RENDERER}/r_vars.c
	$(DO_CC)

#####

$(BUILDDIR)/486quake/d_copy.o :   $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_copy.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_draw.o :   $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_draw.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_draw16.o : $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_draw16.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_parta.o :  $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_parta.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_polysa.o : $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_polysa.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_scana.o :  $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_scana.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_spr8.o :   $(SRC_DIR)/r_${RENDERER}/$(OCPU)/d_spr8.s
	$(DO_AS)

$(BUILDDIR)/486quake/d_varsa.o :  $(SRC_DIR)/r_${RENDERER}/d_varsa.s
	$(DO_AS)

$(BUILDDIR)/486quake/r_aliasa.o : $(SRC_DIR)/r_${RENDERER}/$(OCPU)/r_aliasa.s
	$(DO_AS)

$(BUILDDIR)/486quake/r_drawa.o :  $(SRC_DIR)/r_${RENDERER}/$(OCPU)/r_drawa.s
	$(DO_AS)

$(BUILDDIR)/486quake/r_edgea.o :  $(SRC_DIR)/r_${RENDERER}/$(OCPU)/r_edgea.s
	$(DO_AS)

$(BUILDDIR)/486quake/r_varsa.o :  $(SRC_DIR)/r_${RENDERER}/r_varsa.s
	$(DO_AS)

$(BUILDDIR)/486quake/surf16.o :   $(SRC_DIR)/r_${RENDERER}/$(OCPU)/surf16.s
	$(DO_AS)

$(BUILDDIR)/486quake/surf8.o :    $(SRC_DIR)/r_${RENDERER}/$(OCPU)/surf8.s
	$(DO_AS)

$(BUILDDIR)/486quake/r_aclipa.o : $(SRC_DIR)/r_${RENDERER}/$(OCPU)/r_aclipa.s
	$(DO_AS)

