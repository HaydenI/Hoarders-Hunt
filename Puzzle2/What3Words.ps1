param($csv_file)

function APICall($csv) {
$headers=@{}
$headers.Add("Content-Type", "application/json")
$response = Invoke-WebRequest -Uri "https://api.what3words.com/v3/convert-to-coordinates?words=$($csv.Word1).$($csv.Word2).$($csv.Word3)&key=[API-KEY]" -Method GET -Headers $headers
write-host $response
}

$date = Get-Date -format "yyyy-MM-dd_HHmm"
Start-Transcript -Path "What3Words$date.txt"
Import-Csv $csv_file | ForEach-Object { APICall $_ }
Stop-Transcript