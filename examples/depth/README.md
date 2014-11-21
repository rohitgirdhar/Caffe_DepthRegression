Running
-------

#### Generate data from NYUv2 MAT file on a computer with matlab
(Set paths to dataset etc first)

```matlab
>>> getImgsAndDepths
```

#### Generate the data in leveldb format

```bash
$ make -j8
$ ./build/tools/convert_depth_imageset
```

#### compute Image mean

```bash
$ ./build/tools/extract_depth_features examples/depth/imagenet_depth_train.prototxt examples/depth/depth__iter_2000.caffemodel examples/depth/labels.txt examples/depth
```

#### Run training

```bash
$ GLOG_logtostderr=1 ./build/tools/caffe train --solver=examples/depth/imagenet_solver.prototxt --weights=examples/imagenet/bvlc_reference_caffenet.caffemodel
```
(or change `--weights` to where you want to resume training from)


#### Testing

Testing on the training set itself

```bash
$ ./build/tools/extract_depth_features examples/depth/imagenet_depth_train.prototxt examples/depth/depth__iter_2000.caffemodel examples/depth/labels.txt examples/depth
# where labels.txt is a file with labels for each training image (or as many
# you want to evaluate on
```

The output can be visualized by removing text from the output file
and loading into matlab:

```matlab
>>> temp = textscan(fopen('3dNormalResult.txt'), '%f');
>>> temp = temp{1};
>>> imagesc(reshape(temp', [74 55])');
```

