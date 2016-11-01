#!/usr/bin/env make

php_files=$(wildcard **/*.php *.php)
sass_files=$(wildcard sass/*.scss)

theme_name=La cocina underscore wp theme
space :=
space +=
theme_name_esc=$(subst $(space),_,$(theme_name))
curdir=$(shell pwd)
theme_dir="$(shell basename $(curdir))"

.PHONY: all

all:
	## 1. replace \'_s\' with \'theme_dir\' in all php files
	sed -i "s#'_s'#'${theme_dir}'#g" ${php_files}
	## 2. replace '_s_' with 'themedir_' in all php files
	sed -i "s#_s_#${theme_dir}_#g" ${php_files}
	## 3. replace 'Text Domain: _s' with 'Text Domain: themedir'
	##    in style.css and style.scss
	sed -i "s#\(Text Domain:\s\)_s#\1${theme_name}#g" ${sass_files}
	## 4. replace ' _s' with escaped theme name 
	sed -i "s#\s_s# ${theme_name_esc}#g" ${php_files} ${sass_files}
	## 5. replace ' _s-' with: ' themedir-'
	sed -i "s#_s-#${theme_dir}-#g" ${php_files}
