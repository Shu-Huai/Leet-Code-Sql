$PSDefaultParameterValues['*:Encoding'] = 'utf8'
Write-Host "请输入题号："
$number = Read-Host
while (-not [string]::IsNullOrWhiteSpace($number))
{
    $directory = "$number"
    if (-not (Test-Path $directory -PathType Container))
    {
        Write-Host "输入有误，请重新输入"
        Write-Host "请输入题号："
        $number = Read-Host
        continue
    }
    $problemFile = Join-Path -Path $directory -ChildPath "Problem.md"
    if (Test-Path $problemFile)
    {
        Get-Content $problemFile
    }
    $mysqlServer = "mysql.lvshuhuai.cn"
    $mysqlUser = "root"
    $createSqlFile = Join-Path -Path $directory -ChildPath "Create.sql"
    $solutionSqlFile = Join-Path -Path $directory -ChildPath "Solution.sql"
    if (Test-Path $createSqlFile)
    {
        $createSql = Get-Content $createSqlFile
        & mysql -e "$createSql" -h $mysqlServer -u $mysqlUser -pprwq0421 "leet_code"
    }
    if (Test-Path $solutionSqlFile)
    {
        $solutionSql = Get-Content $solutionSqlFile
        & mysql -e "$solutionSql" -h $mysqlServer -u $mysqlUser -pprwq0421 "leet_code"
    }
    Write-Host "请输入题号："
    $number = Read-Host
}