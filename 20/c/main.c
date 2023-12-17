bool isValid(char* s) {
  int i;
  char stack[10001];
  int st_i = 0;
  int ch_len = 0;

  ch_len = strlen(s);

  for(i = 0; i<ch_len; i++){
    switch(s[i]){
    case '[':
    case '(':
    case '{':
      stack[st_i++] = s[i];
      break;
    case ']':
      if(0 < st_i && stack[st_i - 1] == '[')
	st_i--;
      else return false;
      break;
    case '}':
      if(0 < st_i && stack[st_i - 1] == '{')
	st_i--;
      else return false;
      break;
    case ')':
      if(0 < st_i && stack[st_i - 1] == '(')
	st_i--;
      else return false;
      break;
    default:
        break;
    }
  }
  
  return st_i == 0;
}
