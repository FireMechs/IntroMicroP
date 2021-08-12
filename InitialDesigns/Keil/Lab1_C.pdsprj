#include <reg51.h>

void delay(unsigned int x){
	int i;
	for (i=0;i<x;i++);
}
sbit led0 = P0^0;
sbit led1 = P0^1;
sbit led2 = P0^2;

void toggle_led0(int timer){
	if ((timer % 500) == 0){
		led0 =~ led0;
	}
}

void toggle_led1(int timer){
	if ((timer % 1000) == 0){
		led1 =~ led1;
	}
}

void toggle_led2(int timer){
	if ((timer % 1300) == 0){
		led2 =~ led2;
	}
}

void main(){
	while(1){
		int time;
		for (time=0;time<13000;time++){
			toggle_led0(time);
			toggle_led1(time);
			toggle_led2(time);
		}
	}
}