#include <stdio.h>

int main() {
  unsigned int lba, heads = 2, sectors = 18, cy, he, se;
  unsigned short i, j, k;
  unsigned char *FAT;
  FILE *f;

  FAT = (unsigned char *)malloc(0x1200);
  for(lba=0; lba<0x1200; lba++)
    FAT[lba] = 0;

  lba = 0x2600 / 512;
  cy = lba / (heads * sectors);
  he = (lba / sectors) % heads;
  se = (lba % sectors) + 1;
  printf("Root Directory at: LBA=%d, C=%d, H=%d, S=%d\n", lba, cy, he, se);
  
  lba = 0x4200 / 512;
  cy = lba / (heads * sectors);
  he = (lba / sectors) % heads;
  se = (lba % sectors) + 1;
  printf("Data Area at: LBA=%d, C=%d, H=%d, S=%d\n", lba, cy, he, se);

  f = fopen("fat1440.bin", "wb");

  FAT[0] = 0xf0;
  FAT[1] = 0xff;
  FAT[2] = 0xff;
  j = 3;
  j += 40327 / 512; if(40327%512>0) j++;
  j += 37908 / 512; if(37908%512>0) j++; 
  j += 52925 / 512; if(52925%512>0) j++;
  
  k = 3;
  for(i=3; i<j; i+=2) {  
    FAT[k++] = i & 0xff; 
    FAT[k++] = (((i+1) & 15)<<4)|((i >> 8) & 15);
    FAT[k++] = ((i+1) >> 4) & 0xff;
  }

  FAT[0x78] |= 0xff;
  FAT[0x79] |= 0x0f;

  FAT[0xE8] |= 0xf0;
  FAT[0xE9] |= 0xff;

  FAT[0x184] |= 0xf0;
  FAT[0x185] |= 0xff;

  fwrite(FAT, 1, 0x1200, f);
  free(FAT);
  fclose(f);
  return 0;
}
