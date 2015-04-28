#!/bin/sh
aptitude search '~i !~M' -F %p > ~/packages.list
