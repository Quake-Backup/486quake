
486QUAKE_COBJS += \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_aclip.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_alias.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_bsp.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_light.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_draw.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_efrag.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_edge.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_misc.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_main.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_sky.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_sprite.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_surf.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_part.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/r_vars.o \
	\
	$(BUILDDIR)/486quake/r_$(RENDERER)/draw.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_edge.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_fill.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_init.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_modech.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_part.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_polyse.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_scan.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_sky.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_sprite.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_surf.o \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_zpoint.o \

    
ifneq "$(OASM)" "yes"
486QUAKE_COBJS += \
	$(BUILDDIR)/486quake/r_$(RENDERER)/d_vars.o
else
486QUAKE_OBJS += \
	$(BUILDDIR)/486quake/d_copy.o \
	$(BUILDDIR)/486quake/d_draw.o \
	$(BUILDDIR)/486quake/d_draw16.o \
	$(BUILDDIR)/486quake/d_parta.o \
	$(BUILDDIR)/486quake/d_polysa.o \
	$(BUILDDIR)/486quake/d_scana.o \
	$(BUILDDIR)/486quake/d_spr8.o \
	\
	$(BUILDDIR)/486quake/d_varsa.o \
	$(BUILDDIR)/486quake/r_aliasa.o \
	$(BUILDDIR)/486quake/r_drawa.o \
	$(BUILDDIR)/486quake/r_edgea.o \
	$(BUILDDIR)/486quake/r_varsa.o \
	$(BUILDDIR)/486quake/surf16.o \
	$(BUILDDIR)/486quake/surf8.o \
	$(BUILDDIR)/486quake/r_aclipa.o \

endif

