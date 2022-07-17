.macro proc name
    .global \name
    .type \name, @function
    \name:
.endm

.section .data

    INTEL_MANUFACTURER: .asciz "INTEL"
    UNKNOWN_MANUFACTURER: .asciz "UNKNOWN"

.section .text

    proc print_rabcdx
            push %rdx
            push %rcx
            push %rbx
            mov %rax, %rdi
            call print_rdi
            pop %rdi
            call print_rdi
            pop %rdi
            call print_rdi
            pop %rdi
            call print_rdi
            ret

    proc cpuid_support
            pushfq
            popq %rax
            mov %rax, %rbx
            mov $1, %rcx
            shl $21, %rcx
            or %rcx, %rax
            pushq %rax
            popfq
            pushfq
            popq %rax
            xor %rbx, %rax
            shr $21, %rax
            ret

    proc manufacturer
            xor %rax, %rax
            xor %rbx, %rbx
            cpuid
            cmp $0x756e6547, %ebx
            je INTEL
            mov $UNKNOWN_MANUFACTURER, %rax
            ret
        INTEL:
            mov $INTEL_MANUFACTURER, %rax
            ret

    proc cache_size_level_1
            mov $2, %rax
            cpuid
            call print_rabcdx
            ret



