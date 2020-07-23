$exe = split-path $args[0] -leaf
$temp = "$env:temp\temp.xml"
$xml = [xml](get-content "$psscriptroot\template.xml")
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
  $n = 1
}
else {
  $taskname = $exe
  $n = 0
}
$xml.task.actions.exec.command = $args[0]
$xml.task.principals.principal.userid = (new-object security.principal.ntaccount "$env:username").translate([security.principal.securityidentifier]).value
$xml.task.actions.exec.workingdirectory = "$(split-path $args[$n])"
$xml.save($temp)
schtasks /create /tn $taskname /xml $temp
remove-item $temp