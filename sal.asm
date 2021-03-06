; # SAL

; # SAR

; # Arithmetic shift

; # Signed shift

    ; Mnemonics: Shift Arithmetic Left and Right

    ; Application: signed multiply and divide by powers of 2.

    ; Keeps correct sign, and carries rest.

    ; Does not exist in C, for which signed shift is undetermined behavior.
    ; But does exist in Java via the `>>>` operator.

    ; C compilers do use it however.

%include "lib/asm_io.inc"

ENTRY
    mov eax, -1
    ; eax = -2, CF = 1
    sal eax, 1
    ASSERT_FLAG jc
    ASSERT_EQ -2

    ;ax < 0, CF = 0
    sar eax, 1
    ASSERT_EQ -1

    ; Cannot replace div for negative odd numbers directly
    ; as it rounds do -infinity, while div rounds to 0. TODO check.
    sar eax, 1
    ASSERT_EQ -1

    EXIT
