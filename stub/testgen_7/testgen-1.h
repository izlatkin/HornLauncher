int cnt_3840 = 0;
int cnt_3858 = 0;

static const int inp_3840[] = { 3001 };
static const int inp_3858[] = { 6998 };

const int nondet_3840(){
 return inp_3840[cnt_3840++];
} 
const int nondet_3858(){
 return inp_3858[cnt_3858++];
} 
