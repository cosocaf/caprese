/**
 * @file entry.S
 * @author cosocaf (cosocaf@gmail.com)
 * @brief asm entry point
 * @since 0.0.1
 * @version 0.0.1
 *
 * @copyright (c) 2023 cosocaf
 *
 * This project is released under the MIT License.
 * @see https://github.com/cosocaf/caprese/blob/master/LICENSE
 */

.extern __global_pointer$
.type __global_pointer$, @object
.extern start
.type start, @function

.section .text
.global _start
.type _start, @function
_start:
  # Without norelax option, "auipc gp, %pcrel_hi(__global_pointer$)" is optimized to "auipc gp, gp".
  .option push
  .option norelax
    1:
      auipc gp, %pcrel_hi(__global_pointer$)
      addi  gp, gp, %pcrel_lo(1b)
  .option pop

  la sp, stack
  # OpenSBI stores hartid in a0 and pointer to dtb in a1.
  la t0, start
  jr t0

spin:
  wfi
  j spin

.section .data
.balign 16
.space 4096
stack:

.section .kernel,"a",@progbits
.balign 16
.global _kernel_start
.type _kernel_start, @object
.global _kernel_end
.type _kernel_end, @object
_kernel_start:
.incbin CONFIG_KERNEL_BIN
_kernel_end:
.balign 16
