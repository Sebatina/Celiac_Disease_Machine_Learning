# One-Stop Database Machine Learning Repository

Welcome to the One-Stop Database Machine Learning Repository! This repository is dedicated to integrating machine learning techniques into Celiac Disease (CeD) research using the data from the One-Stop Database Version 2.

## Overview

The One-Stop Database Version 2 aims to provide an upgraded and more comprehensive resource for researchers and medical professionals interested in advancing our understanding of CeD. In this machine learning repository, we specifically concentrate on the predictive modeling aspect using Long Short-Term Memory (LSTM) networks and Support Vector Machines (SVM).

## How to Use

### Prerequisites

#### LSTM Model
- Python environment
- Required packages: scikit-learn, pandas, numpy, matplotlib, tensorflow

```bash
!pip install scikit-learn
!pip install pandas
!pip install numpy
!pip install matplotlib
!pip install tensorflow
```

#### SVM Model
- Python environment
- Required packages: scikit-learn, pandas, numpy, matplotlib, tensorflow (user-specific installation)

```bash
!pip install --user scikit-learn
!pip install --user pandas
!pip install --user numpy
!pip install --user matplotlib
!pip install --user tensorflow
```

### Steps

1. **Dataset Acquisition:**
   - Utilize the positive sequences from the One-Stop Database and negative sequences from the NCBI database.
   - Ensure a balanced dataset for training and testing.

2. **Clustering of Negative Sequences using CD-HIT:**
   - Remove duplication and generate representative sequences from the negative peptide dataset using the CD-HIT clustering approach. (File Name: cdhit_clustering)

3. **Feature Extraction from Sequences:**
   - Utilize the Protr package in R and Python for extracting features like amino acid composition, dipeptide composition, tripeptide composition, autocorrelation descriptors, pseudo-amino acid composition, and amphiphilic pseudo-amino acid composition. (Feature Extraction using R: ML/feature_extraction/feature_extraction_using_R, Feature Extraction using Python: ML/feature_extraction/feature_extraction_using_Python) 
   - Address feature quality concerns to enhance model performance.

4. **Motif-based Analysis (MEME):**
   - Conduct motif-based analysis using the online tool MEME (Multiple Em for Motif Elicitation) to discover statistically significant motifs within inducing and non-inducing peptide sequences.

5. **Ensemble Feature Selection (EFS):**
   - Enhance the model's performance by employing ensemble feature selection techniques, combining various methods to identify relevant features. (Output File Name: ML/ensemble_feature_selection/efs_result, Input File: ML/ensemble_feature_selection/efs_input, Converting EFS to CSV File: ML/ensemble_feature_selection/cmd_efs_to_efs)

6. **Dataset Splitting for Training, Testing, and Validation:**
   - Split the dataset into training, testing, and validation sets to evaluate the model's performance.

7. **Model Training and Evaluation (LSTM and SVM):**
   - Utilize Long Short-Term Memory (LSTM) networks and Support Vector Machines (SVM) for training and evaluation. (LSTM Model File Name: ML/models/LSTM, SVM Model File Name: ML/models/SVM)
   - Assess model efficacy using performance metrics such as accuracy, sensitivity, specificity, F1-score, and Matthews correlation coefficient.

## Contributions
If you find ways to enhance or optimize the machine learning models, your contributions are welcome! Feel free to open issues or submit pull requests.

Thank you for contributing to advancing celiac disease research through machine learning!
