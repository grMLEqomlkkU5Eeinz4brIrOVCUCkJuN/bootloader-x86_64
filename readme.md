compile
```
nasm -f bin bootloader.asm -o bootloader.img
```

its in my recommendation that you use qemu

```
qemu-system-x86_64 -drive format=raw,file=bootloader.img
```