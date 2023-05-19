## check this video : https://www.youtube.com/watch?v=jyqjecyCv3A

1- bundle add cssbundling-rails
2- rails css:install:bootstrap

### to make the dropdown bootstrap menu works, you should add these :

3- bundle add jsbundling-rails
4- rails javascript:install:esbuild

6- yarn ad @hotwired/turbo-rails
7- in application.js :
    import "./controllers"
8- in index.js, remove everything and add this :
    import {application} from "./application"

9- in application.html.erb:
    remove importmap tag helper

10- in manifest.js , remove everything and add :
    //= link_tree ../images
    //link_tree ../builds