# awk -f 10b.awk duplicate.txt

{
    if (!seen[$0])
    {
        print $0
        print $0 > "out10b.txt"
        seen[$0] = 1
    }
}
