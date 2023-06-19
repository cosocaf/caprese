/**
 * @file main.h
 * @author cosocaf (cosocaf@gmail.com)
 * @brief Declare platform-independent kernel main.
 * @since 0.0.1
 * @version 0.0.1
 *
 * @copyright (c) 2023 cosocaf
 *
 * This project is released under the MIT License.
 * @see https://github.com/cosocaf/caprese/LICENSE
 */

#ifndef CAPRESE_KERNEL_MAIN_H_
#define CAPRESE_KERNEL_MAIN_H_

#include <cstdint>

namespace caprese {
  [[noreturn]] void main(uintptr_t hartid, const void* dtb);
} // namespace caprese

#endif // CAPRESE_KERNEL_MAIN_H_