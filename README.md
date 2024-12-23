# Basic hugo site

🌎 https://mugtree.github.io/uk-trees-hugo-demo/

- Pico CSS speed up development
- Basic use of templates and partials
- Content created by AI (CGPT) and added to content folder (content.md and qanda.json)
- Images initially resized using ImageMagik - see workings dir
- Hugo image functions for thumbnails

## Basic use of modules

- https://gohugo.io/hugo-modules/
- https://blog.hugomods.com/posts/2023/03/how-to-use-hugo-modules/
- https://discourse.gohugo.io/t/how-to-show-images-on-post-pages-if-theyre-located-in-the-assets-folder/34276
- https://gohugo.io/content-management/image-processing/

## Todo

- [x] sizing for screen sizes - media queries
- [x] Add a robots.txt to keep out of indexes
- [x] Add a githubpages script to deploy

## Questions

How to test the type that resources.Get returns?

```
{{ $img := resources.Get .Params.Image.Path }} {{ with $img}} {{ $img :=
$img.Crop "340x160" }}
<img
  loading="lazy"
  width="340px"
  class="grid-img"
  src="{{ $img.RelPermalink }}"
/>
{{ end }}
```

Something like this

```
{{ $img := resources.Get .Params.Image.Path }}
<div>
  {{ if and $img (eq $img.ResourceType "image") }} its an image {{ end}}
</div>
```

## To add

- [] Using markdown attributes - add a bit of flexiblity
  https://gohugo.io/content-management/markdown-attributes
  ..
