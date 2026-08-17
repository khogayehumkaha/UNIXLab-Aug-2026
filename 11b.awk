BEGIN {
    FS=":"
}

{
    basic = $5
    if (basic < 10000)
    {
        hra = basic * 0.15
        da = basic * 0.45
    }
    else
    {
        hra = basic * 0.20
        da = basic * 0.50
    }
    gross = basic + hra + da

    print "Employee:", $2
    print "Basic Salary:", basic
    print "HRA:", hra
    print "DA:", da
    print "Gross Salary:", gross
    print "-----------------------------"
}