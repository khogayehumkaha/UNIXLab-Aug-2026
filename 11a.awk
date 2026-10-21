# awk -f 11a.awk Books1.txt
# awk -f 11a.awk Books1.txt | sort

BEGIN {
    print"TOTAL NUMBER OF BOOOKS SOLD IN EACH CATAGORY"
}

{
    books [$1]+=$2
}

END { 
    for(item in books)
    { 
        printf("\t%-17s %1s %-5d\n", item, "=",books[item])
        total+=books[item]
    }
    printf("%-17s %1s %-5s\n", "Total Books Sold","=", total)
}

