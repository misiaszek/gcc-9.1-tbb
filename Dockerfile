#
# Dockerfile for gcc-9.1 + tbb for parallelstl functionality
#
# Code for installing TBB & test.cc script taken from: https://solarianprogrammer.com/2019/05/09/cpp-17-stl-parallel-algorithms-gcc-intel-tbb-linux-macos/#comment-4456374640

FROM gcc:9.1
WORKDIR /

RUN wget https://github.com/intel/tbb/archive/2019_U6.tar.gz
RUN tar zxvf 2019_U6.tar.gz
RUN rm 2019_U6.tar.gz

WORKDIR /tbb-2019_U6
RUN make compiler=gcc stdver=c++17

RUN mkdir /usr/local/tbb-2019_U6
RUN cp -r include /usr/local/tbb-2019_U6/include
RUN ln -s /usr/local/tbb-2019_U6/include/tbb /usr/local/include/tbb

RUN cp -r build/*_release /usr/local/tbb-2019_U6/lib
RUN ln -s /usr/local/tbb-2019_U6/lib/libtbb.so.2 /usr/local/lib/libtbb.so
RUN ln -s /usr/local/tbb-2019_U6/lib/libtbbmalloc.so.2 /usr/local/lib/libtbbmalloc.so
RUN ln -s /usr/local/tbb-2019_U6/lib/libtbbmalloc_proxy.so.2 /usr/local/lib/libtbbmalloc_proxy.so
RUN echo 'export LD_LIBRARY_PATH=/usr/local/tbb-2019_U6/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
RUN . ~/.bashrc

RUN mkdir /gcc9-tests

WORKDIR /gcc9-tests
COPY test.cc .

RUN apt-get update && apt-get install -y \
    vim \
    nano
