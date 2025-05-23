/* SPDX-FileCopyrightText: 2019-2022 Blender Authors
 *
 * SPDX-License-Identifier: GPL-2.0-or-later */

#include "infos/overlay_paint_info.hh"

FRAGMENT_SHADER_CREATE_INFO(overlay_paint_texture)

#include "draw_colormanagement_lib.glsl"

void main()
{
  float4 mask = float4(texture_read_as_srgb(maskImage, maskImagePremultiplied, uv_interp).rgb,
                       1.0f);
  if (maskInvertStencil) {
    mask.rgb = 1.0f - mask.rgb;
  }
  float mask_step = smoothstep(0.0f, 3.0f, mask.r + mask.g + mask.b);
  mask.rgb *= maskColor;
  mask.a = mask_step * opacity;

  fragColor = mask;
}
