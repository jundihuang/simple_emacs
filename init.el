


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
;; --------------------------------
;; configurations
(require 'init-packages)
(require 'init-ui)
(require 'init-org)
(require 'init-better-defaults)
(require 'init-company)
(require 'init-dired)
(require 'init-edit)

;; progromming
(require 'init-web)

(require 'init-keybindings)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(recentf-mode 1)
(setq recentf-max-menu-item 10)
