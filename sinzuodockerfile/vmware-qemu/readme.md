mage.img的原始图像文件转换为qcow2文件。 
$ qemu-img convert -f raw -O qcow2 image.img image.qcow2 
将vmdk文件转换raw文件。 $ qemu-img convert -f vmdk -O raw image.vmdk image.img 
将vmdk文件转换qcow2文件。 $ qemu-img convert -f vmdk -O qcow2 image.vmdk image.qcow2



qemu-img convert -f raw -O vmdk ubuntu17.04-2019.06.11.img ubuntu17.04-2019.06.11.vmdk

--------------------- 

