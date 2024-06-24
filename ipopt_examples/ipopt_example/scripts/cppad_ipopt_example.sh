cd ../
if [ -e ./build/ ]; then
    cd ./build
else
    mkdir build && cd ./build
fi
cmake ..
make
./cppad_ipopt_example