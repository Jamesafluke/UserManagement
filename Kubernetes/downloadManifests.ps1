$url = 'https://raw.githubusercontent.com/Jamesafluke/UserManagement/main/Kubernetes/deployment.yaml'
$url = 'https://raw.githubusercontent.com/Jamesafluke/UserManagement/main/Kubernetes/service.yaml'
$outputPath = '$(Build.ArtifactStagingDirectory)/deployment.yaml'
Invoke-WebRequest -Uri $url -OutFile $outputPath
Write-Host "Downloaded manifest to $outputPath"