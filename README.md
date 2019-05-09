# gcc-9.1-tbb
g++ 9.1 with Intel Threading Building Blocks for parallelstl algorithms tests

Code for installing TBB & test.cc script taken from:
https://solarianprogrammer.com/2019/05/09/cpp-17-stl-parallel-algorithms-gcc-intel-tbb-linux-macos

**Build & run docker container:**

docker build -t gcc9.1-tbb .  
docker run -it gcc9.1-tbb  

**Running test script for parallelstl sorting with optimization**  
  
gcc9-tests# g++ test.cc -std=c++17 -ltbb -o test-sort  
gcc9-tests# g++ test.cc -std=c++17 -ltbb -O2 -o test-sort-optimized  
  
gcc9-tests# ./test-sort  
  
std::execution::seq  
Elapsed time 2011.09 ms  
Elapsed time 2005.34 ms  
Elapsed time 2012.46 ms  
Elapsed time 2011.79 ms  
Elapsed time 2005.15 ms  
Elapsed time 2009.36 ms  
Elapsed time 2008.04 ms  
Elapsed time 2005.99 ms  
Elapsed time 2005.16 ms  
Elapsed time 2010.88 ms  
  
std::execution::par  
Elapsed time 430.73 ms  
Elapsed time 429.409 ms  
Elapsed time 431.269 ms  
Elapsed time 427.208 ms  
Elapsed time 427.858 ms  
Elapsed time 426.649 ms  
Elapsed time 426.786 ms  
Elapsed time 427.139 ms  
Elapsed time 427.349 ms  
Elapsed time 427.443 ms  
  
gcc9-tests# ./test-sort-optimized  
  
std::execution::seq  
Elapsed time 338.831 ms  
Elapsed time 342.524 ms  
Elapsed time 339.818 ms  
Elapsed time 338.917 ms  
Elapsed time 344.382 ms  
Elapsed time 344.83 ms  
Elapsed time 339.937 ms  
Elapsed time 342.256 ms  
Elapsed time 341.316 ms  
Elapsed time 341.036 ms  
  
std::execution::par  
Elapsed time 83.4352 ms  
Elapsed time 80.292 ms  
Elapsed time 78.1621 ms  
Elapsed time 81.0647 ms  
Elapsed time 79.8433 ms  
Elapsed time 78.5182 ms  
Elapsed time 81.5535 ms  
Elapsed time 78.7717 ms  
Elapsed time 79.5887 ms  
Elapsed time 78.5133 ms  
