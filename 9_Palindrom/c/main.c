bool isPalindrome(int x) {
    char buf[12];
    int i,l;
    sprintf(buf, "%d", x);
    l = strlen(buf);
    for(i = 0;i<(l / 2);i++){

        if(buf[i] != buf[l - i - 1])
            return 0;
    } 
    return 1;
}