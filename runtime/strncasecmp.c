/*
 * strncasecmp.c
 *
 * Oldnames from ANSI header string.h
 *
 * Some wrapper functions for those old name functions whose appropriate
 * equivalents are not simply underscore prefixed.
 *
 * Contributors:
 *  Created by Colin Peters <colin@bird.fu.is.saga-u.ac.jp>
 *
 *  THIS SOFTWARE IS NOT COPYRIGHTED
 *
 *  This source code is offered for use in the public domain. You may
 *  use, modify or distribute it freely.
 *
 *  This code is distributed in the hope that it will be useful but
 *  WITHOUT ANY WARRANTY. ALL WARRENTIES, EXPRESS OR IMPLIED ARE HEREBY
 *  DISCLAMED. This includes but is not limited to warrenties of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * $Revision: 1.3 $
 * $Author: earnie $
 * $Date: 2004-04-22 16:21:13 $
 *
 */

#include <string.h>

int
strncasecmp (const char *sz1, const char *sz2, size_t sizeMaxCompare)
{
  return _strnicmp (sz1, sz2, sizeMaxCompare);
}
