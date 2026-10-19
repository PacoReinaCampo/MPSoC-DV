## Tensor CSR Access Instruction

| `Name`   | `Format`      | `Type` | `Extension` |
|----------|---------------|--------|-------------|
| `SETYLI` | `YSET_FORMAT` | `CSR`  | `RVY`       |
| `SETYL`  | `YSET_FORMAT` | `CSR`  | `RVY`       |

## Tensor Integer Arithmetic Instruction

| `Name`     | `Format`    | `Type`       | `Extension` | `Format-Extension`            |
|------------|-------------|--------------|-------------|-------------------------------|
| `YADD`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`                |
| `YSUB`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YRSUB`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YX, YI}`                    |
| `YWADDU`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, WV, WX}`            |
| `YWSUBU`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, WV, WX}`            |
| `YWADD`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, WV, WX}`            |
| `YWSUB`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, WV, WX}`            |
| `YADC`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YYM, YXM, YIM}`             |
| `YMADC`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YYM, YXM, YIM, YY, YX, YI}` |
| `YSBC`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YYM, YXM}`                  |
| `YMSBC`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YYM, YXM, YY, YX}`          |
| `YAND`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`                |
| `YOR`      | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`                |
| `YXOR`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`                |
| `YSLL`     | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{YY, YX, YI}`                |
| `YSRL`     | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{YY, YX, YI}`                |
| `YSRA`     | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{YY, YX, YI}`                |
| `YNSRL`    | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{WV, WX, WI}`                |
| `YNSRA`    | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{WV, WX, WI}`                |
| `YMSEQ`    | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX, YI}`                |
| `YMSNE`    | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX, YI}`                |
| `YMSLTU`   | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX}`                    |
| `YMSLT`    | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX}`                    |
| `YMSLEU`   | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX, YI}`                |
| `YMSLE`    | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YY, YX, YI}`                |
| `YMSGTU`   | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YX, YI}`                    |
| `YMSGT`    | `YA_FORMAT` | `COMPARE`    | `RVY`       | `{YX, YI}`                    |
| `YMINU`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMIN`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMAXU`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMAX`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMUL`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMULH`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMULHU`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMULHSU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YDIVU`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YDIV`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YREMU`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YREM`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMUL`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMULU`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMULSU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMACC`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YNMSAC`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YMADD`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YNMSUB`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMACCU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMACC`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMACCSU` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YWMACCUS` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YX}`                        |
| `YQMACCU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YQMACC`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YQMACCSU` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`                    |
| `YQMACCUS` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YX}`                        |
| `YMERGE`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YYM, YXM, YIM}`             |
| `YMV`      | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`                |

## Tensor Fixed-Point Arithmetic Instructions

| `Name`    | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|-----------|-------------|--------------|-------------|--------------------|
| `YSADDU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`     |
| `YSADD`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX, YI}`     |
| `YSSUBU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YSSUB`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YAADDU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YAADD`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YASUBU`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YASUB`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY, YX}`         |
| `YSSRL`   | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{YY, YX, YI}`     |
| `YSSRA`   | `YA_FORMAT` | `SHIFT`      | `RVY`       | `{YY, YX, YI}`     |
| `YNCLIPU` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{WV, WX, WI}`     |
| `YNCLIP`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{WV, WX, WI}`     |

## Tensor Floating-Point Arithmetic Instructions

| `Name`      | `Format`     | `Type`       | `Extension` | `Format-Extension` |
|-------------|--------------|--------------|-------------|--------------------|
| `YFADD`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFSUB`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFRSUB`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{VF}`             |
| `YFMUL`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFDIV`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFRDIV`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{VF}`             |
| `YFWMUL`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFMACC`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFNMACC`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFMSAC`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFNMSAC`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFMADD`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFNMADD`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFMSUB`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFNMSUB`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFWMACC`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFWNMACC`  | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFWMSAC`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFWNMSAC`  | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFSQRT_Y`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       | `-`                |
| `YFMIN`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFMAX`     | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFSGNJ`    | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFSGNJN`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YFSGNJX`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{YY, VF}`         |
| `YMFEQ`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{YY, VF}`         |
| `YMFNE`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{YY, VF}`         |
| `YMFLT`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{YY, VF}`         |
| `YMFLE`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{YY, VF}`         |
| `YMFGT`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{VF}`             |
| `YMFGE`     | `YA_FORMAT`  | `COMPARE`    | `RVY`       | `{VF}`             |
| `YFCLASS_Y` | `YS2_FORMAT` | `COMPARE`    | `RVY`       | `-`                |
| `YFMERGE`   | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{VFM}`            |
| `YFMV`      | `YA_FORMAT`  | `ARITHMETIC` | `RVY`       | `{VF}`             |

## Tensor Conversion Instructions

| `Name`             | `Format`     | `Type`       | `Extension` |
|--------------------|--------------|--------------|-------------|
| `YFCVT_XU_F_Y`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFCVT_X_F_Y`      | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFCVT_F_XU_Y`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFCVT_F_X_Y`      | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWCVT_XU_F_Y`    | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWCVT_X_F_Y`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWCVT_F_XU_Y`    | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWCVT_F_X_Y`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWCVT_F_F_Y`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_XU_F_W`    | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_X_F_W`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_F_XU_W`    | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_F_X_W`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_F_F_W`     | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFNCVT_ROD_F_F_W` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |

## Tensor Reduction Instruction

| `Name`          | `Format`    | `Type`       | `Extension` |
|-----------------|-------------|--------------|-------------|
| `YREDSUM_YS`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDMAXU_YS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDMAX_YS`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDMINU_YS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDMIN_YS`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDAND_YS`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDOR_YS`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YREDXOR_YS`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YWREDSUMU_YS`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YWREDSUM_YS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFREDOSUM_YS`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFREDSUM_YS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFREDMAX_YS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWREDOSUM_YS` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFWREDSUM_YS`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |

## Tensor Mask Instruction

| `Name`        | `Format`    | `Type`       | `Extension` |
|---------------|-------------|--------------|-------------|
| `YMAND_MM`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMNAND_MM`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMANDNOT_MM` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMXOR_MM`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMOR_MM`     | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMNOR_MM`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMORNOT_MM`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMXNOR_MM`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |

| `Name`     | `Format`     | `Type`       | `Extension` |
|------------|--------------|--------------|-------------|
| `YPOPC_M`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFIRST_M` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMSBF_M`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMSIF_M`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMSOF_M`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YIOTA_M`  | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YID_Y`    | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |

## Tensor Permutation Instruction

| `Name`     | `Format`    | `Type`       | `Extension` |
|------------|-------------|--------------|-------------|
| `YMV_X_S`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMV_S_X`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFMV_F_S` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YFMV_S_F` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       |

| `Name`        | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|---------------|-------------|--------------|-------------|--------------------|
| `YSLIDEUP`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YI,YX}`          |
| `YSLIDEDOWN`  | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YI,YX}`          |
| `YSLIDE1UP`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YX}`             |
| `YSLIDE1DOWN` | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YX}`             |
| `YRGATHER`    | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{YY,YX,YI}`       |
| `YCOMPRESS`   | `YA_FORMAT` | `ARITHMETIC` | `RVY`       | `{VM}`             |

| `Name`    | `Format`     | `Type`       | `Extension` |
|-----------|--------------|--------------|-------------|
| `YMV1R_Y` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMV2R_Y` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMV4R_Y` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |
| `YMV8R_Y` | `YS2_FORMAT` | `ARITHMETIC` | `RVY`       |

## Tensor Unit-Stride Instructions

| `Name`  | `Format`    | `Type`  | `Extension` |
|---------|-------------|---------|-------------|
| `YLE_Y` | `YL_FORMAT` | `LOAD`  | `RVY`       |
| `YSE_Y` | `YS_FORMAT` | `STORE` | `RVY`       |

## Tensor Strided Instructions

| `Name`   | `Format`     | `Type`  | `Extension` |
|----------|--------------|---------|-------------|
| `YLSE_Y` | `YLS_FORMAT` | `LOAD`  | `RVY`       |
| `YSSE_Y` | `YSS_FORMAT` | `STORE` | `RVY`       |

## Tensor Indexed Instructions

| `Name`     | `Format`     | `Type`  | `Extension` |
|------------|--------------|---------|-------------|
| `YLXEI_Y`  | `YLX_FORMAT` | `LOAD`  | `RVY`       |
| `YSXEI_Y`  | `YSX_FORMAT` | `STORE` | `RVY`       |
| `YSUXEI_Y` | `YSX_FORMAT` | `STORE` | `RVY`       |

## Tensor Unit-Stride Fault-Only-First Loads

| `Name`    | `Format`    | `Type` | `Extension` |
|-----------|-------------|--------|-------------|
| `YLEFF_Y` | `YL_FORMAT` | `LOAD` | `RVY`       |

## Tensor Unit Strided Segment Loads and Stores

| `Name`       | `Format`    | `Type`  | `Extension` | `Format-Extension` |
|--------------|-------------|---------|-------------|--------------------|
| `YLSEGE_Y`   | `YL_FORMAT` | `LOAD`  | `RVY`       | `"zylsseg"`        |
| `YSSEGE_Y`   | `YS_FORMAT` | `STORE` | `RVY`       | `"zylsseg"`        |
| `YLSEGEFF_Y` | `YL_FORMAT` | `LOAD`  | `RVY`       | `"zylsseg"`        |

## Tensor Strided Segment Loads and Stores

| `Name`      | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|-------------|--------------|---------|-------------|--------------------|
| `YLSSEGE_Y` | `YLS_FORMAT` | `LOAD`  | `RVY`       | `"zylsseg"`        |
| `YSSSEGE_Y` | `YSS_FORMAT` | `STORE` | `RVY`       | `"zylsseg"`        |

## Tensor Indexed Segment Loads and Stores

| `Name`        | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|---------------|--------------|---------|-------------|--------------------|
| `YLXSEGEI_Y`  | `YLX_FORMAT` | `LOAD`  | `RVY`       | `"zylsseg"`        |
| `YSXSEGEI_Y`  | `YSX_FORMAT` | `STORE` | `RVY`       | `"zylsseg"`        |
| `YSUXSEGEI_Y` | `YSX_FORMAT` | `STORE` | `RVY`       | `"zylsseg"`        |

## EEW Tensor AMOs

| `Name`        | `Format`      | `Type` | `Extension` | `Format-Extension` |
|---------------|---------------|--------|-------------|--------------------|
| `YAMOSWAPE_Y` | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOADDE_Y`  | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOXORE_Y`  | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOANDE_Y`  | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOORE_Y`   | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOMINE_Y`  | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOMAXE_Y`  | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOMINUE_Y` | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
| `YAMOMAXUE_Y` | `YAMO_FORMAT` | `AMO`  | `RVY`       | `"zyamo"`          |
