#!/bin/sh

export GOOGLE_APPLICATION_CREDENTIALS='/shared_data/shared/gcs_mosaic_streamingdataset_readwrite_svc_acct_creds.json' 
export GCS_KEYS_JSON='/shared_data/shared/gcs_mosaic_streamingdataset_readwrite_keys.json'

img2dataset \
    --url_list mscoco.parquet \
    --input_format "parquet" \
    --url_col "URL" \
    --caption_col "TEXT" \
    --output_format mosaicstreaming \
    --output_folder gs://pai-datasets-private/test-img2dataset/coco/ \
    --temp_download_folder ./tmp_coco_mds \
    --processes_count 4 \
    --thread_count 8 \
    --image_size 256 \
    --resize_only_if_bigger=True \
    --resize_mode "keep_ratio" \
    --skip_reencode=True \
    --enable_wandb False \

    