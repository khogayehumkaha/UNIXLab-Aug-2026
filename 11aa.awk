BEGIN {
    print("TOTAL NUMBER OF BOOKS SOLD IN EACH CATEGORY")
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
        printf("\t%-17s = %-5d\n", item, books[item])
        total += books[item]
    }

    printf("\t%-17s = %-5d\n", "Total Books Sold", total)
}