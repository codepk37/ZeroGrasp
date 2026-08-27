for obj in /scratch/codepk37/Originaldataset/sinobj/curr_pipeline_output/*/; do
    name=$(basename "$obj")
    echo "========================================"
    echo "Running ZeroGrasp on $name"
    echo "========================================"

    mkdir -p "outputs/sinobj/$name"

    python3 demo.py \
        --img_path "$obj/rgb.png" \
        --depth_path "$obj/depth.png" \
        --mask_path "$obj/label.png" \
        --camera_info_path "$obj/camera.json" \
        --checkpoint "checkpoints/epoch=1-step=80000.ckpt" \
        --config "configs/demo_sinobj.yaml" \
        --output_dir "outputs/sinobj/$name"

    if [ $? -ne 0 ]; then
        echo "FAILED: $name"
    else
        echo "DONE: $name"
    fi
done
