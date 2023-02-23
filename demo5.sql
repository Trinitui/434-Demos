CREATE MODEL `434Final.songsnolyricswithscoresmodel1`
OPTIONS (input_label_cols = ['indicativerevenue'], model_type = 'random_forest_regressor') AS
SELECT
    us,
    uk,
    VADER_Score_EdgeBooster,
    Blob_Score_EdgeBooster,
    indicativerevenue
FROM
    `final-374500.434Final1.songsnolyricswithscores`
LIMIT 1000




SELECT 
    *
FROM 
    ML.PREDICT(MODEL `final-374500.434Final.songsnolyricswithscoresmodel1`, ( 
    SELECT 
        '100' as us,
        100 as uk,
        -40 as VADER_Score_EdgeBooster,
        -2 as Blob_Score_EdgeBooster
    )
)
