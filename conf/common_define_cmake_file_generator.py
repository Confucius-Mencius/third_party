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

            content = [indent, 'set(', xls_row.get_cell(xls_head_.conf['key']['col']).content,
                       '_INC_DIR ${THIRD_PARTY_INSTALL_PREFIX}/', xls_row.get_cell(xls_head_.conf['key']['col']).content.lower(),
                       '/include)', os.linesep]
            fp.write(''.join(content).encode('utf-8'))

        libs_flag = False
        bin_flag = False

        if len(xls_row.get_cell(xls_head_.conf['libs']['col']).content) > 0:
            libs_flag = True

        if len(xls_row.get_cell(xls_head_.conf['bin']['col']).content) > 0:
            bin_flag = True

        if libs_flag:
            content = [indent, 'set(', xls_row.get_cell(xls_head_.conf['key']['col']).content,
                       '_LIB_DIR ${THIRD_PARTY_INSTALL_PREFIX}/', xls_row.get_cell(xls_head_.conf['key']['col']).content.lower(),
                       '/lib)', os.linesep]
            fp.write(''.join(content).encode('utf-8'))

        if bin_flag:
            content = [indent, 'set(', xls_row.get_cell(xls_head_.conf['key']['col']).content,
                       '_BIN_DIR ${THIRD_PARTY_INSTALL_PREFIX}/', xls_row.get_cell(xls_head_.conf['key']['col']).content.lower(),
                       '/bin)', os.linesep]
            fp.write(''.join(content).encode('utf-8'))

        if libs_flag:
            content = [indent, 'set(', xls_row.get_cell(xls_head_.conf['key']['col']).content,
                       '_LIB_NAME ', xls_row.get_cell(xls_head_.conf['libs']['col']).content, ')', os.linesep]
            fp.write(''.join(content).encode('utf-8'))

        if bin_flag:
            content = [indent, 'set(', xls_row.get_cell(xls_head_.conf['key']['col']).content,
                       '_BIN_NAME ', xls_row.get_cell(xls_head_.conf['bin']['col']).content, ')', os.linesep]
            fp.write(''.join(content).encode('utf-8'))


def generate_common_define_cmake_file(xls_head_, xls_row_grid, xls_col_grid, output_dir, install_prefix):
    file_path = os.path.join(output_dir, 'common_define.cmake')
    file_util.del_file(file_path)
    file_util.make_dir(output_dir)

    try:
        fp = open(file_path, "wb")

        content = '''###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

'''
        fp.write(content.encode('utf-8'))

        content = ['string(TOLOWER ${CMAKE_BUILD_TYPE} BUILD_TYPE)', os.linesep]
        fp.write(''.join(content).encode('utf-8'))

        content = ['set(THIRD_PARTY_INSTALL_PREFIX ', install_prefix, '/${BUILD_TYPE})', os.linesep]
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
    assert 0 == generate_common_define_cmake_file(xls_head_, xls_loader.row_grid, xls_loader.col_grid,
                                                  './output', '/opt/third_party')


if __name__ == "__main__":
    test_001()
