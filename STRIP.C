#include <dos.h>
#include <stdio.h>

int main() {
  FILE *f;
  unsigned char* buffer;
  unsigned short filesize;
  
  buffer = (unsigned char*)malloc(60000);
  f = fopen("msdos.bin", "rb");
  fseek(f, 0, SEEK_END);
  filesize = ftell(f);
  fseek(f, 0, SEEK_SET);
  fread(buffer, 60000, 1, f);
  fclose(f);

  f = fopen("msdos.sys", "wb");
  fwrite(buffer+0x3df0, filesize-0x3df0, 1, f);
  fclose(f);

  free(buffer);

  return 0;
}
