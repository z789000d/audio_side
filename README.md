---

## **實作題 UI 範例 ✨**

以下是以 **GetX** 作為狀態管理和路由解決方案的 UI 程式碼範例。GetX 允許我們主要使用 `StatelessWidget` 來構建頁面，避免了傳統 `StatefulWidget` 的狀態疊代複雜性。

* [**main 應用程式入口**](lib/main.dart)
* [**主 UI 清單畫面**](lib/page/first_page.dart)
* [**播放畫面**](lib/page/audio_page.dart)
* [**主清單畫面控制器**](lib/controller/first_controller.dart)
* [**播放畫面控制器**](lib/controller/audio_page_controller.dart)

---

## **資料結構與分層範例 ✨**

範例分層，使用 **dataclass** 定義資料模型。 **repository 實作**中提供具體邏輯。**UseCase** 業務邏輯口，隔離了 UI 與資料 **enum** 宣告 特殊字串。

* [**Api 回來的data 細項**](lib/data/audio_data.dart)
* [**Api 回來的data 主**](lib/data/audio_list_data.dart)
* [**Repository 下載檔案api層**](lib/repository/download_file.dart)
* [**Repository 獲取audio list api層**](lib/repository/get_audio.dart)
* [**UseCase 判斷該檔案是否存在本地 邏輯層**](lib/use_case/check_audio_exist_use_case.dart)
* [**UseCase 下載檔案 邏輯層**](lib/use_case/download_audio_use_case.dart)
* [**UseCase 獲取audio list 邏輯層**](lib/use_case/get_audio_use_case.dart)
* [**UseCase 播放音樂 邏輯層**](lib/use_case/play_audio_use_case.dart)
* [**enum api 特殊字串宣告**](lib/enum/language.dart)
  
---

## **功能解說案例 ✨**



* [**本地 Repository 測試 (3 個 function test success)**](test/local_note_repository_test.dart)
* [**遠端 Repository 測試 (3 個 function test success)**](test/remote_note_repository_test.dart)

---
