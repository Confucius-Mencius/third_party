# -*- coding: utf-8 -*-

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

import os
import sys

sys.path.append('%s/../../py_tools' % os.path.split(os.path.realpath(__file__))[0])  # 导入上级目录中的模块
# print(sys.path)

from base import file_util, xls_util
import xls_head


def output_content(fp, xls_head_, xls_row_grid, xls_col_grid, indent):
    for xls_row in xls_row_grid.row_list:
        if not xls_row.get_cell(xls_head_.conf['use']['col']).content:
            continue

        if xls_row.get_cell(xls_head_.conf['inc']['col']).content:
            fp.write(os.linesep)

            content = [indent, '"-I${THIRD_PARTY_INSTALL_PREFIX}/',
                       xls_row.get_cell(xls_head_.conf['key']['col']).content.lower(), '/include"']
            fp.write(''.join(content).encode('utf-8'))


def generate_inc_dir_file(xls_head_, xls_row_grid, xls_col_grid, output_dir, install_prefix):
    file_path = os.path.join(output_dir, 'inc_dir.txt')
    file_util.del_file(file_path)
    file_util.make_dir(output_dir)

    try:
        fp = open(file_path, "wb")

        content = ['THIRD_PARTY_INSTALL_PREFIX=', install_prefix, '/${BUILD_TYPE}', os.linesep]
        fp.write(''.join(content).encode('utf-8'))

        output_content(fp, xls_head_, xls_row_grid, xls_col_grid, '')

        fp.close()
        print('=== generate %s done ===' % file_path)

        return 0
    except Exception as e:
        print('exception: %s' % e)
        return -1


def test_001():
    xls_head_ = xls_head.XlsHead()
    xls_loader = xls_util.XlsLoader('./third_party.csv', xls_head_.nrows, xls_head_.ncols, xls_head_.col_types)
    assert 0 == xls_loader.load()
    assert 0 == generate_inc_dir_file(xls_head_, xls_loader.row_grid, xls_loader.col_grid,
                                      './output', '/opt/third_party')


if __name__ == "__main__":
    test_001()
