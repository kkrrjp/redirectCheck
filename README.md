test
# redirectCheck
----------------------------------
指定したファイルを読み込んでリダイレクトの確認を行う。

HTTPレスポンスヘッダーのlocation , codeで判定する。

### 読み込みファイルのフォーマット
----------------------------------

タブ区切りのテキスト

	リダイレクト元URL	リダイレクト先URL	リダイレクトコード

例）
	
	http://www.yahoo.co.jp	http://m.yahoo.co.jp	302
	
	http://animita.tv	http://animita.tv/top	302

