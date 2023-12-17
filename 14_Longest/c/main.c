char prefix[201] = "";
char* longestCommonPrefix(char** strs, int strsSize) {
    int i,j=0;
    int cur_strlen = 0;
    int MAX_LEN = 200;
    int isSame = 1;
    char ch='a';

    strcpy(prefix, "");
    //characters
    for(i = 0; i < MAX_LEN;i++){
        isSame = 1;
        //select for line

        for(j = 0; j < strsSize;j++){
            cur_strlen = strlen(strs[j]);
            if(cur_strlen <= i){
                isSame = 0;
            }else if(j == 0){
                ch = strs[j][i];
            }else if(ch != strs[j][i]){
                isSame = 0;
            }
        }

        if(isSame == 0)
            return prefix;
        else 
            strncat(prefix, &ch, 1);
    }
    return prefix;
}
