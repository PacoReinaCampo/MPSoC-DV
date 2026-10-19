## Matrix CSR Access Instruction

| `Name`   | `Format`      | `Type` | `Extension` |
|----------|---------------|--------|-------------|
| `SETWLI` | `WSET_FORMAT` | `CSR`  | `RVW`       |
| `SETWL`  | `WSET_FORMAT` | `CSR`  | `RVW`       |

## Matrix Integer Arithmetic Instruction

| `Name`     | `Format`    | `Type`       | `Extension` | `Format-Extension`            |
|------------|-------------|--------------|-------------|-------------------------------|
| `WADD`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`                |
| `WSUB`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WRSUB`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WX, VI}`                    |
| `WWADDU`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, WV, WX}`            |
| `WWSUBU`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, WV, WX}`            |
| `WWADD`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, WV, WX}`            |
| `WWSUB`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, WV, WX}`            |
| `WADC`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WWM, WXM, VIM}`             |
| `WMADC`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WWM, WXM, VIM, WW, WX, VI}` |
| `WSBC`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WWM, WXM}`                  |
| `WMSBC`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WWM, WXM, WW, WX}`          |
| `WAND`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`                |
| `WOR`      | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`                |
| `WXOR`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`                |
| `WSLL`     | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WW, WX, VI}`                |
| `WSRL`     | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WW, WX, VI}`                |
| `WSRA`     | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WW, WX, VI}`                |
| `WNSRL`    | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WV, WX, WI}`                |
| `WNSRA`    | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WV, WX, WI}`                |
| `WMSEQ`    | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX, VI}`                |
| `WMSNE`    | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX, VI}`                |
| `WMSLTU`   | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX}`                    |
| `WMSLT`    | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX}`                    |
| `WMSLEU`   | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX, VI}`                |
| `WMSLE`    | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WW, WX, VI}`                |
| `WMSGTU`   | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WX, VI}`                    |
| `WMSGT`    | `WA_FORMAT` | `COMPARE`    | `RVW`       | `{WX, VI}`                    |
| `WMINU`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMIN`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMAXU`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMAX`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMUL`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMULH`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMULHU`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMULHSU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WDIVU`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WDIV`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WREMU`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WREM`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMUL`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMULU`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMULSU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMACC`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WNMSAC`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WMADD`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WNMSUB`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMACCU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMACC`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMACCSU` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WWMACCUS` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WX}    `                    |
| `WQMACCU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WQMACC`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WQMACCSU` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`                    |
| `WQMACCUS` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WX}    `                    |
| `WMERGE`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WWM, WXM, VIM}`             |
| `WMV`      | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`                |

## Matrix Fixed-Point Arithmetic Instructions

| `Name`    | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|-----------|-------------|--------------|-------------|--------------------|
| `WSADDU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`     |
| `WSADD`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX, VI}`     |
| `WSSUBU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WSSUB`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WAADDU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WAADD`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WASUBU`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WASUB`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW, WX}`         |
| `WSSRL`   | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WW, WX, VI}`     |
| `WSSRA`   | `WA_FORMAT` | `SHIFT`      | `RVW`       | `{WW, WX, VI}`     |
| `WNCLIPU` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WV, WX, WI}`     |
| `WNCLIP`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WV, WX, WI}`     |

## Matrix Floating-Point Arithmetic Instructions

| `Name`      | `Format`     | `Type`       | `Extension` | `Format-Extension` |
|-------------|--------------|--------------|-------------|--------------------|
| `WFADD`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFSUB`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFRSUB`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WF}`             |
| `WFMUL`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFDIV`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFRDIV`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WF}`             |
| `WFWMUL`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFMACC`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFNMACC`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFMSAC`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFNMSAC`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFMADD`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFNMADD`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFMSUB`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFNMSUB`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFWMACC`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFWNMACC`  | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFWMSAC`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFWNMSAC`  | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFSQRT_W`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       | `-`                |
| `WFMIN`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFMAX`     | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFSGNJ`    | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFSGNJN`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WFSGNJX`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WW, WF}`         |
| `WMFEQ`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WW, WF}`         |
| `WMFNE`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WW, WF}`         |
| `WMFLT`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WW, WF}`         |
| `WMFLE`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WW, WF}`         |
| `WMFGT`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WF}`             |
| `WMFGE`     | `WA_FORMAT`  | `COMPARE`    | `RVW`       | `{WF}`             |
| `WFCLASS_W` | `WS2_FORMAT` | `COMPARE`    | `RVW`       | `-`                |
| `WFMERGE`   | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WFM}`            |
| `WFMV`      | `WA_FORMAT`  | `ARITHMETIC` | `RVW`       | `{WF}`             |

## Matrix Conversion Instructions

| `Name`             | `Format`     | `Type`       | `Extension` |
|--------------------|--------------|--------------|-------------|
| `WFCVT_XU_F_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFCVT_X_F_W`      | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFCVT_F_XU_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFCVT_F_X_W`      | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWCVT_XU_F_W`    | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWCVT_X_F_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWCVT_F_XU_W`    | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWCVT_F_X_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWCVT_F_F_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_XU_F_W`    | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_X_F_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_F_XU_W`    | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_F_X_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_F_F_W`     | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFNCVT_ROD_F_F_W` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |

## Matrix Reduction Instruction

| `Name`          | `Format`    | `Type`       | `Extension` |
|-----------------|-------------|--------------|-------------|
| `WREDSUM_WS`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDMAXU_WS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDMAX_WS`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDMINU_WS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDMIN_WS`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDAND_WS`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDOR_WS`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WREDXOR_WS`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WWREDSUMU_WS`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WWREDSUM_WS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFREDOSUM_WS`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFREDSUM_WS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFREDMAX_WS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWREDOSUM_WS` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFWREDSUM_WS`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |

## Matrix Mask Instruction

| `Name`        | `Format`    | `Type`       | `Extension` |
|---------------|-------------|--------------|-------------|
| `WMAND_MM`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMNAND_MM`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMANDNOT_MM` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMXOR_MM`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMOR_MM`     | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMNOR_MM`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMORNOT_MM`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMXNOR_MM`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |

| `Name`     | `Format`     | `Type`       | `Extension` |
|------------|--------------|--------------|-------------|
| `WPOPC_M`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFIRST_M` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMSBF_M`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMSIF_M`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMSOF_M`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WIOTA_M`  | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WID_W`    | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |

## Matrix Permutation Instruction

| `Name`     | `Format`    | `Type`       | `Extension` |
|------------|-------------|--------------|-------------|
| `WMV_X_S`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMV_S_X`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFMV_F_S` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WFMV_S_F` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       |

| `Name`        | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|---------------|-------------|--------------|-------------|--------------------|
| `WSLIDEUP`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{VI,WX}`          |
| `WSLIDEDOWN`  | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{VI,WX}`          |
| `WSLIDE1UP`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WX}`             |
| `WSLIDE1DOWN` | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WX}`             |
| `WRGATHER`    | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{WW,WX,VI}`       |
| `WCOMPRESS`   | `WA_FORMAT` | `ARITHMETIC` | `RVW`       | `{VM}`             |

| `Name`    | `Format`     | `Type`       | `Extension` |
|-----------|--------------|--------------|-------------|
| `WMV1R_W` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMV2R_W` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMV4R_W` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |
| `WMV8R_W` | `WS2_FORMAT` | `ARITHMETIC` | `RVW`       |

## Matrix Unit-Stride Instructions

| `Name`  | `Format`    | `Type`  | `Extension` |
|---------|-------------|---------|-------------|
| `WLE_W` | `WL_FORMAT` | `LOAD`  | `RVW`       |
| `WSE_W` | `WS_FORMAT` | `STORE` | `RVW`       |

## Matrix Strided Instructions

| `Name`   | `Format`     | `Type`  | `Extension` |
|----------|--------------|---------|-------------|
| `WLSE_W` | `WLS_FORMAT` | `LOAD`  | `RVW`       |
| `WSSE_W` | `WSS_FORMAT` | `STORE` | `RVW`       |

## Matrix Indexed Instructions

| `Name`     | `Format`     | `Type`  | `Extension` |
|------------|--------------|---------|-------------|
| `WLXEI_W`  | `WLX_FORMAT` | `LOAD`  | `RVW`       |
| `WSXEI_W`  | `WSX_FORMAT` | `STORE` | `RVW`       |
| `WSUXEI_W` | `WSX_FORMAT` | `STORE` | `RVW`       |

## Matrix Unit-Stride Fault-Only-First Loads

| `Name`    | `Format`    | `Type` | `Extension` |
|-----------|-------------|--------|-------------|
| `WLEFF_W` | `WL_FORMAT` | `LOAD` | `RVW`       |

## Matrix Unit Strided Segment Loads and Stores

| `Name`       | `Format`    | `Type`  | `Extension` | `Format-Extension` |
|--------------|-------------|---------|-------------|--------------------|
| `WLSEGE_W`   | `WL_FORMAT` | `LOAD`  | `RVW`       | `"zwlsseg"`        |
| `WSSEGE_W`   | `WS_FORMAT` | `STORE` | `RVW`       | `"zwlsseg"`        |
| `WLSEGEFF_W` | `WL_FORMAT` | `LOAD`  | `RVW`       | `"zwlsseg"`        |

## Matrix Strided Segment Loads and Stores

| `Name`      | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|-------------|--------------|---------|-------------|--------------------|
| `WLSSEGE_W` | `WLS_FORMAT` | `LOAD`  | `RVW`       | `"zwlsseg"`        |
| `WSSSEGE_W` | `WSS_FORMAT` | `STORE` | `RVW`       | `"zwlsseg"`        |

## Matrix Indexed Segment Loads and Stores

| `Name`        | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|---------------|--------------|---------|-------------|--------------------|
| `WLXSEGEI_W`  | `WLX_FORMAT` | `LOAD`  | `RVW`       | `"zwlsseg"`        |
| `WSXSEGEI_W`  | `WSX_FORMAT` | `STORE` | `RVW`       | `"zwlsseg"`        |
| `WSUXSEGEI_W` | `WSX_FORMAT` | `STORE` | `RVW`       | `"zwlsseg"`        |

## EEW Matrix AMOs

| `Name`        | `Format`      | `Type` | `Extension` | `Format-Extension` |
|---------------|---------------|--------|-------------|--------------------|
| `WAMOSWAPE_W` | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOADDE_W`  | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOXORE_W`  | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOANDE_W`  | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOORE_W`   | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOMINE_W`  | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOMAXE_W`  | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOMINUE_W` | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
| `WAMOMAXUE_W` | `WAMO_FORMAT` | `AMO`  | `RVW`       | `"zwamo"`          |
