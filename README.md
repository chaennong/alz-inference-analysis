# Alzheimer’s Disease Inference Analysis: HDL Cholesterol

## Overview

This project investigates the relationship between high-density lipoprotein (HDL) cholesterol levels and cognitive, functional, and neurodegenerative outcomes related to Alzheimer’s disease. While HDL cholesterol has traditionally been viewed as cardioprotective, emerging evidence suggests that very high HDL levels may be associated with adverse neurological outcomes.

Using a synthesized Alzheimer’s disease dataset, this analysis applies classical statistical inference methods to formally evaluate whether individuals with high HDL cholesterol (>80 mg/dL) exhibit greater cognitive or functional impairment compared to those with optimal HDL levels.

---

## Introduction

High-density lipoprotein (HDL) cholesterol has traditionally been considered protective for cardiovascular health. However, recent studies have suggested a potential association between very high HDL levels and an increased risk of dementia, including Alzheimer’s disease.

During exploratory data analysis (EDA), a higher proportion of participants diagnosed with Alzheimer’s disease was observed among individuals with HDL levels exceeding 80 mg/dL, compared to those without a diagnosis. This observation motivated further investigation into whether HDL cholesterol levels are associated with cognitive and functional impairment.

The primary objective of this analysis is to evaluate the relationship between categorized HDL cholesterol levels and multiple cognitive and functional assessment outcomes, as well as the development of neurodegenerative symptoms.

---

## Methods

### HDL Cholesterol Categorization

HDL cholesterol levels were categorized using sex-specific clinical thresholds:

* **High HDL**: HDL > 80 mg/dL
* **Optimal HDL**:

  * Males: 40–80 mg/dL
  * Females: 50–80 mg/dL
* **Low HDL**:

  * Males: < 40 mg/dL
  * Females: < 50 mg/dL

Analyses focused on comparisons between the High HDL and Optimal HDL groups.

---

### Outcome Measures

#### Cognitive and Functional Assessments

* **MMSE (Mini-Mental State Examination)**

  * Range: 0–30 (lower scores indicate greater impairment)
* **Functional Assessment Score**

  * Range: 0–10 (lower scores indicate greater impairment)
* **ADL (Activities of Daily Living) Score**

  * Range: 0–10 (lower scores indicate greater impairment)
* **Memory Complaints** (Binary)
* **Behavioral Problems** (Binary)

#### Neurodegenerative Symptoms (Binary)

* Confusion
* Disorientation
* Personality Changes
* Difficulty in Completing Tasks
* Forgetfulness

---

### Statistical Analysis

* **Two-sample pooled t-tests** were used to compare mean scores of:

  * MMSE
  * Functional Assessment
  * ADL

* **Two-sample proportion z-tests** were used to compare prevalence rates of:

  * Memory complaints
  * Behavioral problems
  * Confusion
  * Disorientation
  * Personality changes
  * Difficulty completing tasks
  * Forgetfulness

All hypothesis tests were conducted at a 5% significance level, using one-sided alternatives to test whether high HDL cholesterol is associated with *greater impairment*.

Statistical testing functions were implemented using **base R**, without external inference libraries. Data visualization relied solely on **ggplot2**.

---

## Functions

The following custom R functions were implemented to ensure reproducibility and transparency of the statistical inference procedures used in this analysis.

### `preprocess.R`

* **`preprocess()`**
  Preprocesses the raw dataset by:

  * Removing unnecessary or non-informative variables
  * Creating a new categorical variable that assigns each participant to one of three HDL cholesterol levels (**High**, **Optimal**, **Low**) based on sex-specific clinical thresholds

* **`split_hdl()`**
  Splits the preprocessed dataset into subsets corresponding to the three HDL cholesterol categories, enabling group-wise comparisons.

### `pooled_t_test.R`

* **`pooled_t_test()`**
  Performs a two-sample pooled t-test to compare mean outcomes between the **High HDL** and **Optimal HDL** groups.

  The function returns:

  * t-statistic
  * Critical value (α = 0.05)
  * p-value
  * Statistical conclusion (reject or fail to reject the null hypothesis)

### `proportion_z_test.R`

* **`proportion_z_test()`**
  Performs a two-sample proportion z-test to compare prevalence rates of binary outcomes between the **High HDL** and **Optimal HDL** groups.

  The function returns:

  * z-statistic
  * Critical value (α = 0.05)
  * p-value
  * Statistical conclusion (reject or fail to reject the null hypothesis)

---

## Exploratory Data Analysis (EDA)

The dataset was explored using **ggplot2** to visualize the distributions of demographic, biometrics, cognitive assessments, and symptom variables, stratified by **diagnosis status**.

* **Demographics:** Age and sex distributions by Alzheimer’s diagnosis
* **Biometrics:** HDL cholesterol, BMI, and other lab measures
* **Symptoms:** Memory complaints, behavioral problems, and neurodegenerative symptoms
* **Assessment Scores:** MMSE, Functional Assessment, ADL scores

These visualizations helped identify patterns and informed the subsequent formal inference analysis.

---

## Results

### Distribution of HDL Cholesterol Levels

The HDL cholesterol distribution was right-skewed, with a clinically meaningful subset of participants exceeding the high HDL threshold.

* High HDL: **509 participants**
* Optimal HDL: **936 participants**
* Low HDL: **704 participants**

---

### Cognitive and Functional Outcomes

| Outcome               | p-value | Conclusion        |
| --------------------- | ------- | ----------------- |
| MMSE                  | 0.779   | Fail to reject H₀ |
| Functional Assessment | 0.236   | Fail to reject H₀ |
| Memory Complaints     | 0.803   | Fail to reject H₀ |
| Behavioral Problems   | 0.404   | Fail to reject H₀ |
| ADL Score             | 0.899   | Fail to reject H₀ |

No outcome demonstrated statistically significant evidence of greater impairment in the high HDL group.

---

### Neurodegenerative Symptoms

| Symptom                     | p-value | Conclusion        |
| --------------------------- | ------- | ----------------- |
| Confusion                   | 0.232   | Fail to reject H₀ |
| Disorientation              | 0.095   | Fail to reject H₀ |
| Personality Changes         | 0.999   | Fail to reject H₀ |
| Difficulty Completing Tasks | 0.969   | Fail to reject H₀ |
| Forgetfulness               | 0.816   | Fail to reject H₀ |

Across all symptoms, the null hypothesis of no association could not be rejected at the 5% significance level.

---

## Conclusion

This analysis found **no strong statistical evidence** supporting an association between high HDL cholesterol levels and worsened cognitive or functional outcomes, nor increased neurodegenerative symptoms. Although descriptive trends suggested a higher prevalence of Alzheimer’s disease diagnoses among individuals with very high HDL levels, formal hypothesis testing did not confirm a clinically meaningful relationship.

These findings suggest that restricting HDL cholesterol solely for dementia or Alzheimer’s disease prevention may not be justified based on this dataset. Future work should incorporate **longitudinal data**, **multivariable adjustment for confounders**, and **causal modeling approaches** to better clarify the role of HDL cholesterol in neurodegenerative disease risk.

---

## Reproducibility

* Language: **R**
* Required packages: `ggplot2`
* All statistical tests implemented using base R functions

---

## Notes

* The dataset used in this project is **synthetic** and intended for methodological demonstration only.
* Results should not be interpreted as clinical evidence.
