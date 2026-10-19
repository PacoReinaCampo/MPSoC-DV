## Vector CSR Access Instruction

| `Name`   | `Format`      | `Type` | `Extension` |
|----------|---------------|--------|-------------|
| `SETVLI` | `VSET_FORMAT` | `CSR`  | `RVV`       |
| `SETVL`  | `VSET_FORMAT` | `CSR`  | `RVV`       |

## Vector Integer Arithmetic Instruction

| `Name`     | `Format`    | `Type`       | `Extension` | `Format-Extension`            |
|------------|-------------|--------------|-------------|-------------------------------|
| `VADD`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`                |
| `VSUB`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VRSUB`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VX, VI}`                    |
| `VWADDU`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, WV, WX}`            |
| `VWSUBU`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, WV, WX}`            |
| `VWADD`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, WV, WX}`            |
| `VWSUB`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, WV, WX}`            |
| `VADC`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VVM, VXM, VIM}`             |
| `VMADC`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VVM, VXM, VIM, VV, VX, VI}` |
| `VSBC`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VVM, VXM}`                  |
| `VMSBC`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VVM, VXM, VV, VX}`          |
| `VAND`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`                |
| `VOR`      | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`                |
| `VXOR`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`                |
| `VSLL`     | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{VV, VX, VI}`                |
| `VSRL`     | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{VV, VX, VI}`                |
| `VSRA`     | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{VV, VX, VI}`                |
| `VNSRL`    | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{WV, WX, WI}`                |
| `VNSRA`    | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{WV, WX, WI}`                |
| `VMSEQ`    | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX, VI}`                |
| `VMSNE`    | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX, VI}`                |
| `VMSLTU`   | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX}`                    |
| `VMSLT`    | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX}`                    |
| `VMSLEU`   | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX, VI}`                |
| `VMSLE`    | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VV, VX, VI}`                |
| `VMSGTU`   | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VX, VI}`                    |
| `VMSGT`    | `VA_FORMAT` | `COMPARE`    | `RVV`       | `{VX, VI}`                    |
| `VMINU`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMIN`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMAXU`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMAX`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMUL`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMULH`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMULHU`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMULHSU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VDIVU`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VDIV`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VREMU`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VREM`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMUL`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMULU`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMULSU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMACC`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VNMSAC`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VMADD`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VNMSUB`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMACCU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMACC`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMACCSU` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VWMACCUS` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VX}`                        |
| `VQMACCU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VQMACC`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VQMACCSU` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`                    |
| `VQMACCUS` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VX}`                        |
| `VMERGE`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VVM, VXM, VIM}`             |
| `VMV`      | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`                |

## Vector Fixed-Point Arithmetic Instructions

| `Name`    | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|-----------|-------------|--------------|-------------|--------------------|
| `VSADDU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`     |
| `VSADD`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX, VI}`     |
| `VSSUBU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VSSUB`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VAADDU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VAADD`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VASUBU`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VASUB`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV, VX}`         |
| `VSSRL`   | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{VV, VX, VI}`     |
| `VSSRA`   | `VA_FORMAT` | `SHIFT`      | `RVV`       | `{VV, VX, VI}`     |
| `VNCLIPU` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{WV, WX, WI}`     |
| `VNCLIP`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{WV, WX, WI}`     |

## Vector Floating-Point Arithmetic Instructions

| `Name`      | `Format`     | `Type`       | `Extension` | `Format-Extension` |
|-------------|--------------|--------------|-------------|--------------------|
| `VFADD`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFSUB`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFRSUB`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VF}`             |
| `VFMUL`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFDIV`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFRDIV`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VF}`             |
| `VFWMUL`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFMACC`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFNMACC`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFMSAC`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFNMSAC`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFMADD`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFNMADD`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFMSUB`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFNMSUB`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFWMACC`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFWNMACC`  | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFWMSAC`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFWNMSAC`  | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFSQRT_V`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       | `-`                |
| `VFMIN`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFMAX`     | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFSGNJ`    | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFSGNJN`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VFSGNJX`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VV, VF}`         |
| `VMFEQ`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VV, VF}`         |
| `VMFNE`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VV, VF}`         |
| `VMFLT`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VV, VF}`         |
| `VMFLE`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VV, VF}`         |
| `VMFGT`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VF}`             |
| `VMFGE`     | `VA_FORMAT`  | `COMPARE`    | `RVV`       | `{VF}`             |
| `VFCLASS_V` | `VS2_FORMAT` | `COMPARE`    | `RVV`       | `-`                |
| `VFMERGE`   | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VFM}`            |
| `VFMV`      | `VA_FORMAT`  | `ARITHMETIC` | `RVV`       | `{VF}`             |

## Vector Conversion Instructions

| `Name`             | `Format`     | `Type`       | `Extension` |
|--------------------|--------------|--------------|-------------|
| `VFCVT_XU_F_V`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFCVT_X_F_V`      | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFCVT_F_XU_V`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFCVT_F_X_V`      | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWCVT_XU_F_V`    | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWCVT_X_F_V`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWCVT_F_XU_V`    | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWCVT_F_X_V`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWCVT_F_F_V`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_XU_F_W`    | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_X_F_W`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_F_XU_W`    | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_F_X_W`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_F_F_W`     | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFNCVT_ROD_F_F_W` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |

## Vector Reduction Instruction

| `Name`          | `Format`    | `Type`       | `Extension` |
|-----------------|-------------|--------------|-------------|
| `VREDSUM_VS`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDMAXU_VS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDMAX_VS`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDMINU_VS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDMIN_VS`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDAND_VS`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDOR_VS`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VREDXOR_VS`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VWREDSUMU_VS`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VWREDSUM_VS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFREDOSUM_VS`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFREDSUM_VS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFREDMAX_VS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWREDOSUM_VS` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFWREDSUM_VS`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |

## Vector Mask Instruction

| `Name`        | `Format`    | `Type`       | `Extension` |
|---------------|-------------|--------------|-------------|
| `VMAND_MM`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMNAND_MM`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMANDNOT_MM` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMXOR_MM`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMOR_MM`     | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMNOR_MM`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMORNOT_MM`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMXNOR_MM`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |

| `Name`     | `Format`     | `Type`       | `Extension` |
|------------|--------------|--------------|-------------|
| `VPOPC_M`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFIRST_M` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMSBF_M`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMSIF_M`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMSOF_M`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VIOTA_M`  | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VID_V`    | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |

## Vector Permutation Instruction

| `Name`     | `Format`    | `Type`       | `Extension` |
|------------|-------------|--------------|-------------|
| `VMV_X_S`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMV_S_X`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFMV_F_S` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VFMV_S_F` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       |

| `Name`        | `Format`    | `Type`       | `Extension` | `Format-Extension` |
|---------------|-------------|--------------|-------------|--------------------|
| `VSLIDEUP`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VI,VX}`          |
| `VSLIDEDOWN`  | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VI,VX}`          |
| `VSLIDE1UP`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VX}`             |
| `VSLIDE1DOWN` | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VX}`             |
| `VRGATHER`    | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VV,VX,VI}`       |
| `VCOMPRESS`   | `VA_FORMAT` | `ARITHMETIC` | `RVV`       | `{VM}`             |

| `Name`    | `Format`     | `Type`       | `Extension` |
|-----------|--------------|--------------|-------------|
| `VMV1R_V` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMV2R_V` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMV4R_V` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |
| `VMV8R_V` | `VS2_FORMAT` | `ARITHMETIC` | `RVV`       |

## Vector Unit-Stride Instructions

| `Name`  | `Format`    | `Type`  | `Extension` |
|---------|-------------|---------|-------------|
| `VLE_V` | `VL_FORMAT` | `LOAD`  | `RVV`       |
| `VSE_V` | `VS_FORMAT` | `STORE` | `RVV`       |

## Vector Strided Instructions

| `Name`   | `Format`     | `Type`  | `Extension` |
|----------|--------------|---------|-------------|
| `VLSE_V` | `VLS_FORMAT` | `LOAD`  | `RVV`       |
| `VSSE_V` | `VSS_FORMAT` | `STORE` | `RVV`       |

## Vector Indexed Instructions

| `Name`     | `Format`     | `Type`  | `Extension` |
|------------|--------------|---------|-------------|
| `VLXEI_V`  | `VLX_FORMAT` | `LOAD`  | `RVV`       |
| `VSXEI_V`  | `VSX_FORMAT` | `STORE` | `RVV`       |
| `VSUXEI_V` | `VSX_FORMAT` | `STORE` | `RVV`       |

## Vector Unit-Stride Fault-Only-First Loads

| `Name`    | `Format`    | `Type` | `Extension` |
|-----------|-------------|--------|-------------|
| `VLEFF_V` | `VL_FORMAT` | `LOAD` | `RVV`       |

## Vector Unit Strided Segment Loads and Stores

| `Name`       | `Format`    | `Type`  | `Extension` | `Format-Extension` |
|--------------|-------------|---------|-------------|--------------------|
| `VLSEGE_V`   | `VL_FORMAT` | `LOAD`  | `RVV`       | `"zvlsseg"`        |
| `VSSEGE_V`   | `VS_FORMAT` | `STORE` | `RVV`       | `"zvlsseg"`        |
| `VLSEGEFF_V` | `VL_FORMAT` | `LOAD`  | `RVV`       | `"zvlsseg"`        |

## Vector Strided Segment Loads and Stores

| `Name`      | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|-------------|--------------|---------|-------------|--------------------|
| `VLSSEGE_V` | `VLS_FORMAT` | `LOAD`  | `RVV`       | `"zvlsseg"`        |
| `VSSSEGE_V` | `VSS_FORMAT` | `STORE` | `RVV`       | `"zvlsseg"`        |

## Vector Indexed Segment Loads and Stores

| `Name`        | `Format`     | `Type`  | `Extension` | `Format-Extension` |
|---------------|--------------|---------|-------------|--------------------|
| `VLXSEGEI_V`  | `VLX_FORMAT` | `LOAD`  | `RVV`       | `"zvlsseg"`        |
| `VSXSEGEI_V`  | `VSX_FORMAT` | `STORE` | `RVV`       | `"zvlsseg"`        |
| `VSUXSEGEI_V` | `VSX_FORMAT` | `STORE` | `RVV`       | `"zvlsseg"`        |

## EEW Vector AMOs

| `Name`        | `Format`      | `Type` | `Extension` | `Format-Extension` |
|---------------|---------------|--------|-------------|--------------------|
| `VAMOSWAPE_V` | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOADDE_V`  | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOXORE_V`  | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOANDE_V`  | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOORE_V`   | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOMINE_V`  | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOMAXE_V`  | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOMINUE_V` | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
| `VAMOMAXUE_V` | `VAMO_FORMAT` | `AMO`  | `RVV`       | `"zvamo"`          |
