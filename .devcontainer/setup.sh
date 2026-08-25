#!/bin/bash
# تفعيل الإيقاف الفوري عند حدوث أي خطأ لتجنب التحميل العشوائي
set -e

cd /home/vscode
# مسح أي ملفات تالفة أو قديمة لضمان التثبيت النظيف والتوافقية
rm -rf flutter 

# جلب الإصدار المستقر مباشرة بدون تدخل يدوي
git clone https://github.com/flutter/flutter.git -b stable

# التصدير المباشر للمتغيرات لتعمل بيئة التطوير بكفاءة
echo 'export PATH="$PATH:/home/vscode/flutter/bin"' >> ~/.bashrc
export PATH="$PATH:/home/vscode/flutter/bin"

# تهيئة بيئة Web وتحديث الحزم لتحسين الأداء
flutter config --enable-web
flutter upgrade --force
flutter precache

cd /workspaces/$RepositoryName
flutter pub upgrade --major-versions
