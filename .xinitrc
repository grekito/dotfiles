picom -f &
nitrogen --restore &

nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }" &

exec qtile start
