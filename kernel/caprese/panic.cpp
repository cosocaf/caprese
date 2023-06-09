/**
 * @file panic.cpp
 * @author cosocaf (cosocaf@gmail.com)
 * @brief Implement a function to safely stop the kernel in the event of a fatal condition.
 * @since 0.0.1
 * @version 0.0.1
 *
 * @copyright (c) 2023 cosocaf
 *
 * This project is released under the MIT License.
 * @see https://github.com/cosocaf/caprese/blob/master/LICENSE
 */

#include <cstdarg>
#include <cstdio>

#include <caprese/panic.h>

#ifdef CONFIG_ARCH_RISCV
#include <caprese/arch/rv64/panic.h>
#endif

namespace caprese {
  [[noreturn]] void panic(const char* fmt, ...) {
    printf("KERNEL PANIC: ");

    va_list arg;
    va_start(arg, fmt);
    vprintf(fmt, arg);
    va_end(arg);

    printf("\n");

    arch::dump_context();
    arch::halt();
  }
} // namespace caprese
