CREATE OR REPLACE MODEL
    `final-374500.434Final1.autoMlModel` 
OPTIONS( model_type = 'AUTOML_REGRESSOR',
    OPTIMIZATION_OBJECTIVE = 'MINIMIZE_RMSE',
    input_label_cols = ['indicativerevenue']) AS
    SELECT
        * EXCEPT (
        month,
        artist,
        song,
        us,
        uk,
        de,
        fr,
        ca,
        au,
        VADER_Score_additive,
        VADER_Score_mean,
        VADER_Score_ratio,
        VADER_Score_extremes,
        Blob_Score_additive,
        Blob_Score_mean,
        Blob_Score_ratio,
        Blob_Score_extremes )
    FROM
        `final-374500.434Final1.songswithscores`
    LIMIT  
        1000
)



SELECT 
    *
FROM
    ML.PREDICT(MODEL `final-374500.434Final1.autoMlModel`,
    (
        SELECT
            * EXCEPT ( month,artist,song)
        FROM
            `final-374500.434Final1.songswithscores`

    LIMIT  
        100 ) ) 


