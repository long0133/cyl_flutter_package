class XMLTest{

  static String xmlStr2 = '''
  <table>
        <tr>
            <td border="0" width="5%">
                <para>
                    <text>ON</text>
                </para>
            </td>
            <td width="5%">
                <para>
                    <text>:</text>
                </para>
            </td>
            <td>
                <para>
                    <text>白色 ON 灯亮。</text>
                </para>
                <para>
                    <text>若 CABIN PRESS 面板上的 DITCHING 按钮在正常位：</text>
                </para>
                <unlitem linestartsign="#D800" linestartserialid="c3ce6192742f4f64af3b06c37c89026a">冲压空气进气口打开。</unlitem>
                <unlitem linestartsign="#D800" linestartserialid="c3ce6192742f4f64af3b06c37c89026a">如果 Δp ≥ 1PSI:外流活门控制保持正常。无紧急冲压空气流入。</unlitem>
                <unlitem linestartsign="#D800" linestartserialid="c3ce6192742f4f64af3b06c37c89026a">如果 Δp &lt; 1PSI:当自动控制下, 外流活门打开大约 50%。人工控制情况下外流活门不会自动打开。紧急冲压空气直接供向混合装置。</unlitem>
            </td>
        </tr>
    </table>
  ''';


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