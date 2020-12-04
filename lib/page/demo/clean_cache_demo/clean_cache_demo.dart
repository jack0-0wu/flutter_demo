import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../../util/custom_widget.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: clean_cache_demo
/// Author: Jack
/// Date: 2020/12/4
/// Description:
class CleanCacheDemo extends StatefulWidget {
  @override
  _CleanCacheDemoState createState() => _CleanCacheDemoState();
}

class _CleanCacheDemoState extends State<CleanCacheDemo> {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  ///加载缓存
  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      print('临时目录大小: ' + value.toString());
      setState(() {
        // _cacheSizeStr = _renderSize(value);
      });
    } catch (err) {
      print(err);
    }
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  void _clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      logger.d('清除缓存成功');
      logger.d('清除缓存成功');
    } catch (e) {
      print(e);
      logger.d('清除缓存失败');
    } finally {
      //此处隐藏加载loading
    }
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "清理应用缓存"),
      body: ListView(
        children: [
          Column(
            children: [
              Button(
                  text: "获取缓存",
                  onTap: () {
                    loadCache();
                  }),
              Button(
                  text: "清理缓存",
                  onTap: () {
                    _clearCache();
                  }),
              Font(text: "使用path_provider获取缓存文件夹路径，调用dart:io包下的方法删除缓存文件夹")
            ],
          ),
        ],
      ),
    );
  }
}
