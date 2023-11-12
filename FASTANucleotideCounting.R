count_nucleotides <- function(dna_sequence) {
  dna_sequence <- toupper(dna_sequence) #convert everything to uppercase
  
  count_a <- sum(str_count(dna_sequence, "A"))
  count_c <- sum(str_count(dna_sequence, "C"))
  count_t <- sum(str_count(dna_sequence, "T"))
  count_g <- sum(str_count(dna_sequence, "G"))
  
  return(list(A = count_a, C = count_c, T = count_t, G = count_g))
}

read_fasta_file <- function(path_to_file) {
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
  
}