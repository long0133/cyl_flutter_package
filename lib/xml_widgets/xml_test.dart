class XMLTest{
  static String xmlStr = '''
  <table>
        <thead></thead>
        <tbody>
            <tr>
                <td valign="1" rowspan="2"></td>
                <td valign="1" colspan="2">
                    <para>
                        <text>左升降舵</text>
                    </para>
                </td>
                <td valign="1">
                    <para>
                        <text>THS</text>
                    </para>
                </td>
                <td valign="1" colspan="2">
                    <para>
                        <text>右升降舵</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td valign="1">
                    <para>
                        <text>蓝色</text>
                    </para>
                </td>
                <td valign="1">
                    <para>
                        <text>绿色</text>
                    </para>
                </td>
                <td valign="1">
                    <para>
                        <text>绿和黄系统</text>
                    </para>
                </td>
                <td valign="1">
                    <para>
                        <text>黄</text>
                    </para>
                </td>
                <td valign="1">
                    <para align="1">
                        <text>蓝色</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para align="0">
                        <text>正常操作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>单一失效</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>双重失效</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>ELAC 2 + ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ SEC 1</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>ELAC 1+ SEC 2</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 2+ SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿 + 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>不工作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝 + 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝+黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>三重失效</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>升降舵副翼计算机 (ELAC) 2</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>ELAC 1 + SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 2+ SEC 1</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>回中</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>机械</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>回中</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td rowspan="2"></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td rowspan="2"></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿 + 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>不工作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝 + 绿系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝+黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>升降舵副翼计算机 (ELAC) 1</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 2+ SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td rowspan="2"></td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td rowspan="2"></td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1+ 绿系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 2</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿 + 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>不工作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>SEC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝 + 绿系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝+黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC2</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1+ 绿系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>+ 蓝系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿 + 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>不工作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝 + 绿系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝+黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>SEC 1</text>
                    </para>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>绿 + 黄系统</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 1</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>不工作</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para align="1">
                        <text>ELAC 1</text>
                    </para>
                </td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝 + 绿系统</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <para>
                        <text>蓝+黄系统</text>
                    </para>
                </td>
                <td></td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td>
                    <para>
                        <text>ELAC 2</text>
                    </para>
                </td>
                <td colspan="2">
                    <para>
                        <text>阻尼</text>
                    </para>
                </td>
            </tr>
        </tbody>
    </table>
  ''';
}