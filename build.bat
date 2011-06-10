:: setup
del board*.xe
del app*.xe
copy empty.xe boardA.xe
copy empty.xe boardB.xe
copy empty.xe appA.xe
copy empty.xe appB.xe

:: split real executable
xobjdump --split "Dual.xe"

:: create new executables
xobjdump boardA.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardA.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardA.xe -a 0,0,image_n0c0.elf
xobjdump boardA.xe -a 0,1,image_n0c1.elf
xobjdump boardA.xe -a 0,2,image_n0c2.elf
xobjdump boardA.xe -a 0,3,image_n0c3.elf
xobjdump boardB.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardB.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardB.xe -a 0,0,image_n1c0.elf
xobjdump boardB.xe -a 0,1,image_n1c1.elf
xobjdump boardB.xe -a 0,2,image_n1c2.elf
xobjdump boardB.xe -a 0,3,image_n1c3.elf
xobjdump appA.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appA.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appA.xe -a 0,image_n0c0_2.elf
xobjdump appA.xe -a 1,image_n0c1_2.elf
xobjdump appA.xe -a 2,image_n0c2_2.elf
xobjdump appA.xe -a 3,image_n0c3_2.elf
xobjdump appB.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appB.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appB.xe -a 0,image_n1c0_2.elf
xobjdump appB.xe -a 1,image_n1c1_2.elf
xobjdump appB.xe -a 2,image_n1c2_2.elf
xobjdump appB.xe -a 3,image_n1c3_2.elf

:: clean up
del program_info.txt
del platform_def.xn
del *.elf
del config.xml
