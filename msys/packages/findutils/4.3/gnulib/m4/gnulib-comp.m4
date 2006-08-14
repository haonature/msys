# Copyright (C) 2004 Free Software Foundation, Inc.
# This file is free software, distributed under the terms of the GNU
# General Public License.  As a special exception to the GNU General
# Public License, this file may be distributed as part of a program
# that contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the compiled summary of the specification in
# gnulib-cache.m4. It lists the computed macro invocations that need
# to be invoked from configure.ac.
# In projects using CVS, this file can be treated like other built files.


# This macro should be invoked from ./configure.in, in the section
# "Checks for programs", right after AC_PROG_CC, and certainly before
# any checks for libraries, header files, types and library functions.
AC_DEFUN([gl_EARLY],
[
  AC_REQUIRE([AC_GNU_SOURCE])
  AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
])

# This macro should be invoked from ./configure.in, in the section
# "Check for header files, types and library functions".
AC_DEFUN([gl_INIT],
[
AM_CONDITIONAL([GL_COND_LIBTOOL], [false])
  gl_FUNC_ALLOCA
  gl_FUNC_ATEXIT
  AC_FUNC_CANONICALIZE_FILE_NAME
  gl_FUNC_CHDIR_LONG
  gl_CLOSEOUT
  gl_FUNC_DIRFD
  gl_DIRNAME
  gl_ERROR
  gl_EXITFAIL
  dnl gl_USE_SYSTEM_EXTENSIONS must be added quite early to configure.ac.
  gl_FCNTL_SAFER
  gl_FILEBLOCKS
  gl_FILEMODE
  gl_FILE_NAME_CONCAT
  # No macro. You should also use one of fnmatch-posix or fnmatch-gnu.
  gl_FUNC_FNMATCH_GNU
  gl_FUNC_FPENDING
  gl_FUNC_FTS
  gl_FUNC_GETCWD
  gl_FUNC_GETDELIM
  gl_FUNC_GETLINE
  gl_GETOPT
  dnl you must add AM_GNU_GETTEXT([external]) or similar to configure.ac.
  gl_HASH
  gl_HUMAN
  gl_IDCACHE
  gl_FUNC_LSTAT
  AC_FUNC_MALLOC
  gl_MBCHAR
  gl_MBITER
  gl_FUNC_MEMCHR
  gl_FUNC_MEMCMP
  gl_FUNC_MEMPCPY
  gl_FUNC_MEMRCHR
  gl_FUNC_MEMSET
  gl_FUNC_MKTIME
  gl_MODECHANGE
  gl_MOUNTLIST
  gl_FUNC_OPENAT
  gl_PATHMAX
  gl_QUOTE
  gl_QUOTEARG
  gl_FUNC_READLINK
  AC_FUNC_REALLOC
  gl_REGEX
  gl_C_RESTRICT
  gl_FUNC_RPMATCH
  gl_SAVE_CWD
  gl_SAVEDIR
  gt_TYPE_SSIZE_T
  gl_STAT_MACROS
  AM_STDBOOL_H
  gl_STDIO_SAFER
  gl_FUNC_STPCPY
  gl_STRCASE
  gl_FUNC_STRDUP
  gl_FUNC_GNU_STRFTIME
  gl_FUNC_STRSTR
  gl_FUNC_STRTOIMAX
  gl_FUNC_STRTOL
  gl_FUNC_STRTOLL
  gl_FUNC_STRTOUL
  gl_FUNC_STRTOULL
  gl_FUNC_STRTOUMAX
  gl_TIME_R
  gl_UNISTD_SAFER
  gl_XALLOC
  gl_XGETCWD
  gl_XREADLINK
  gl_XSTRTOL
  gl_XSTRTOUMAX
  gl_YESNO
])

# This macro records the list of files which have been installed by
# gnulib-tool and may be removed by future gnulib-tool invocations.
AC_DEFUN([gl_FILE_LIST], [
  build-aux/config.rpath
  lib/__fpending.c
  lib/__fpending.h
  lib/alloca.c
  lib/alloca_.h
  lib/argmatch.c
  lib/argmatch.h
  lib/atexit.c
  lib/basename.c
  lib/canonicalize.c
  lib/canonicalize.h
  lib/chdir-long.c
  lib/chdir-long.h
  lib/closeout.c
  lib/closeout.h
  lib/creat-safer.c
  lib/cycle-check.c
  lib/cycle-check.h
  lib/dev-ino.h
  lib/dirfd.c
  lib/dirfd.h
  lib/dirname.c
  lib/dirname.h
  lib/dup-safer.c
  lib/error.c
  lib/error.h
  lib/exit.h
  lib/exitfail.c
  lib/exitfail.h
  lib/fcntl--.h
  lib/fcntl-safer.h
  lib/fd-safer.c
  lib/fileblocks.c
  lib/filemode.c
  lib/filemode.h
  lib/filenamecat.c
  lib/filenamecat.h
  lib/fnmatch.c
  lib/fnmatch_.h
  lib/fnmatch_loop.c
  lib/fopen-safer.c
  lib/fts-cycle.c
  lib/fts.c
  lib/fts_.h
  lib/getcwd.c
  lib/getcwd.h
  lib/getdelim.c
  lib/getdelim.h
  lib/getline.c
  lib/getline.h
  lib/getopt.c
  lib/getopt1.c
  lib/getopt_.h
  lib/getopt_int.h
  lib/gettext.h
  lib/hash.c
  lib/hash.h
  lib/human.c
  lib/human.h
  lib/idcache.c
  lib/intprops.h
  lib/lstat.c
  lib/lstat.h
  lib/malloc.c
  lib/mbchar.c
  lib/mbchar.h
  lib/mbuiter.h
  lib/memchr.c
  lib/memcmp.c
  lib/mempcpy.c
  lib/mempcpy.h
  lib/memrchr.c
  lib/memrchr.h
  lib/memset.c
  lib/mktime.c
  lib/modechange.c
  lib/modechange.h
  lib/mountlist.c
  lib/mountlist.h
  lib/open-safer.c
  lib/openat-die.c
  lib/openat.c
  lib/openat.h
  lib/pathmax.h
  lib/pipe-safer.c
  lib/quote.c
  lib/quote.h
  lib/quotearg.c
  lib/quotearg.h
  lib/readlink.c
  lib/realloc.c
  lib/regcomp.c
  lib/regex.c
  lib/regex.h
  lib/regex_internal.c
  lib/regex_internal.h
  lib/regexec.c
  lib/rpmatch.c
  lib/save-cwd.c
  lib/save-cwd.h
  lib/savedir.c
  lib/savedir.h
  lib/stat-macros.h
  lib/stdbool_.h
  lib/stdio--.h
  lib/stdio-safer.h
  lib/stpcpy.c
  lib/stpcpy.h
  lib/strcase.h
  lib/strcasecmp.c
  lib/strdup.c
  lib/strdup.h
  lib/strftime.c
  lib/strftime.h
  lib/stripslash.c
  lib/strncasecmp.c
  lib/strnlen1.c
  lib/strnlen1.h
  lib/strstr.c
  lib/strstr.h
  lib/strtoimax.c
  lib/strtol.c
  lib/strtoll.c
  lib/strtoul.c
  lib/strtoull.c
  lib/strtoumax.c
  lib/time_r.c
  lib/time_r.h
  lib/unistd--.h
  lib/unistd-safer.h
  lib/verify.h
  lib/xalloc-die.c
  lib/xalloc.h
  lib/xgetcwd.c
  lib/xgetcwd.h
  lib/xmalloc.c
  lib/xreadlink.c
  lib/xreadlink.h
  lib/xstrtol.c
  lib/xstrtol.h
  lib/xstrtoul.c
  lib/xstrtoumax.c
  lib/yesno.c
  lib/yesno.h
  m4/alloca.m4
  m4/atexit.m4
  m4/canonicalize.m4
  m4/chdir-long.m4
  m4/closeout.m4
  m4/codeset.m4
  m4/d-ino.m4
  m4/dirfd.m4
  m4/dirname.m4
  m4/dos.m4
  m4/error.m4
  m4/exitfail.m4
  m4/extensions.m4
  m4/fcntl-safer.m4
  m4/fileblocks.m4
  m4/filemode.m4
  m4/filenamecat.m4
  m4/fnmatch.m4
  m4/fpending.m4
  m4/fstypename.m4
  m4/fts.m4
  m4/getcwd-path-max.m4
  m4/getcwd.m4
  m4/getdelim.m4
  m4/getline.m4
  m4/getopt.m4
  m4/gettext.m4
  m4/glibc2.m4
  m4/glibc21.m4
  m4/hash.m4
  m4/human.m4
  m4/iconv.m4
  m4/idcache.m4
  m4/intdiv0.m4
  m4/intmax.m4
  m4/intmax_t.m4
  m4/inttypes-pri.m4
  m4/inttypes.m4
  m4/inttypes_h.m4
  m4/isc-posix.m4
  m4/lcmessage.m4
  m4/lib-ld.m4
  m4/lib-link.m4
  m4/lib-prefix.m4
  m4/longdouble.m4
  m4/longlong.m4
  m4/ls-mntd-fs.m4
  m4/lstat.m4
  m4/mbchar.m4
  m4/mbiter.m4
  m4/mbrtowc.m4
  m4/mbstate_t.m4
  m4/memchr.m4
  m4/memcmp.m4
  m4/mempcpy.m4
  m4/memrchr.m4
  m4/memset.m4
  m4/mktime.m4
  m4/modechange.m4
  m4/mountlist.m4
  m4/nls.m4
  m4/onceonly_2_57.m4
  m4/openat.m4
  m4/pathmax.m4
  m4/po.m4
  m4/printf-posix.m4
  m4/progtest.m4
  m4/quote.m4
  m4/quotearg.m4
  m4/readlink.m4
  m4/regex.m4
  m4/restrict.m4
  m4/rpmatch.m4
  m4/save-cwd.m4
  m4/savedir.m4
  m4/signed.m4
  m4/size_max.m4
  m4/ssize_t.m4
  m4/stat-macros.m4
  m4/stdbool.m4
  m4/stdint_h.m4
  m4/stdio-safer.m4
  m4/stpcpy.m4
  m4/strcase.m4
  m4/strdup.m4
  m4/strerror_r.m4
  m4/strftime.m4
  m4/strstr.m4
  m4/strtoimax.m4
  m4/strtol.m4
  m4/strtoll.m4
  m4/strtoul.m4
  m4/strtoull.m4
  m4/strtoumax.m4
  m4/time_r.m4
  m4/tm_gmtoff.m4
  m4/uintmax_t.m4
  m4/ulonglong.m4
  m4/unistd-safer.m4
  m4/wchar_t.m4
  m4/wint_t.m4
  m4/xalloc.m4
  m4/xgetcwd.m4
  m4/xreadlink.m4
  m4/xsize.m4
  m4/xstrtol.m4
  m4/xstrtoumax.m4
  m4/yesno.m4
])
