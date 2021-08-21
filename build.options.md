Build Options:
  with ecmult precomp     = yes
  with external callbacks = no
  with benchmarks         = no
  with tests              = no
  with openssl tests      = no
  with coverage           = no
  module ecdh             = no
  module recovery         = yes
  module extrakeys        = yes
  module schnorrsig       = yes

  asm                     = x86_64
  ecmult window size      = 15
  ecmult gen prec. bits   = 4

  valgrind                = no
  CC                      = gcc
  CPPFLAGS                =  
  SECP_CFLAGS             = -O2  -std=c89 -pedantic -Wno-long-long -Wnested-externs -Wshadow -Wstrict-prototypes -Wundef -Wno-overlength-strings -Wall -Wno-unused-function -Wextra -Wcast-align -Wcast-align=strict -fvisibility=hidden 
  CFLAGS                  = -g -O2
  LDFLAGS                 = 

  CC_FOR_BUILD            = gcc
  CPPFLAGS_FOR_BUILD      =  
  SECP_CFLAGS_FOR_BUILD   = -O2  -std=c89 -pedantic -Wno-long-long -Wnested-externs -Wshadow -Wstrict-prototypes -Wundef -Wno-overlength-strings -Wall -Wno-unused-function -Wextra -Wcast-align -Wcast-align=strict -fvisibility=hidden 
  CFLAGS_FOR_BUILD        = -g -O2
  LDFLAGS_FOR_BUILD       = 

Options used to compile and link:
  external signer = yes
  multiprocess    = no
  with libs       = yes
  with wallet     = yes
    with sqlite   = no
    with bdb      = yes
  with gui / qt   = no
  with zmq        = no
  with test       = no
  with bench      = no
  with upnp       = no
  with natpmp     = no
  use asm         = yes
  ebpf tracing    = no
  sanitizers      = 
  debug enabled   = no
  gprof enabled   = no
  werror          = no

  target os       = linux
  build os        = linux-musl

  CC              = gcc
  CFLAGS          = -pthread -g -O2
  CPPFLAGS        =   -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2  -DHAVE_BUILD_INFO -D__STDC_FORMAT_MACROS -DPROVIDE_FUZZ_MAIN_FUNCTION
  CXX             = g++ -std=c++17
  CXXFLAGS        =   -fstack-reuse=none -Wstack-protector -fstack-protector-all -fcf-protection=full -fstack-clash-protection  -Wall -Wextra -Wformat -Wformat-security -Wvla -Wswitch -Wredundant-decls -Wunused-variable -Wdate-time -Wsign-compare -Wduplicated-branches -Wduplicated-cond -Wlogical-op -Woverloaded-virtual -Wsuggest-override -Wimplicit-fallthrough  -Wno-unused-parameter -Wno-deprecated-copy   -g -O2 -fno-extended-identifiers
  LDFLAGS         = -lpthread  -Wl,-z,relro -Wl,-z,now -Wl,-z,separate-code -pie  
  ARFLAGS         = cr
