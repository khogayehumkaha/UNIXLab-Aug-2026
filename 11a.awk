BEGIN {
    print "Discipline\tBooks Sold"
}

{
    item = $1
    for (i = 2; i < NF; i++)
        item = item " " $i

    books[item] += $NF
}

END {
    for (item in books)
    {
        print item "\t" books[item]
          total += books[item]
    }

    print "Total Books Sold =", total
}