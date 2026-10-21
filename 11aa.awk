# awk -f 11aa.awk Books.txt
# awk -f 11aa.awk Books.txt | sort

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





# The BEGIN block runs exactly once before any data rows from Books.txt are read.

# • item = $1: It starts by assigning the first field (word) of the line to a variable called item.
# • for (i = 2; i < NF; i++): 
#   This loop handles multi-word category names (like "Computer Science"). 
#   It iterates from the second field up to the second-to-last field 
#   (NF stands for Number of Fields, and NF - 1 is the upper limit since i < NF). 
#   It appends these intermediate words to item separated by a space.
#   • books[item] += $NF: $NF represents the very last field on the line, which contains the numerical count of books sold. 
#   This value is added to an associative array called books, using the category name (item) as the unique key.

#  •  block runs exactly once after the entire input file has been processed.
#  • for (item in books): Loops through each unique book category stored in the books array.
#  • printf("\t%-17s = %-5d\n", item, books[item]): Prints the category name left-aligned to 17 spaces (%-17s) and its respective sum right-aligned to 5 spaces (%-5d), preceded by a tab character (\t).
#  • total += books[item]: Dynamically tracks and updates the grand total of all books sold across all categories.
#  • The final printf statement outputs the cumulative Total Books Sold metric matching the table alignment.
