install.packages("protr")
library(protr)

# Read protein sequences from the positive.fasta file
positive_sequences <- readFASTA("positive.fasta")
positive_aac <- lapply(positive_sequences, extractAAC)

# Save positive AAC descriptors to a CSV file
positive_output_file <- "positive_aac.csv"
write.csv(do.call(rbind, positive_aac), file = positive_output_file, row.names = FALSE)

# Read protein sequences from the negative.fasta file
negative_sequences <- readFASTA("negative.fasta")
negative_aac <- lapply(negative_sequences, extractAAC)

# Save positive AAC descriptors to a CSV file
negative_output_file <- "negative_aac.csv"
write.csv(do.call(rbind, negative_aac), file = negative_output_file, row.names = FALSE)


# Read protein sequences from the positive.fasta file
positive_sequences <- readFASTA("positive.fasta")

# Calculate Dipeptide Composition descriptors for each sequence
positive_dipeptide <- lapply(positive_sequences, extractDC)

# Save positive Dipeptide Composition descriptors to a CSV file
positive_output_file <- "positive_dipeptide.csv"
write.csv(do.call(rbind, positive_dipeptide), file = positive_output_file, row.names = FALSE)


# Read protein sequences from the negative.fasta file
negative_sequences <- readFASTA("negative.fasta")

# Calculate Dipeptide Composition descriptors for each sequence
negative_dipeptide <- lapply(negative_sequences, extractDC)

# Save positive Dipeptide Composition descriptors to a CSV file
negative_output_file <- "negative_dipeptide.csv"
write.csv(do.call(rbind, negative_dipeptide), file = negative_output_file, row.names = FALSE)

# Read protein sequences from the positive.fasta file
positive_sequences <- readFASTA("positive.fasta")

# Calculate Tripeptide Composition descriptors for each sequence
positive_tripeptide <- lapply(positive_sequences, extractTC)

# Save positive Tripeptide Composition descriptors to a CSV file
positive_output_file <- "positive_tripeptide.csv"
write.csv(do.call(rbind, positive_tripeptide), file = positive_output_file, row.names = FALSE)

# Read protein sequences from the negative.fasta file
negative_sequences <- readFASTA("negative.fasta")

# Calculate Tripeptide Composition descriptors for each sequence
negative_tripeptide <- lapply(negative_sequences, extractTC)

# Save positive Tripeptide Composition descriptors to a CSV file
negative_output_file <- "negative_tripeptide.csv"
write.csv(do.call(rbind, negative_tripeptide), file = negative_output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("positive.fasta")

# Calculate Normalized Moreau-Broto autocorrelation descriptors for each sequence
moreau_descriptors <- lapply(sequences, extractMoreauBroto)

# Save the descriptors to a CSV file
output_file <- "positive_moreau_descriptors.csv"
write.csv(do.call(rbind,moreau_descriptors), file = output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("negative.fasta")

# Calculate Normalized Moreau-Broto autocorrelation descriptors for each sequence
moreau_descriptors <- lapply(sequences, extractMoreauBroto)

# Save the descriptors to a CSV file
output_file <- "negative_moreau_descriptors.csv"
write.csv(do.call(rbind,moreau_descriptors), file = output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("positive.fasta")

# Calculate Moran autocorrelation descriptors for each sequence based on amino acid composition
moran_descriptors <- lapply(sequences, extractMoran)

# Save the descriptors to a CSV file
output_file <- "positive_moran_descriptors.csv"
write.csv(do.call(rbind, moran_descriptors), file = output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("negative.fasta")

# Calculate Moran autocorrelation descriptors for each sequence based on amino acid composition
moran_descriptors <- lapply(sequences, extractMoran)

# Save the descriptors to a CSV file
output_file <- "negative_moran_descriptors.csv"
write.csv(do.call(rbind, moran_descriptors), file = output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("positive.fasta")

# Calculate Geary autocorrelation descriptors for each sequence
geary_descriptors <- lapply(sequences, extractGeary)

# Save the descriptors to a CSV file
output_file <- "positive_geary_descriptors.csv"
write.csv(do.call(rbind, geary_descriptors), file = output_file, row.names = FALSE)

# Read protein sequences from a FASTA file
sequences <- readFASTA("negative.fasta")

# Calculate Geary autocorrelation descriptors for each sequence
geary_descriptors <- lapply(sequences, extractGeary)

# Save the descriptors to a CSV file
output_file <- "negative_geary_descriptors.csv"
write.csv(do.call(rbind, geary_descriptors), file = output_file, row.names = FALSE)





# Read protein sequences from a FASTA file
sequences <- readFASTA("positive.fasta")

# Set the desired value of lambda
lambda <- 1

# Calculate PseAAC descriptors for each sequence
pse_aac_descriptors <- lapply(sequences, extractPAAC, lambda = lambda)

# Save the descriptors to a CSV file
output_file <- "positive_pse_aac_descriptors.csv"
write.csv(do.call(rbind, pse_aac_descriptors), file = output_file, row.names = FALSE)


# Read protein sequences from a FASTA file
sequences <- readFASTA("negative.fasta")

# Set the desired value of lambda
lambda <- 1

# Calculate PseAAC descriptors for each sequence
pse_aac_descriptors <- lapply(sequences, extractPAAC, lambda = lambda)

# Save the descriptors to a CSV file
output_file <- "negative_pse_aac_descriptors.csv"
write.csv(do.call(rbind, pse_aac_descriptors), file = output_file, row.names = FALSE)
























library(protr)

# Read protein sequences from your dataset (positive sequences)
sequences <- readFASTA("positive.fasta")

# Set the desired value of lambda
lambda <- 424  

# Perform padding on sequences
padded_sequences <- lapply(sequences, function(x) {
  if (nchar(x) < lambda) {
    padding <- rep("X", lambda - nchar(x))
    paste0(x, padding, collapse = "")  # Combine original sequence with padding
  } else {
    x  # No padding needed if sequence length is equal to or greater than lambda
  }
})
# Calculate APseAAC descriptors for each sequence
apseaac_descriptors <- lapply(padded_sequences, extractAPAAC, lambda = lambda)

# Get the column names
column_names <- colnames(apseaac_descriptors[[1]])

# Display the APseAAC descriptors
for (i in seq_along(apseaac_descriptors)) {
  cat(paste(column_names, apseaac_descriptors[[i]], sep = " "), "\n")
}



library(protr)

# Read protein sequences from your dataset (positive sequences)
sequences <- readFASTA("positive.fasta")

# Set the desired value of lambda
lambda <- 424  

# Create a data frame to store the padded sequences
df <- data.frame(SeqID = character(), PaddedSequence = character(), stringsAsFactors = FALSE)

# Pad the sequences and add them to the data frame
for (i in seq_along(sequences)) {
  sequence <- sequences[[i]]
  padded_sequence <- if (nchar(sequence) < lambda) {
    paste(sequence, rep(sequence, lambda - nchar(sequence)))
  } else {
    sequence
  }
  df <- rbind(df, data.frame(SeqID = i, PaddedSequence = padded_sequence, stringsAsFactors = FALSE))
}

# Save the padded sequences in a CSV file
output_file <- "padded_sequences.csv"
write.csv(df, output_file, row.names = FALSE)



# Read protein sequences from your dataset
sequences <- readFASTA("positive.fasta")

# Set the desired value of lambda
lambda <- 424 

# Pad the sequences by replicating the sequence
padded_sequences <- lapply(sequences, function(x) {
  if (nchar(x) < lambda) {
    padding <- paste(rep(x, ceiling(lambda / nchar(x))), collapse = "")
    substr(padding, 1, lambda)
  } else {
    x
  }
})

# Create a data frame with the padded sequences
padded_sequences_df <- data.frame(seq = padded_sequences)

# Save the padded sequences to a CSV file
output_file <- "positive_padded_sequences.csv"
write.csv(padded_sequences_df, file = output_file, row.names = FALSE)

























###working one for Amphiphilic pseudo-amino acid composition (APseAAC)

# Read protein sequences from a CSV file
sequences <- read.csv("positive_padded_sequences.csv")$seq

# Calculate APseAAC descriptors for each sequence
apseaac_descriptors <- lapply(sequences, extractAPAAC)

# Get the column names
column_names <- colnames(apseaac_descriptors[[1]])

# Display the APseAAC descriptors
for (i in seq_along(apseaac_descriptors)) {
  cat(paste(column_names, apseaac_descriptors[[i]], sep = " "), "\n")
}

# Save the APseAAC descriptors to a CSV file
output_file <- "positive_apseaac_descriptors.csv"
write.csv(do.call(rbind, apseaac_descriptors), file = output_file, row.names = FALSE)


# Read protein sequences from a CSV file
sequences <- read.csv("negative_padded_sequences.csv")$seq

# Calculate APseAAC descriptors for each sequence
apseaac_descriptors <- lapply(sequences, extractAPAAC)

# Get the column names
column_names <- colnames(apseaac_descriptors[[1]])

# Display the APseAAC descriptors
for (i in seq_along(apseaac_descriptors)) {
  cat(paste(column_names, apseaac_descriptors[[i]], sep = " "), "\n")
}

# Save the APseAAC descriptors to a CSV file
output_file <- "negative_apseaac_descriptors.csv"
write.csv(do.call(rbind, apseaac_descriptors), file = output_file, row.names = FALSE)
