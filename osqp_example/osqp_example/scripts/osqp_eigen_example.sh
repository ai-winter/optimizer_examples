cd ../
if [ -e ./build/ ]; then
    cd ./build
else
    mkdir build && cd ./build
fi
cmake ..
make
./osqp_eigen_example