DATEPICKER_LESS = ./build/build.less
DATEPICKER_DARK_LESS = ./build/build-dark.less
DATEPICKER_CSS = ./css/datepicker.css
DATEPICKER_DARK_CSS = ./css/datepicker-dark.css
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD DOCS
#

build:
	@echo "\n${HR}"
	@echo "Building Bootstrap DatePicker..."
	@echo "${HR}\n"
	@./node_modules/.bin/recess --compile ${DATEPICKER_LESS} > ${DATEPICKER_CSS}
	@./node_modules/.bin/recess --compile ${DATEPICKER_DARK_LESS} > ${DATEPICKER_DARK_CSS}
	@echo "Compiling LESS with Recess...               ${CHECK} Done"
	@echo "\n${HR}"
	@echo "Bootstrap DatePicker successfully built at ${DATE}."
	@echo "${HR}\n"

#
# WATCH LESS FILES
#

watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"


.PHONY: docs watch build