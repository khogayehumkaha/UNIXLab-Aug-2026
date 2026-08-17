{
    split($0, d, "-")

    if (d[1] < 1 || d[1] > 31 || d[2] < 1 || d[2] > 12)
    {
        print "Invalid date"
        exit
    }

    days[1]=31; days[2]=28; days[3]=31; days[4]=30;
    days[5]=31; days[6]=30; days[7]=31; days[8]=31;
    days[9]=30; days[10]=31; days[11]=30; days[12]=31;

    if (d[1] > days[d[2]+0])
    {
        print "Invalid date"
        exit
    }

    month[1]="January"; month[2]="February"; month[3]="March";
    month[4]="April"; month[5]="May"; month[6]="June";
    month[7]="July"; month[8]="August"; month[9]="September";
    month[10]="October"; month[11]="November"; month[12]="December";

    print month[d[2]+0] "," d[1] "," d[3]
    exit
}