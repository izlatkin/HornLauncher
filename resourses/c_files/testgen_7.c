int main( ) {
    int x = 1;
    int y = 20;
    while (1) {
        if (x >= 5 || x < 2 || (x % 3) == 1){
            y ++;
        }else{
            x++;
        }
        if (x + y == 100000 && x > 1000 && y > 2000) {
            break;
        }
        x++;
    }
    return 0;
}