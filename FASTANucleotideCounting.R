library(stringr)
library(tools)
#hi this is srimayi
count_nucleotides <- function(dna_sequence) {
  dna_sequence <- toupper(dna_sequence) #convert everything to uppercase
  
  count_a <- sum(str_count(dna_sequence, "A"))
  count_c <- sum(str_count(dna_sequence, "C"))
  count_t <- sum(str_count(dna_sequence, "T"))
  count_g <- sum(str_count(dna_sequence, "G"))
  
  return(list(A = count_a, C = count_c, T = count_t, G = count_g))
}

read_file <- function(file_path) {
  print("hi")
  if (tools::file_ext(file_path) == "fasta") {
    read_fasta_file <- function(file_path) {
      fasta_content <- readLines(file_path)
      
      header <- character(0)
      sequence <- character(0)
      
      #loop through each line of the fasta sequence; if line starts with > then it's a header
      for (line in fasta_content) {
        if (startsWith(line, ">")) {
          header <- c(header, line)
        } else {
          sequence <- c(sequence, line)
        }
      }
      
      #uses count_nucleotides function with fasta file. gets rid of any spaces in sequence variable
      count_nucleotides(paste(sequence, collapse = ""))
    }
  } else if (tools::file_ext(file_path) == "csv") {
      read_csv_file <- function(file_path) {
        data <- read.table("CSV File_ SMARS DNA Sequences Dataset Chromosome hg18.csv", header=TRUE, sep = ",", colClasses = c("NULL","NULL","NULL","NULL","NULL","string"))
        return(data)
        #count_nucleotides(data)
      }
  }
}

tools::file_ext("CSV File_ SMARS DNA Sequences Dataset Chromosome hg18.csv")