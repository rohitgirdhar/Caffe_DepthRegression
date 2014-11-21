
#### To train

```bash
$ GLOG_logtostderr=1 ./build/tools/caffe train --solver=examples/depth_tiny/imagenet_solver.prototxt --weights=examples/imagenet/bvlc_reference_caffenet.caffemodel
```

#### To evaluate

```bash
$ ./build/tools/extract_depth_features examples/depth_tiny/imagenet_depth_train.prototxt  examples/depth_tiny/final.caffemodel  examples/depth/labels.txt examples/depth_tiny
```
