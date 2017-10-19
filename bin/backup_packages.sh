#!/bin/sh
aptitude search '~i !~M' -F %p > ~/dev/djvdorp/ddo/packages.list
