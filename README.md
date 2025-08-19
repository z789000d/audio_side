---

## **實作題 UI 範例 ✨**

以下是以 **GetX** 作為狀態管理和路由解決方案的 UI 程式碼範例。GetX 允許我們主要使用 `StatelessWidget` 來構建頁面，避免了傳統 `StatefulWidget` 的狀態疊代複雜性。

* [**main 應用程式入口**](lib/main.dart)
* [**主 UI 畫面**](lib/page/first_page.dart)
* [**控制器**](lib/controller/first_controller.dart)
* [**usecase 業務邏輯**](lib/use_case/get_user_data_use_case.dart)

---

## **資料結構與分層範例 ✨**

此範例採用了清晰的架構分層，使用 **dataclass** 定義資料模型（`Note`、`Tag`、`Note_Tag`）作為資料庫操作的依據。同時，透過宣告**抽象類別**來定義資料操作介面，並在本地與遠端 **repository 實作**中提供具體邏輯。**UseCase** 層則作為業務邏輯的切換入口，有效地隔離了 UI 與資料存取細節。

* [**資料模型 (data class)**](lib/data/)
* [**抽象類別 (interfaces)**](lib/abstract_calss/)
* [**Repository 實作**](lib/repository/)
* [**UseCase 業務邏輯**](lib/use_case/node_repository_use_case.dart)

---

## **功能測試案例 ✨**

為了驗證不同資料來源下的功能正確性，我們設計了針對本地 (Local) 和遠端 (Remote) Repository 的測試。每個 Repository 都包含了其核心的三種功能的測試，確保其在不同環境下的穩定性。

* [**本地 Repository 測試 (3 個 function test success)**](test/local_note_repository_test.dart)
* [**遠端 Repository 測試 (3 個 function test success)**](test/remote_note_repository_test.dart)

---
