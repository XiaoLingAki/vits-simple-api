import os
import sys

JSON_AS_ASCII = False
MAX_CONTENT_LENGTH = 5242880

#端口
PORT= 23456
#上传文件的临时路径
UPLOAD_FOLDER = os.path.dirname(__file__) + "/upload"
#项目的绝对路径
abs_path = os.path.join(os.path.dirname(os.path.realpath(sys.argv[0])))

'''
vits模型路径填写方法，MODEL_LIST中的每一行是
[abs_path+"/Model/{模型文件夹}/{.pth模型}", abs_path+"/Model/{模型文件夹}/config.json"],
也可以写相对路径或绝对路径，由于windows和linux路径写法不同，用上面的写法或绝对路径最稳妥
示例：
MODEL_LIST = [
    [abs_path+"/Model/Nene_Nanami_Rong_Tang/1374_epochs.pth", abs_path+"/Model/Nene_Nanami_Rong_Tang/config.json"],
    [abs_path+"/Model/Zero_no_tsukaima/1158_epochs.pth", abs_path+"/Model/Zero_no_tsukaima/config.json"],
    [abs_path+"/Model/g/G_953000.pth", abs_path+"/Model/g/config.json"],
]
'''
#模型加载列表
MODEL_LIST = [

]