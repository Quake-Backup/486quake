/*
Copyright (C) 1996-1997 Id Software, Inc.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*/
// vid_null.c -- null video driver to aid porting efforts

#include "quakedef.h"
#include "d_local.h"

#include <libdragon.h>

extern viddef_t	vid;				// global video state
surface_t * current_surface = NULL;

#define	BASEWIDTH	320
#define	BASEHEIGHT	200

int		VGA_width = BASEWIDTH, VGA_height = BASEHEIGHT, VGA_rowbytes = BASEWIDTH, VGA_bufferrowbytes = BASEWIDTH;


byte	*vid_buffer;
short	zbuffer[BASEWIDTH*BASEHEIGHT];
byte	surfcache[256*1024];

unsigned short	d_8to16table[256];
unsigned int	d_8to24table[256];

void st2_fixup( unsigned char *buffer, int x, int y, int width, int height)
{
	int xi,yi;
	int count, n;
	unsigned char *src;
	unsigned short *dest;

	if( (x<0)||(y<0) )return;
	//Sys_Printf("st2_fixup() width %i height %i stride %i\n", width, height, current_surface->stride);

	for (yi = y; yi < (y+height); yi++) {
		src = &buffer[yi * current_surface->stride];
		dest = ((unsigned short *)src);

		// Duff's Device
		count = width;
		n = (count + 7) / 8;
		dest = (unsigned short*)&buffer[yi * current_surface->stride] + x + width - 1;
		src += x+width - 1;

		switch (count % 8) {
			case 0:	do {	*dest-- = d_8to16table[*src--];
			case 7:			*dest-- = d_8to16table[*src--];
			case 6:			*dest-- = d_8to16table[*src--];
			case 5:			*dest-- = d_8to16table[*src--];
			case 4:			*dest-- = d_8to16table[*src--];
			case 3:			*dest-- = d_8to16table[*src--];
			case 2:			*dest-- = d_8to16table[*src--];
			case 1:			*dest-- = d_8to16table[*src--];
			} while (--n > 0);
		}


		/*for(xi = (x+width-1); xi >= x; xi--) {
			dest[xi] = d_8to16table[src[xi]];
		}*/
	}
}

void st3_fixup( unsigned char *framebuf, int x, int y, int width, int height)
{
	int xi,yi;
	unsigned char *src;
	unsigned int *dest;
	int count, n;

	if( (x<0)||(y<0) )return;

	for (yi = y; yi < (y+height); yi++) {
		src = &framebuf[yi * current_surface->stride];
		dest = ((unsigned int *)src);

		// Duff's Device
		count = width;
		n = (count + 7) / 8;
		dest = ((unsigned int *)src) + x+width - 1;
		src += x+width - 1;

		switch (count % 8) {
			case 0:	do {	*dest-- = d_8to24table[*src--];
			case 7:			*dest-- = d_8to24table[*src--];
			case 6:			*dest-- = d_8to24table[*src--];
			case 5:			*dest-- = d_8to24table[*src--];
			case 4:			*dest-- = d_8to24table[*src--];
			case 3:			*dest-- = d_8to24table[*src--];
			case 2:			*dest-- = d_8to24table[*src--];
			case 1:			*dest-- = d_8to24table[*src--];
			} while (--n > 0);
		}

		/*
		for(xi = (x+width-1); xi >= x; xi--) {
			dest[xi] = d_8to24table[src[xi]];
		}*/
	}
}

void	VID_SetPalette (unsigned char *palette)
{
	int i;

	for(i=0;i<256;i++) {
		d_8to16table[i] = ((palette[i*3+0] >> 2) << 11) |
		((palette[i*3+1] >> 2) << 6) |
		((palette[i*3+2] >> 2) << 1) |
		1 ;
	}

	for(i=0;i<256;i++) {
		d_8to24table[i] = palette[i*3] << 16 +
							palette[i*3+1] << 8 +
							palette[i*3+2] << 0;
	}
}

void	VID_ShiftPalette (unsigned char *palette)
{
	VID_SetPalette (palette);
}

void	VID_Init (unsigned char *palette)
{
	resolution_t res = {320, 240, false};

	display_init(res, DEPTH_16_BPP, 2, GAMMA_CORRECT, FILTERS_RESAMPLE);
	current_surface = display_get();
	vid_buffer = current_surface->buffer;
	assert(current_surface->buffer != NULL);

	vid.maxwarpwidth = vid.width = vid.conwidth = BASEWIDTH;
	vid.maxwarpheight = vid.height = vid.conheight = BASEHEIGHT;
	vid.aspect = 1.0;
	vid.numpages = 1;
	vid.colormap = host_colormap;
	vid.fullbright = 256 - LittleLong (*((int *)vid.colormap + 2048));
	vid.buffer = vid.conbuffer = vid_buffer;
	vid.rowbytes = vid.conrowbytes = current_surface->stride;

	d_pzbuffer = zbuffer;
	D_InitCaches (surfcache, sizeof(surfcache));
	scr_fullupdate = 0;
}

void	VID_Shutdown (void)
{
}

void	VID_Update (vrect_t *rects)
{
		/*while (rects)
		{
			st2_fixup(vid_buffer, current_surface->buffer, rects->x, rects->y, rects->width, rects->height);
			rects = rects->pnext;
		}*/
		st2_fixup(vid_buffer, 0, 0, BASEWIDTH, BASEHEIGHT);
		display_show(current_surface);
		current_surface = display_get();
		assert(current_surface->buffer != NULL);
		vid.buffer = vid.conbuffer = vid_buffer = current_surface->buffer;
		scr_fullupdate = 0;
}
/*
================
D_BeginDirectRect
================
*/
void D_BeginDirectRect (int x, int y, byte *pbitmap, int width, int height)
{
}


/*
================
D_EndDirectRect
================
*/
void D_EndDirectRect (int x, int y, int width, int height)
{
}


