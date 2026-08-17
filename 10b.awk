{
    if (!seen[$0])
    {
        print $0
        print $0 > "out10b.txt"
        seen[$0] = 1
    }
}