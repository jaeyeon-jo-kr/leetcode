#include <stdio.h>
#include <string.h>

int singleChar(char s)
{
  switch(s)
    {case 'I':
	return 1;
    case 'V':
      return 5;
    case 'X':
      return 10;
    case 'L':
      return 50;
    case 'C':
      return 100;
    case 'D':
      return 500;
    case 'M':
      return 1000;
    }
  return 0;  
}

int doubleChar(char a1, char a2)
{
  if(a1 == 'I' && a2 == 'V'){
    return 4;
  }else if(a1 == 'I' && a2 == 'X'){
    return 9;
  }else if(a1 == 'X' && a2 == 'L'){
    return 40;
  }else if(a1 == 'X' && a2 == 'C'){
    return 90;
  }else if(a1 == 'C' && a2 == 'D'){
    return 400;
  }else if(a1 == 'C' && a2 == 'M'){
    return 900;
  }
  return 0;
  
}

int romanToInt(char* s) {
  int len = strlen(s);
  int i = 0;
  int total = 0;
  int result = 0;
  
  while(i < len){
    if(i == len - 1){
      total += singleChar(s[i]);
      i++;
    } else {
      result = doubleChar(s[i], s[i+1]);
      if(result)
      {
	total += result;
	i += 2;
      }else{
	total += singleChar(s[i]);
	i++;
      }	
    }
  }
  return total;
}
