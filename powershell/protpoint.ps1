Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# フォームの作成
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Click to Plot Points'
$form.Width = 1500
$form.Height = 1000
$Form.Opacity = 0.5

# フォームに描画するためのグラフィックスオブジェクトを作成
$graphics = $form.CreateGraphics()

# マウスクリックイベントのハンドラ
$form.Add_MouseClick({
    param($sender, $e)

    # クリックされた位置に点を描画
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Red)
    $x = $e.X
    $y = $e.Y
    $graphics.FillEllipse($brush, $x, $y, 10, 10)
})

# フォームを表示
$form.ShowDialog()

# リソースのクリーンアップ
$graphics.Dispose()
$form.Dispose()