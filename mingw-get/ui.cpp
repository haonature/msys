/** \file ui.cpp
 *
 * Created: JohnE, 2008-10-11
 */


#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <windowsx.h>
#include <commctrl.h>
#include <climits>
#include "package.hpp"
#include "pkgindex.hpp"
#include "pkg_const.h"
#include "resource.h"
#include "error.hh"


extern HWND g_hmainwnd;


static void LVAddPackage(HWND hlist, const Package& pkg)
{
	LVITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_IMAGE;
	lvi.iItem = INT_MAX;
	lvi.iSubItem = 0;
	char emptystr = 0;
	lvi.pszText = &emptystr;
	lvi.iImage = pkg.GetStateImage();
	lvi.lParam = reinterpret_cast< LPARAM >(&pkg);
	lvi.iItem = ListView_InsertItem(hlist, &lvi);
	lvi.mask = LVIF_TEXT;
	lvi.pszText = LPSTR_TEXTCALLBACK;
	for (int i = 1; i <= 5; ++i)
	{
		lvi.iSubItem = i;
		ListView_SetItem(hlist, &lvi);
	}
	if (lvi.iItem == 0)
	{
		ListView_SetItemState(hlist, 0,
		 LVIS_SELECTED | LVIS_FOCUSED, LVIS_SELECTED | LVIS_FOCUSED);
	}
}


extern "C" void UI_OnCategoryChange(int sel, HWND hmainwnd)
{
	ListView_DeleteAllItems(GetDlgItem(hmainwnd, IDC_COMPLIST));
	bool have_item = false;
	if (sel == 0)
	{
		for (PkgIndex::PackageIter it = PkgIndex::Packages_Begin();
		 it != PkgIndex::Packages_End();
		 ++it)
		{
			LVAddPackage(GetDlgItem(hmainwnd, IDC_COMPLIST), *it->second);
			have_item = true;
		}
	}
	else
	{
		for (PkgIndex::PackageIter it = PkgIndex::Packages_Begin();
		 it != PkgIndex::Packages_End();
		 ++it)
		{
			if (it->second->m_categories.count(sel - 1) > 0)
			{
				LVAddPackage(GetDlgItem(hmainwnd, IDC_COMPLIST), *it->second);
				have_item = true;
			}
		}
	}
	if (have_item)
	{
		ListView_SetItemState(GetDlgItem(hmainwnd, IDC_COMPLIST), 0,
		 LVIS_SELECTED | LVIS_FOCUSED, LVIS_SELECTED | LVIS_FOCUSED);
	}
	else
	{
		Static_SetText(GetDlgItem(hmainwnd, IDC_DESCTITLE), "");
		Edit_SetText(GetDlgItem(hmainwnd, IDC_FULLDESC), "");
		ComboBox_ResetContent(GetDlgItem(hmainwnd, IDC_INSTVERSION));
		EnableWindow(GetDlgItem(hmainwnd, IDC_INSTVERSION), FALSE);
	}
}


void DescWnd_SetDescription(const std::string&);

extern "C" void UI_OnListViewSelect(int sel, HWND hmainwnd)
{
	LVITEM lvitem;
	lvitem.iItem = sel;
	lvitem.iSubItem = 0;
	lvitem.mask = LVIF_PARAM;
	ListView_GetItem(GetDlgItem(hmainwnd, IDC_COMPLIST), &lvitem);
	Package* pkg = reinterpret_cast< Package* >(lvitem.lParam);
	Edit_SetText(GetDlgItem(hmainwnd, IDC_FULLDESC),
	 pkg->m_description.c_str());
	Static_SetText(GetDlgItem(hmainwnd, IDC_DESCTITLE),
	 pkg->m_title.c_str());
	ComboBox_ResetContent(GetDlgItem(hmainwnd, IDC_INSTVERSION));
	if (pkg->m_versions.size() > 0)
	{
		EnableWindow(GetDlgItem(hmainwnd, IDC_INSTVERSION), TRUE);
		std::string vstr;
		for (std::vector< PkgVersion::Ref >::const_iterator it = pkg->m_versions.begin();
		 it != pkg->m_versions.end();
		 ++it)
		{
			if ((*it)->m_status == PSTATUS_ALPHA)
				vstr = "Alpha: ";
			else
				vstr = "Stable: ";
			vstr += (*it)->m_version;
			ComboBox_AddString(GetDlgItem(hmainwnd, IDC_INSTVERSION),
			 vstr.c_str());
		}
		pkg->m_selected_version = 0;
		ComboBox_SetCurSel(GetDlgItem(hmainwnd, IDC_INSTVERSION), 0);
	}
	else
	{
		pkg->m_selected_version = -1;
		EnableWindow(GetDlgItem(hmainwnd, IDC_INSTVERSION), FALSE);
	}
}


extern "C" int VersionCompare(const char*, const char*);

extern "C" void UI_OnStateCycle(int sel, HWND hmainwnd)
{
	LVITEM lvitem;
	lvitem.iItem = sel;
	lvitem.iSubItem = 0;
	lvitem.mask = LVIF_PARAM;
	ListView_GetItem(GetDlgItem(hmainwnd, IDC_COMPLIST), &lvitem);
	Package* pkg = reinterpret_cast< Package* >(lvitem.lParam);
	if (pkg->m_installed_version.length() > 0)
	{
		if (pkg->m_selected_action == ACT_INSTALL_VERSION)
			pkg->m_selected_action = ACT_NO_CHANGE;
		else
			pkg->m_selected_action = ACT_INSTALL_VERSION;
	}
	else
	{
		if (pkg->m_selected_action == ACT_INSTALL_VERSION)
			pkg->m_selected_action = ACT_NO_CHANGE;
		else
			pkg->m_selected_action = ACT_INSTALL_VERSION;
	}
	lvitem.mask = LVIF_IMAGE;
	lvitem.iImage = pkg->GetStateImage(); 
	ListView_SetItem(GetDlgItem(hmainwnd, IDC_COMPLIST), &lvitem);
}


struct LVSortType
{
	int m_field;
	int m_reverse;

	LVSortType(int field, bool reverse)
	 : m_field(field),
	 m_reverse(reverse ? -1 : 1)
	{
	}
};

extern "C" int VersionCompare(const char*, const char*);

int CALLBACK LVSortCompare(LPARAM lp1, LPARAM lp2, LPARAM lpsort)
{
	LVSortType* st = reinterpret_cast< LVSortType* >(lpsort);
	int ret = 0;
	switch (st->m_field)
	{
	case 1:
		ret = strcmp(reinterpret_cast< Package* >(lp1)->m_id.c_str(),
		 reinterpret_cast< Package* >(lp2)->m_id.c_str());
		break;
	case 2:
		ret = VersionCompare(
		 reinterpret_cast< Package* >(lp1)->m_installed_version.c_str(),
		 reinterpret_cast< Package* >(lp2)->m_installed_version.c_str()
		 );
		break;
	case 3:
		{
			const Package& p1 = *(reinterpret_cast< Package* >(lp1));
			const Package& p2 = *(reinterpret_cast< Package* >(lp2));
			const char* p1v = (p1.m_versions.size() > 0)
			 ? p1.m_versions.front()->m_version.c_str() : "";
			const char* p2v = (p2.m_versions.size() > 0)
			 ? p2.m_versions.front()->m_version.c_str() : "";
			ret = VersionCompare(p1v, p2v);
		}
		break;
	case 5:
		ret = stricmp(reinterpret_cast< Package* >(lp1)->m_title.c_str(),
		 reinterpret_cast< Package* >(lp2)->m_title.c_str());
		break;
	};
	return ret * st->m_reverse;
};


extern "C" void UI_SortListView(int column, HWND hmainwnd)
{
	static int cur_column = 0;

	if (cur_column == column)
		cur_column = column + 6;
	else
		cur_column = column;

	LVSortType st(cur_column % 6, (cur_column >= 6));
	ListView_SortItems(GetDlgItem(hmainwnd, IDC_COMPLIST), LVSortCompare,
	 reinterpret_cast< LPARAM >(&st));
}


void UI_RefreshCategoryList()
{
	ListBox_SetCurSel(GetDlgItem(g_hmainwnd, IDC_CATLIST), 0);
	int ct = ListBox_GetCount(GetDlgItem(g_hmainwnd, IDC_CATLIST));
	for (; ct > 1; --ct)
		ListBox_DeleteString(GetDlgItem(g_hmainwnd, IDC_CATLIST), ct - 1);
	ListView_DeleteAllItems(GetDlgItem(g_hmainwnd, IDC_COMPLIST));
	for (int i = 0; i < PkgIndex::NumCategories(); ++i)
	{
		ListBox_AddString(GetDlgItem(g_hmainwnd, IDC_CATLIST),
		 PkgIndex::GetCategory(i));
	}
	UI_OnCategoryChange(0, g_hmainwnd);
}


extern "C" void LastError_MsgBox(const char* title)
{
	MessageBox(g_hmainwnd, MGLastError(), title, MB_OK | MB_ICONERROR);
}
