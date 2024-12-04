
For ImageMagick do the next things:
    -install dependencies executing: 
        "sudo apt install libx11-dev libxext-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev"
    -decompress the file ImageMagick-7.1.1-41.tar.gz
    -get inside the new folder
    -execute "./configure"
    -execute "make -j4"
    -execute "sudo make install"
    -execute "sudo ldconfig /usr/local/lib"

To install the needed fonts to make icons appear:
    -download the tar executing: 
        "curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
    -execute "tar -xvf JetBrainsMono.tar.xz"
