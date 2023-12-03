

$Proc  = Get-Process


foreach ($ind in $Proc) # $ind means each item , inge definerat . Sendan varje Itme i listan från $Proc


# Hur vet man vilken varibel namn man ska amvända -- hur vet jag att jag kan använda ProcessName ,
# använder Get-Process | Get-Member  för att lista all Property i det kommandot 

{
$ind.ProcessName , $ind.cpu|SORT

}