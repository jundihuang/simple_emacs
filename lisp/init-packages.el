 (when (>= emacs-major-version 24)
     (require 'package)
     ;;(package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
                company
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                smooth-scrolling
                ivy
                ;;evil
                ;;smex ;; 更好的 M-X
                helm-smex
                smartparens
                popwin
                expand-region
                js2-refactor
                iedit
                yasnippet
                ;; --- Better Search ---
                helm-ag
                dumb-jump ;; 方法跳转
                ;; --- Major Mode ---
                js2-mode
                markdown-mode
                web-mode
                vue-mode
                yaml-mode

                ;; --- Minor Mode ---
                nodejs-repl
                exec-path-from-shell
                reveal-in-osx-finder
                ;; --- Linter ---
                flycheck
                ;; --- Project ---
                ;;projectile
                helm-projectile
                ;; Ruby
                yari
                rvm
                bundler
                inf-ruby
                robe
                rubocop
                motion-mode
                rinari
                projectile-rails
                rspec-mode
                ;; frontend
                vue-mode
                ;; git
                git-blamed
                gitignore-mode
                gitconfig-mode
                magit
                ;; --- Themes ---
                monokai-theme
                eziam-theme
                color-theme-sanityinc-tomorrow
                atom-one-dark-theme
                plan9-theme
                twilight-bright-theme
                solarized-theme
                organic-green-theme
                ;;color-theme-tomorrow
                ;;color-theme-sanityinc-solarized
                ;; solarized-theme
                ;; --- UI ---
                switch-window
                windswap
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(provide 'init-packages)
