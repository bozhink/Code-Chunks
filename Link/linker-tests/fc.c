float fc(x,y)
float x,y;
{
    return x+y;
}

float _ada_fc(x,y)
float x,y;
{
    return fc(x,y);
}

float fc_(float*x,float*y)
{
    return fc(*x,*y);
}
