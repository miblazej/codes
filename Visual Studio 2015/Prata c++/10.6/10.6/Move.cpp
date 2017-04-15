#include "Move.h"
#include <iostream>




Move::Move(double a, double b)
{
	x = a;
	y = b;
}


Move::~Move()
{
}


void Move::showmove()
{
	std::cout << x << std::endl;
	std::cout << y << std::endl;

}

Move Move::add(const Move & m) const
{
	Move move_sum;
	move_sum.x = x + m.x;
	move_sum.y = y + m.y;
	return move_sum;
}

void Move::reset(double a, double b)
{
	x = a;
	y = b;
}
