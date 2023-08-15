# Compile and run main.asm in passed directory

echo Give the path to the program directory!

read	path
echo 
cd $path

nasm -felf64 main.asm
ld main.o
./a.out

rm main.o
rm a.out

cd ..