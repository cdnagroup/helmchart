Step 1: Create a folder and a GitHub repository

Create a folder and a GitHub repository using the following command:

mkdir public-Helm-charts && cd public-Helm-charts 

Create a Public GitHub repository.

Picture1-4

Step 2: Clone the GitHub repository 

Clone your GitHub repository in this folder:

git clone <github_repository_path>   

Picture2-2

Here, my GitHub repository name is my-helm-charts 

cd my-helm-charts/ 

I will be creating a charts folder and placing my Helm charts in this folder (This is optional) 

mkdir charts && cd charts 

Picture3

As shown in the above image, create a Helm chart or copy your existing app/service Helm chart inside the charts folder. 

Here you can store multiple charts. For now, I will create a public Helm chart repository with a single Helm chart, as shown in the above image. 

Use the helm lint command to test the Helm chart locally:

helm lint <path_to_helm_chart_dir>  

Picture4

Step 3: Add robots.txt at the root location of the repository

This will avoid bot crawling on the Helm repository. 

echo -e “User-Agent: *\nDisallow: /” > robots.txt 

Picture5

Step 4: Package your Helm chart 

You need to create a .tgz file of Helm chart at root location and to do so use the following command: 

Helm package charts/observability-service/ 

Picture6

Step 5: Finally, create the index.yaml file for the Helm repository 

Use the following command to create the index.yaml file:

Helm repo index --url <github_repository_path> . 

Picture7

Note: If you make any further changes in the Helm chart, you must regenerate the index.yaml file and the .tgz file with the latest changes as mentioned in Steps 5 and 6.

However, you can use --merge flag to add new charts to an existing index incrementally.yaml:

helm repo index --url <github_repository_path> --merge index.yaml . 

Read more about Helm index here.

Step 6: Push the code to GitHub repository 

git status 

git add . 

git commit -m "your_commit_message" 

git push 

Step 7: Create GitHub Pages once the code is pushed to GitHub 

Picture8

GitHub Pages 

Go to settings of your GitHub repository -> Pages:

Picture9

Select your branch in the Source section.

Click on Save.

You will find a link for your public Helm chart repository. 

Click on the link and wait for some time to see your README.md contents on the screen, as shown below.



Step 8: Add Helm repository locally 

For this, use the following command:

Helm repo add myrepo <github_repository_path> 

Where ‘myrepo’ is the local repository name. 

To check your repository Helm charts and its versions, use: 

Helm search repo myrepo 

Picture10

Step 9: Install this Helm chart into your cluster 

To install Helm charts into cluster use:

helm install <release> myrepo/obs-helm-chart -n <namespace> 

Check your pods and services:

kubectl get po -n <namespace> 

kubectl get svc -n <namespace>  

Chart Cleanup and Helm Rollback

Finally, to remove  all the resources associated with the last release of the chart as well as the release history, freeing it up for the future, use the following command: 

helm delete <release> -n <namespace> 

And for Helm Rollback and to see revision numbers, run:

Helm history RELEASE –n <namespace> 

helm rollback <release> [REVISION] -n <namespace> 

Now coming to the business end - here are the advantages of using GitHub for creating the Helm repository:

You can serve all static websites directly from the repository.
It supports custom domains. You are allowed to host a static website on GitHub pages at no cost. It deploys straight from Git.
And it provides a secure hosting environment.
However, there are some limitations too, such as:

GitHub Pages sites come with a bandwidth size limit of 100GB/ month.
Repos must not be more than 1 GB in size.
Only GitHub Pro, GitHub Enterprise Cloud, GitHub Team, and GitHub Enterprise Server allow you to add GitHub Pages for a private GitHub repository.
Considering the advantages, I recommend using GitHub to create Helm Repository. I have configured a public Helm repository using GitHub Pages and GitHub repository. Try it once; if you still think you have difficulties with creating that, feel free to comment below, and I will be more than happy to help you.



### create package zip
*helm package charts/fastapi*

Helm package charts\fastapi
helm repo index --url https://cdnagroup.github.io/helmchart  --merge index.yaml .

### update index 
*Helm repo index . --url https://cdnagroup.github.io/helmchart*
*helm repo index --url https://cdnagroup.github.io/helmchart --merge index.yaml .
