#include <gdbm.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define GDBM_PREFIX "GDBM version"
#define GDBM_PREFIX_LEN (sizeof(GDBM_PREFIX)-1)

int main() {
  const char* ver = gdbm_version;
  const int len = strlen(ver);

  if (len > GDBM_PREFIX_LEN && !memcmp(ver, GDBM_PREFIX, GDBM_PREFIX_LEN)) {
    puts("ok");
    return 0;
  } else {
    puts("Failed");
    return 4;
  }
}

