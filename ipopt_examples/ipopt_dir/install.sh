# dependecy
sudo apt-get install gcc g++ gfortran git patch wget pkg-config liblapack-dev libmetis-dev libblas-dev 

# ASL
git clone https://github.com/coin-or-tools/ThirdParty-ASL.git
cd ThirdParty-ASL
sudo ./get.ASL
sudo ./configure
sudo make
sudo make install
cd ..

# HSL
git clone https://github.com/coin-or-tools/ThirdParty-HSL.git
cd ThirdParty-HSL
cp ../coinhsl.zip . && unzip coinhsl.zip
sudo ./configure
sudo make
sudo make install
cd ..

# MUMPS
git clone https://github.com/coin-or-tools/ThirdParty-Mumps.git
cd ThirdParty-Mumps
sudo ./get.Mumps
sudo ./configure
sudo make
sudo make install
cd ..

# ipopt
git clone https://github.com/coin-or/Ipopt.git
cd Ipopt
mkdir build
cd build
sudo ../configure
sudo make
sudo make test
sudo make install

cd /usr/local/include
sudo cp coin-or coin -r
sudo ln -s /usr/local/lib/libcoinmumps.so.3 /usr/lib/libcoinmumps.so.3
sudo ln -s /usr/local/lib/libcoinhsl.so.2 /usr/lib/libcoinhsl.so.2
sudo ln -s /usr/local/lib/libipopt.so.3 /usr/lib/libipopt.so.3

# cppad
sudo apt install cppad