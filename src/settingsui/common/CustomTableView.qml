/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Device Utilities module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

ColumnLayout {
    id: root
    spacing: 0
    Layout.fillHeight: true
    Layout.fillWidth: true

    property var headerTexts: []
    property var roleNames: []
    property alias model: listView.model
    signal clicked(int index)

    Rectangle {
        height: 40
        Layout.fillWidth: true
        color: "#80c342"

        Row {
            anchors.fill: parent
            anchors.leftMargin: 10
            spacing: 10

            Repeater {
                model: root.headerTexts.length
                Text {
                    width: parent.width / root.headerTexts.length
                    text: root.headerTexts[index]
                    color: "white"
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ListView {
        id: listView
        Layout.fillHeight: true
        Layout.fillWidth: true
        clip: true

        Rectangle {
            anchors.fill: parent
            border.color: "#bdbebf"
            border.width: 1
            color: "transparent"
        }

        ScrollBar.vertical: ScrollBar {}

        delegate: Rectangle {
            width: parent.width
            height: 30
            color: index % 2 ? "#e3e3e3" : "white"
            property var delegateData: modelData

            Row {
                anchors.fill: parent
                anchors.leftMargin: 10
                spacing: 10

                Repeater {
                    model: root.roleNames.length

                    Text {
                        width: parent.width / root.roleNames.length
                        text: delegateData[root.roleNames[index]]
                        anchors.verticalCenter: parent.verticalCenter
                        antialiasing: false
                        smooth: false
                        renderType: listView.moving ? Text.NativeRendering : Text.QtRendering
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: root.clicked(index)
            }
        }
    }
}
