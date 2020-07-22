$exe = split-path $args[0] -leaf
$temp = "$env:temp\$exe.xml"
$path = (split-path $args[0]).trim("\") # e.g. %homedrive%:\filename.exe
$xml = [xml](get-content "$psscriptroot\template.xml")
$xml.task.actions.exec.command = "$path\$exe"
if ($args[1]) {
  if (((get-item $args[1]).extension).split(".")[1] -eq "lnk") {
    $file = (new-object -comobject wscript.shell).createshortcut($args[1]).targetpath
    $taskname = split-path $file -leaf
  }
  else {
    $taskname = split-path $args[1] -leaf
    $file = $args[1]
  }
  $xml.task.actions.exec.arguments = "`"" + $file + "`""
  $path = split-path $args[1]
}
else {
  $taskname = $exe
}
$xml.task.principals.principal.userid = (new-object security.principal.ntaccount "$env:username").translate([security.principal.securityidentifier]).value
$xml.task.actions.exec.workingdirectory = "$path"
$xml.save($temp)
schtasks /create /tn $taskname /xml $temp
remove-item $temp