git clone -b release-0.6.3 --recursive https://github.com/oxfordcontrol/osqp
cd osqp && mkdir build && cd build
cmake .. -DBUILD_SHARED_LIBS=ON
make -j6
sudo make install

cd ../../
git clone https://github.com/robotology/osqp-eigen.git
cd osqp-eigen && mkdir build && cd build
cmake ..
make
sudo make install