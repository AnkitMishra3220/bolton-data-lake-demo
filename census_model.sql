# Creation of view

CREATE OR REPLACE VIEW
  `census.input_view` AS
SELECT
  age,
  workclass,
  marital_status,
  education_num,
  occupation,
  hours_per_week,
  income_bracket,
  CASE
    WHEN MOD(functional_weight, 10) < 8 THEN 'training'
    WHEN MOD(functional_weight, 10) = 8 THEN 'evaluation'
    WHEN MOD(functional_weight, 10) = 9 THEN 'prediction'
  END AS dataframe
FROM
  `bigquery-public-data.ml_datasets.census_adult_income`;


# Creation of model

CREATE OR REPLACE MODEL
  `census.census_model`
OPTIONS
  ( model_type='LOGISTIC_REG',
    auto_class_weights=TRUE,
    input_label_cols=['income_bracket']
  ) AS
SELECT
  * EXCEPT(dataframe)
FROM
  `census.input_view`
WHERE
  dataframe = 'training';

# Model evaluation

SELECT
  *
FROM
  ML.EVALUATE (MODEL `census.census_model`,
    (
    SELECT
      *
    FROM
      `census.input_view`
    WHERE
      dataframe = 'evaluation'
    )
  )
  ;

# Predictions

SELECT
  *
FROM
  ML.PREDICT (MODEL `census.census_model`,
    (
    SELECT
      *
    FROM
      `census.input_view`
    WHERE
      dataframe = 'prediction'
     )
  )
;

#standardSQL

SELECT
*
FROM
ML.EXPLAIN_PREDICT(MODEL `census.census_model`,
  (
  SELECT
    *
  FROM
    `census.input_view`
  WHERE
    dataframe = 'evaluation'),
  STRUCT(3 as top_k_features));


# For explain, need to modify the model definition

CREATE OR REPLACE MODEL
  census.census_model
OPTIONS
  ( model_type='LOGISTIC_REG',
    auto_class_weights=TRUE,
    enable_global_explain=TRUE,
    input_label_cols=['income_bracket']
  ) AS
SELECT
  * EXCEPT(dataframe)
FROM
  census.input_view
WHERE
  dataframe = 'training';
  

#Explain

SELECT
  *
FROM
  ML.GLOBAL_EXPLAIN(MODEL `census.census_model`);
