/**
 * @file switch.S
 * @author cosocaf (cosocaf@gmail.com)
 * @brief
 * @since 0.0.1
 * @version 0.0.1
 *
 * @copyright (c) 2023 cosocaf
 *
 * This project is released under the MIT License.
 * @see https://github.com/cosocaf/caprese/blob/master/LICENSE
 */

.section .text

.global switch_context
.type switch_context, @function
# void switch_context(const caprese::arch::task::task_context* old_context, const caprese::arch::task::task_context* new_context)
switch_context:
  sd ra, 0(a0)
  sd sp, 8(a0)
  sd s0, 16(a0)
  sd s1, 24(a0)
  sd s2, 32(a0)
  sd s3, 40(a0)
  sd s4, 48(a0)
  sd s5, 56(a0)
  sd s6, 64(a0)
  sd s7, 72(a0)
  sd s8, 80(a0)
  sd s9, 88(a0)
  sd s10, 96(a0)
  sd s11, 104(a0)

  ld ra, 0(a1)
  ld sp, 8(a1)
  ld s0, 16(a1)
  ld s1, 24(a1)
  ld s2, 32(a1)
  ld s3, 40(a1)
  ld s4, 48(a1)
  ld s5, 56(a1)
  ld s6, 64(a1)
  ld s7, 72(a1)
  ld s8, 80(a1)
  ld s9, 88(a1)
  ld s10, 96(a1)
  ld s11, 104(a1)

  ret
