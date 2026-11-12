# sunxi8ia33
## gameshell kit's cpu， Allwinner R16:
1. quad-core Cortex-a7
2. mail400mp2 gpu, support opengl es 2.0 / openvg 1.1
3. sdram 1GB
3. sd and emmc
4. a33 is r16, there is no difference between them
5. ...

# uboot
1. u-boot v2026.10
2. A33-OLinuXino_defconfig -> gameshell_sunxi8i_a16_defconfig
3. sun8i-a33-olinuxino.dts

# tool
1. toolchain 
- gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf(https://mirrors.tuna.tsinghua.edu.cn/armbian-releases/_toolchain/)
2. sunxi-tools
> FEL boot (USB OTG)
>> FEL is the name of the Allwinner defined USB boot protocol built in the
>> mask ROM of most Allwinner SoCs. It allows to bootstrap a board solely
>> by using the USB-OTG interface and a host port on another computer.
>> These tools include sunxi-bootinfo, sunx-fel, sunxi-fexc, sunxi-pio.
```bash
# use "sunxi-fel" to access the board, This should give you an output starting with: AWUSBFEX soc=00001667(A33)...
./sunxi-fel ver -v -p
# bootstrap U-Boot by just providing our venerable u-boot-sunxi-with-spl.bin
./sunxi-fel uboot u-boot-sunxi-with-spl.bin
```

# official
1. GameShell(https://github.com/clockworkpi/GameShell)

# backup
- backup files, such as boot and u-boot-sunxi-with-spl.bin, is published by official
- uboot/scripts/dtc/dtc -I dtb -O dts -o sun8i-r16-clockworkpi-cpi3.dts sun8i-r16-clockworkpi-cpi3.dtb

# output 
1. u-boot-sunxi-with-spl
> Transfer to an (micro)SD card (see below for more details)::
```bash
  $ sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sdX bs=8k seek=1
```
> Boot and enjoy!

> **note**::
  The traditional SD card location the Allwinner BootROM loads from is 8KB
  (sector 16). This works fine with the old MBR partitioning scheme, which most
  SD cards come formatted with. However this is in the middle of a potential
  GPT partition table, which will become invalid in this step. Newer SoCs
  (starting with the H3 from late 2014) also support booting from 128KB, which
  is beyond even a GPT and thus a safer location.