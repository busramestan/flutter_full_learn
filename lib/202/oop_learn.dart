import 'dart:io';

import 'package:flutter_learning/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    await launchUrl(path as Uri);
  }
}

class FileDownload extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadExcepiton();

    print("a");

    return true;
  }

  //extends etmenin amacı o sınıfın özelliklerini alıp, üzerine kendi özelliklerininde katacığın anlamına gelir.

  void smsShare() {
    
  }


}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadExcepiton();

    print("a");

    return true;
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl("sms:$path" as Uri);
  }
}



class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload{
 //mixinin amacı bu metodu on yazarak sadece IFileDownload'a kazanduracağım demek.
}