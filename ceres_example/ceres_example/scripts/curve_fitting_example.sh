cd ../
if [ -e ./build/ ]; then
    cd ./build
else
    mkdir build && cd ./build
fi
cmake ..
make
./bin/ceres_example_curve_fitting