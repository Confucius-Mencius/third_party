# -*- coding: utf-8 -*-

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

import argparse
import os
import sys

sys.path.append('%s/../../py_tools' % os.path.split(os.path.realpath(__file__))[0])  # 导入上级目录中的模块
# print(sys.path)

from base import xls_util
import xls_head

import common_define_sh_file_generator
import common_define_cmake_file_generator
import common_define_make_file_generator
import inc_dir_file_generator


def do(csv_file_path, output_dir, install_prefix):
    xls_head_ = xls_head.XlsHead()
    xls_loader = xls_util.XlsLoader(csv_file_path, xls_head_.nrows, xls_head_.ncols, xls_head_.col_types)

    if xls_loader.load() != 0:
        return -1

    generator_list = [common_define_sh_file_generator.generate_common_define_sh_file,
                      common_define_cmake_file_generator.generate_common_define_cmake_file,
                      common_define_make_file_generator.generate_common_define_make_file,
                      inc_dir_file_generator.generate_inc_dir_file]

    for generator in generator_list:
        if generator(xls_head_, xls_loader.row_grid, xls_loader.col_grid, output_dir, install_prefix) != 0:
            return -1

    return 0


def test_001():
    csv_file_path = './third_party.csv'
    output_dir = './output'
    install_prefix = '/opt/third_party'

    ret = do(csv_file_path, output_dir, install_prefix)
    assert 0 == ret


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('csv_file_path', help='csv file path')
    parser.add_argument('output_dir', help='output dir')
    parser.add_argument('install_prefix', help='install prefix')

    args = parser.parse_args()
    print(args)

    return args


if __name__ == "__main__":
    args = parse_args()

    csv_file_path = os.path.realpath(args.csv_file_path)
    output_dir = os.path.realpath(args.output_dir)
    install_prefix = os.path.realpath(args.install_prefix)

    if not os.path.exists(csv_file_path):
        print('csv file %s not exist' % csv_file_path)
        sys.exit(-1)

    if do(csv_file_path, output_dir, install_prefix) != 0:
        sys.exit(-1)
