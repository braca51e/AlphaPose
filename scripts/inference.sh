set -x

CONFIG=$1
CKPT=$2
VIDEO=$3
OUTDIR=${4:-"./examples/res"}

python3 scripts/demo_inference.py \
    --cfg ${CONFIG} \
    --checkpoint ${CKPT} \
    --video ${VIDEO} \
    --outdir ${OUTDIR} \
    --detector yolo --save_img --vis_fast --sp
