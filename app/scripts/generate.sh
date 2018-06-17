SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo $SCRIPT_DIR
rm $SCRIPT_DIR/swagger.json
wget https://kissybnts.github.io/swagger-auto-pr-sample/swagger.json -O $SCRIPT_DIR/swagger.json
swagger-codegen generate -i $SCRIPT_DIR/swagger.json -l kotlin --model-package com.kissybnts.swagger_pr_sample_android.model --model-name-suffix Json -o $SCRIPT_DIR/dist

find $SCRIPT_DIR/../src/main/kotlin/com/kissybnts/swagger_pr_sample_android/model | grep -v -E '/internal/' | grep "Json.kt" | xargs rm
cp -r $SCRIPT_DIR/dist/src/main/kotlin/com/kissybnts/swagger_pr_sample_android/model $SCRIPT_DIR/../src/main/kotlin/com/kissybnts/swagger_pr_sample_android

rm -rf $SCRIPT_DIR/dist